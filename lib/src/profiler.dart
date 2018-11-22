// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Original author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.
//
import 'dart:convert' as cvt;

import 'package:core/core.dart';

import 'profile_report.dart';
import 'subject.dart';

typedef Element Updater(Element element);

enum ProfileFormat { text, json, xml }


class Profiler {
  /// The name of this profile.
  final String name;

  /// A [String] containing the URL where the Profile is stored.
  final Uri url;

//  final List<String> lines;
//    final GlobalRule globals;
  /// The subject of the [Dataset] being processed.
  final TrialSubject subject;

  /// The [Parameters] related to [subject].
  final Map<String, RegExp> parameters;

  //make this profile
  final Profile profile;

  final ProfileReport report;

  final Map<String, String> comments;
//    final List<Rule> rules;
  final Map<String, String> errors;

  ///Fix: make this constant
  Profiler(this.name, String url, this.profile, this.subject, this.parameters)
      : url = Uri.parse(url),
        // globals =  GlobalRule(),
        // this.profile
        report =  ProfileReport(name, url, subject),
        comments = {},
        //   rules = [],
        errors = {};

  //TODO: finish if needed for creating constant profile such as anonymization.
  Profiler._(
      this.name,
      this.url,
      this.profile,
      this.subject,
      this.parameters,
      this.report,
      this.comments,
//      this.rules,
      this.errors);

  /// Returns the modified Dataset after applying this profile to [rds].
  Dataset process(Dataset rds) {
    checkRetainRemoveGroupsConflict();
    checkRetainRemoveKeysConflict();
    checkRequiredElements(rds);
    processGroupsToDelete(rds);
    processKeysToDelete(rds);
    replaceUids(
      rds,
    );
    replaceDates(rds);
    processPatient(rds);
    processKeysToBlank(rds);
    processKeysToNoValue(rds);
    return rds;
  }

  /// Ensures that all required Elements are present with appropriate values.
  bool checkRequiredKeys(Dataset rds) {}

  /// Ensures that all Elements that are required to be present are present.
  bool checkRequiredElements(Dataset rds) {}

  /// Ensures that no groups are on both the [profile].groupsToRetain and
  /// [profile]groupsToRemove.[List]s.
  bool checkRetainRemoveGroupsConflict() {
    final conflicts =
        _checkForListConflicts(profile.groupsToRetain, profile.groupsToRemove);
    if (conflicts != null && conflicts.isNotEmpty) {
      log.error('The following groups have conflicts in the '
          'retain and remove Lists: $conflicts');
      report.groupRetainDeleteConflicts.addAll(conflicts);
      return false;
    }
    return true;
  }

  /// Ensures that no groups are on both the [profile].keysToRetain and
  /// [profile].keysToRemove [List]s.
  bool checkRetainRemoveKeysConflict() {
    final conflicts =
        _checkForListConflicts(profile.keysToRetain, profile.keysToRemove);
    if (conflicts != null && conflicts.isNotEmpty) {
      log.error('The following _keys_ have conflicts in the '
          'retain and remove Lists: $conflicts');
      report.keyRetainDeleteConflicts.addAll(conflicts);
      return false;
    }
    return true;
  }

  // Returns a [List<int>] of conflicting values.
  List<int> _checkForListConflicts(List<int> retain, List<int> remove) {
    final conflicts = <int>[];
    for (var key in retain) if (remove.contains(key)) conflicts.add(key);
    return conflicts;
  }

  /// Deletes the groups in [profile].groupsToDelete from the [Dataset];
  List<Element> processGroupsToDelete(Dataset ds,
      {bool recursive = true, bool required = false}) {
    List<Element> eList;
    for (var group in profile.groupsToRemove) {
      if (profile.groupsToRetain.contains(group)) {
        log.error('Tried to remove retainedGroup(${hex16(group)})');
        continue;
      }
      for (var e in ds.elements) {
        if (Tag.toGroup(e.code) == group) {
          ds.remove(e.code);
          report.deleted.add(e);
        }
      }
    }
    // TODO: should we have a separate list for removed groups
    report.deletedElements.addAll(eList);
    return eList;
  }

  int count = 0;

  /// Delete all Elements in the [keysToDelete] [List].
  List<Element> processKeysToDelete(Dataset ds,
      {bool recursive = true, bool required = false, int depth = 0}) {
    for (var code in profile.keysToRemove)
      _delete(ds, code, recursive: recursive, required: required);

    for (var e in ds.elements.toList()) {
      if (e is SQ) {
        print('$depth sq: $e');
        for (Dataset item in e.values) {
          // ignore: parameter_assignments
          processKeysToDelete(item, depth: depth++);
        }
      }
    }

    return report.deletedElements;
  }

  //Enhancement: code should become key
  /// delete the Element corresponding to [code].
  Element _delete(Dataset ds, int code,
      {bool recursive = true, bool required = false}) {
    if (isRetained(code)) return retainedElementError(code);
    final e = ds.delete(code);
    if (e != null) {
      report.deletedElements.add(e);
      count++;
      print('$count: _delete: ${e.dcm} ${e.vr} ${e.keyword}');
    }
    return e;
  }

  List<Element> processDeleteAllPrivate(Dataset ds,
      {bool recursive = true, bool required = false, int depth = 0}) {
    var i = 0;
    for (var e in ds.elements.toList()) {
      if (e.isPrivate) {
        _delete(ds, e.code);
        print('$i private: $e');
        i++;
      }
    }

    return report.deletedElements;
  }

  void normalizeDate(Element e, Date enrollment, Dataset tagDS) {
    if (e.vrCode == VR.kDA.code) {
      report.replacedElements.add(e);
      DA te = TagElement.fromBytes(e.bytes, tagDS);
      te = te.normalize(enrollment);
      print('Normal: ${te.date}');
      print('Normal DA: $te');
      tagDS.add(te);
    }
  }

  Map<String, String> replaceUids(Dataset oldDS,
      [Dataset tagDS, Map<Uid, Uid> uidMap]) {
    final study =  Uid();
    final series =  Uid();
    final instance =  Uid();
//    final ds = (tagDS == null) ?  TagRootDataset.empty() : tagDS;
    final map = (uidMap == null) ? <String, String>{} : uidMap;

    // Create Map of old:
    var old = getUid(oldDS, kStudyInstanceUID);
    map[old] = study.asString;
    old = getUid(oldDS, kSeriesInstanceUID);
    map[old] = series.asString;
    old = getUid(oldDS, kSOPInstanceUID);
    map[old] = instance.asString;

    // Replace Study UID
    var oldE = oldDS.updateUid(kStudyInstanceUID, [study], required: true);
    report.replacedElements.add(oldE);
    // Replace Series UID
    oldE = oldDS.updateUid(kSeriesInstanceUID, [series], required: true);
    report.replacedElements.add(oldE);
    // Replace Instance UID
    oldE = oldDS.updateUid(kSOPInstanceUID, [instance], required: true);
    report.replacedElements.add(oldE);

    print('replaced: $oldE');

    var eList = walkSequences(oldDS, kStudyInstanceUID, study);
    report.replacedElements.addAll(eList);
    eList = walkSequences(oldDS, kSeriesInstanceUID, series);
    report.replacedElements.addAll(eList);
    eList = walkSequences(oldDS, kSOPInstanceUID, instance);
    report.replacedElements.addAll(eList);
    return map;
  }

  List<Element> walkSequences(Dataset ds, int code, Uid uid,
      {bool recursive = true, bool required = false}) {
    final results = <Element>[];
    for (var e in ds.elements) {
      if (e is SQ) {
        results.addAll(walkSequence(ds, e, code, uid));
      }
    }
    return results;
  }

  List<Element> walkSequence(Dataset ds, SQ sq, int code, Uid uid,
      {bool recursive = true, bool required = false}) {
    final results = <Element>[];
    for (Dataset item in sq.items) {
      for (var e in item.elements) {
        if (e is SQ) {
          results.addAll(walkSequence(ds, e, code, uid));
        } else if (e.code == code) {
          item[code] = e.update(e);
          results.add(e);
        }
      }
    }
    return results;
  }

  //TODO:
  void replaceDates(Dataset rds) {}

  //TODO:
  void replaceUid(int code, Uid uid) {}

  String getUid(Dataset ds, int code) {
    final e = ds.lookup(code);
    if (e == null) return elementNotPresentError(code);
    return e.value;
  }

  bool processPatient(Dataset rds) {}

  bool processKeysToNoValue(Dataset rds) {}

  bool processKeysToBlank(Dataset rds) {}

  bool isInRetainedGroup(int code) =>
      profile.groupsToRetain.contains(group(code));

  bool isInRetainedElements(int code) => profile.keysToRetain.contains(code);

  bool isRetained(int code) =>
      isInRetainedGroup(code) || isInRetainedElements(code);

  List<Element> processNoValue(Dataset ds, int code,
      {bool recursive = true, bool required = false}) {
    if (isRetained(code)) return retainedElementError(code);

    for (var code in BasicProfile.keysToZero) {
      final e = ds.noValues(code);
      if (e != null) report.deletedElements.add(e);
    }
    return report.zeroed;
  }

/*
  List<Element> noValuesAll(Dataset ds, {bool recursive = true, bool required = false}) {
    List<Element> eList;
    for (int code in profile.keysToZero)
      eList = noValue(ds, code, r required: required);
    report.deletedElements.addAll(eList);
    return eList;
  }
*/

  //String get extension => '.dvp';

/*
    Map<String, dynamic> get map => {
        'name': name,
        'path': url,
        'parameters': parameters,
        //  'global': globalMap,
 //       'rules': rules,
        'comments': comments,
        'errors': errors
    };
*/

/*
    void addRule(Rule rule) {
        rules.add(rule);
    }
*/

  bool keep(int tag) => profile.keysToRetain.contains(tag);

  RegExp lookup(String key) => parameters[key];

  bool isVariable(String v) => v[0] == '@';

  bool isNotVariable(String v) => !isVariable(v);

  RegExp getVariable(String v) => (isVariable(v)) ? parameters[v] : null;

  void addVariable(String v, RegExp value) {
    //TODO: can a var have a var in its value??
    if (isVariable(v) && (value is String)) parameters[v] = value;
  }

  bool comment(int lineNo, String line) {
    comments['$lineNo'] = '$line';
    return true;
  }

  bool error(int lineNo, String msg) {
    errors['$lineNo'] = '$msg';
    return false;
  }

/*
    String get rulesToJson {
        List<String> rList = [];
        rules.forEach((Rule rule) => rList.add(rule.json));
        return '[\n${rList.join(',\n')}\n]';
    }
*/

  String get json => '''{
    '@type': 'Clinical Study Profile',
    'name': '$name',
    'path': '$url',
    'parameters': ${cvt.json.encode(parameters)},
    'rules': \$rulesToJson,
    'comments': ${cvt.json.encode(comments)},
    'errors': ${cvt.json.encode(errors)}
}''';

  String format([ProfileFormat format]) {
    switch (format) {
      case ProfileFormat.json:
        return json;
      case ProfileFormat.text:
        //TODO:
        return 'Text is not yet supported.';
      case ProfileFormat.xml:
        return 'XML is not yet supported.';
      default:
        return json;
    }
  }

/*  ProfileBase evaluateTrial(Trial trial) {
    //TODO:
  }*/

  @override
  String toString() => 'Profile: $name';

/* TODO: finish
  static ProfileBase parse(String s) {
    Map map = JSON.decode(s);
    return  Profile._(
        map['name'],
        map['url'],
        map['trial'],
//            map['globals'],
//            map['trialMap'],
        map['parameters'],
        map['retainGroups'],
        map['deleteGroups'],
        map['retainTags'],
        map['deleteTags'],
        map['updateMap'],
        map['comments'],
//            map['rules'],
        map['errors']);
  }*/
}
