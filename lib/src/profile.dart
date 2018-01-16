// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Original author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

import 'dart:convert';

import 'package:core/core.dart';

import 'package:profile/src/errors.dart';

typedef Element Updater(Element element);

enum ProfileFormat { text, json, xml }

/// [K] is the type of key.
class ProfileBase<K> {
  /// The name of this profile.
  final String name;

  /// A [String] containing the URL where the Profile is stored.
  final Uri url;

//  final List<String> lines;
//    final GlobalRule globals;
  final Map<String, dynamic> trial;
  final Map<String, String> parameters;
  final List<int> groupsToRetain;
  final List<int> groupsToRemove;
  final List<int> keyToRetain;
  final List<int> keysToRemove;
  final List<int> keysToNoValues;
  final Map<int, Updater> replaceMap;
  final Map<String, String> comments;
//    final List<Rule> rules;
  final Map<String, String> errors;

  final List<Element> removedElements = [];
  final List<Element> blankedElements = [];
  final List<Element> replacedElements = [];
  final List<Element> addedElements = [];

  ///Fix: make this constant
  ProfileBase(this.name, String url, this.trial)
      : url = Uri.parse(url),
        // globals = new GlobalRule(),
        parameters = {},
        groupsToRetain = [],
        groupsToRemove = [],
        keyToRetain = [],
        keysToRemove = [],
        keysToNoValues = [],
        replaceMap = {},
        comments = {},
        //   rules = [],
        errors = {} {
    _checkForRetainRemoveConflicts();
  }

  //TODO: finish if needed for creating constant profile such as anonymization.
  ProfileBase._(
      this.name,
      this.url,
      this.trial,
      //       this.globals,
      //       this.trialMap,
      this.parameters,
      this.groupsToRetain,
      this.groupsToRemove,
      this.keyToRetain,
      this.keysToNoValues,
      this.keysToRemove,
      this.replaceMap,
      this.comments,
//      this.rules,
      this.errors);

  Map<String, String> replaceUids(Dataset ds, [Map<Uid, Uid> uidMap]) {
    final idedStudy = ds.lookup(kStudyInstanceUID);
    final study = new Uid();
    final series = new Uid();
    final instance = new Uid();
    final map = (uidMap == null) ? <String, String>{} : uidMap;

    final uids = <Uid>[study, series, instance];

    // Create Map of old: new
    var old = getUid(ds, kStudyInstanceUID);
    map[old] = study.asString;
    old = getUid(ds, kSeriesInstanceUID);
    map[old] = series.asString;
    old = getUid(ds, kSOPInstanceUID);
    map[old] = instance.asString;

    // Replace Study UID
/* TODO rewrite
    var oldE = ds.replaceAllUids(kStudyInstanceUID, uids);
    replacedElements.add(oldE);
    // Replace Series UID
    oldE = ds.replaceUid(kSeriesInstanceUID, series.asString,
        recursive: true, required: true);
    replacedElements.add(oldE);
    // Replace Instance UID
    oldE = ds.replaceUid(kSOPInstanceUID, instance.asString,
        recursive: true, required: true);
    replacedElements.add(oldE);
*/

    print('replaced: $replacedElements');

    var eList = walkSequences(ds, kStudyInstanceUID, (e) => e.update(<Uid>[study]));
    replacedElements.addAll(eList);
    eList = walkSequences(ds, kSeriesInstanceUID, (e) => e.update(<Uid>[series]));
    replacedElements.addAll(eList);
    eList = walkSequences(ds, kSOPInstanceUID, (e) => e.update(<Uid>[instance]));
    replacedElements.addAll(eList);

    return map;
  }

  List<Element> walkSequences(Dataset ds, int code, Updater f,
      {bool recursive = true, bool required = false}) {
    final results = <Element>[];
    for (var e in ds.elements) {
      if (e is SQ) {
        results.addAll(walkSequence(ds, e, code, f));
      }
    }
    return results;
  }

  List<Element> walkSequence(Dataset ds, SQ sq, int code, ElementConverter f,
      {bool recursive = true, bool required = false}) {
    final results = <Element>[];
    for (Dataset item in sq.items) {
      for (var e in item.elements) {
        if (e is SQ) {
          results.addAll(walkSequence(ds, e, code, f));
        } else if (e.code == code) {
          item[code] = f(e);
          results.add(e);
        }
      }
    }
    return results;
  }

  void replaceUid(int code, Uid uid) {}

  String getUid(Dataset ds, int code) {
    final e = ds.lookup(code);
    if (e == null) return elementNotPresentError(code);
    return e.value;
  }

  // Checks that no retainedKeys are in the removedKeys List.
  void _checkForRetainRemoveConflicts() {
    for (var key in keysToRemove)
      if (keyToRetain.contains(key))
        throw new ArgumentError('removeTags cannot contain and tags in'
            ' the keepTags list.');
  }

  bool isInRetainedGroup(int code) => groupsToRetain.contains(Group.fromTag(code));

  bool isInRetainedElements(int code) => keyToRetain.contains(code);

  bool isRetained(int code) => isInRetainedGroup(code) || isInRetainedElements(code);

  List<Element> removeGroups(Dataset ds, {bool recursive = true, bool required = false}) {
    List<Element> eList;
    for (var group in groupsToRemove) {
      if (groupsToRetain.contains(group)) {
        log.error('Tried to remove retainedGroup(${hex16(group)})');
        continue;
      }
      for (var e in ds.elements) {
        if (Group.fromTag(e.code) == group) {
          eList = ds.deleteAll(e.code, recursive: recursive);
        }
      }
    }
    // TODO: should we have a separate list for removed groups
    removedElements.addAll(eList);
    return eList;
  }

  List<Element> remove(Dataset ds, int code,
      {bool recursive = true, bool required = false}) {
    if (isRetained(code)) return retainedElementError(code);
    final eList = ds.deleteAll(code, recursive: recursive);
    removedElements.addAll(eList);
    return eList;
  }

  List<Element> removeAll(Dataset ds, {bool recursive = true, bool required = false}) {
    List<Element> eList;
    for (var code in keysToRemove)
      eList = remove(ds, code, recursive: recursive, required: required);
    removedElements.addAll(eList);
    return eList;
  }

  List<Element> noValue(Dataset ds, int code,
      {bool recursive = true, bool required = false}) {
    if (isRetained(code)) return retainedElementError(code);
    final eList = ds.noValuesAll(code, recursive: recursive);
    removedElements.addAll(eList);
    return eList;
  }

  List<Element> noValuesAll(Dataset ds, {bool recursive = true, bool required = false}) {
    List<Element> eList;
    for (var code in keysToNoValues)
      eList = noValue(ds, code, recursive: recursive, required: required);
    removedElements.addAll(eList);
    return eList;
  }

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

  bool keep(int tag) => keyToRetain.contains(tag);

  String lookup(String key) => parameters[key];

  bool isVariable(String v) => v[0] == '@';

  bool isNotVariable(String v) => !isVariable(v);

  String getVariable(String v) => (isVariable(v)) ? parameters[v] : null;

  void addVariable(String v, String value) {
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
    'parameters': ${JSON.encode(parameters)},
    'rules': \$rulesToJson,
    'comments': ${JSON.encode(comments)},
    'errors': ${JSON.encode(errors)}
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
    return new Profile._(
        map['name'],
        map['url'],
        map['trial'],
//            map['globals'],
//            map['trialMap'],
        map['parameters'],
        map['retainGroups'],
        map['removeGroups'],
        map['retainTags'],
        map['removeTags'],
        map['updateMap'],
        map['comments'],
//            map['rules'],
        map['errors']);
  }*/
}
