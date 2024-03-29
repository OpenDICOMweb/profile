// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Original author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

import 'package:core/core.dart';

import 'package:profile/src/profile/profile.dart';

class TagGroup {
  final String name;
  final int group;

  const TagGroup(this.name, this.group);

  int get min => group << 16;
  int get max => (group << 16) + 0xFFFF;

  static const TagGroup group18 = const TagGroup('Group 18', 0x0018);
  static const TagGroup group20 = const TagGroup('Group 20', 0x0020);
  static const TagGroup group28 = const TagGroup('Group 28', 0x0028);
  static const TagGroup group50 = const TagGroup('Group 50', 0x0050);
  static const TagGroup group60 = const TagGroup('Group 60', 0x0060);
  static const TagGroup curves = group50;
  static const TagGroup overLays = group60;

  void keep(Profile profile) => profile.groupsToRetail.add(group);

  void remove(Dataset ds) => ds.deletePrivateGroup(group);
}

class GlobalRule {
  static const List<int> allowedGroupNumbers = const [
    0x0018,
    0x0020,
    0x0028,
    0x0050,
    0x0060
  ];
  bool deIdentify = true;
  bool keepSafePrivate = false;
  bool removePrivate = true;
  List<int> options = [];

  List<TagGroup> keepGroups = [];
  List<TagGroup> removeGroups = [];

  GlobalRule();

  bool keep(TagGroup group) {
    if (allowedGroupNumbers.contains(group)) {
      keepGroups.add(group);
      return true;
    } else {
      return false;
    }
  }

  bool remove(TagGroup group) {
    if (allowedGroupNumbers.contains(group)) {
      removeGroups.add(group);
      return true;
    } else {
      return false;
    }
  }
}

const List<String> dataTypes = const [
  'char', 'condition', 'date', 'default', 'int', 'param', 'regexp', 'siteId',
  'tag', 'uidroot', 'uint', 'year', 'month', 'day' //no reformat
];
const List<String> vrTypes = const [
  'string', 'AS', 'DA', 'LO', 'private', 'SQ', 'TM', 'UI', '??' //no reformat
];

class GlobalRuleType {
  final String name;
  final String vrType;
  final int min;
  final int max;
  final int nScripts;
  final List<String> argTypes;
  final Function argPredicate;

  const GlobalRuleType(this.name, this.vrType, this.min, this.max, this.nScripts,
      [this.argTypes, this.argPredicate]);

  bool get hasArgs => min > 0;

  bool get hasScripts => nScripts > 0;

  bool validArgs(List args) => argPredicate(args);

  // Whitespace is allowed but ignored.  'RESET' might be present
  static const GlobalRuleType deIdentificationMethodCodeSeq = const GlobalRuleType(
      '@DeIdentificationMethodCodeSeq', 'SQ', 1, 1, 0, const ['string']);

  static const GlobalRuleType keepGroup =
      const GlobalRuleType('@keepGroup', 'uint', 1, 1, 1);
  static const GlobalRuleType keepGroup18 =
      const GlobalRuleType('@keepGroup18', '*', 0, 0, 0);
  static const GlobalRuleType keepGroup20 =
      const GlobalRuleType('@keepGroup20', '*', 0, 0, 0);
  static const GlobalRuleType keepGroup28 =
      const GlobalRuleType('@keepGroup28', '*', 0, 0, 0);
  static const GlobalRuleType keepGroup50 =
      const GlobalRuleType('@keepGroup50', '*', 0, 0, 0);
  static const GlobalRuleType keepGroup60 =
      const GlobalRuleType('@keepGroup60', '*', 0, 0, 0);
  static const GlobalRuleType keepCurves = keepGroup50;
  static const GlobalRuleType keepOverLays = keepGroup60;
  static const GlobalRuleType keepSafePrivate = null;

  static const GlobalRuleType keepPrivateGroup =
      const GlobalRuleType('@pkeepPrivateGroup', 'private', 1, 1, 0);

  static const GlobalRuleType removeUncheckedElements =
      const GlobalRuleType('@removeUncheckedElements', '*', 0, 0, 0);

  static const GlobalRuleType removeGroup =
      const GlobalRuleType('@removeGroup', 'uint', 1, 1, 1);
  static const GlobalRuleType removeGroup18 =
      const GlobalRuleType('@removeGroup18', '*', 0, 0, 0);
  static const GlobalRuleType removeGroup20 =
      const GlobalRuleType('@removeGroup20', '*', 0, 0, 0);
  static const GlobalRuleType removeGroup28 =
      const GlobalRuleType('@removeGroup28', '*', 0, 0, 0);
  static const GlobalRuleType removeGroup50 =
      const GlobalRuleType('@removeGroup50', '*', 0, 0, 0);
  static const GlobalRuleType removeGroup60 =
      const GlobalRuleType('@removeGroup60', '*', 0, 0, 0);
  static const GlobalRuleType removeCurves = removeGroup50;
  static const GlobalRuleType removeOverlays = removeGroup60;

  static const GlobalRuleType removeAllPrivateGroups =
      const GlobalRuleType('@removePrivateGroups', '', 0, 0, 0);
  static const GlobalRuleType removePrivateGroup =
      const GlobalRuleType('@removePrivateGroup', 'string', 1, 1, 0);

  //TODO: these might work with whole groups
  static const GlobalRuleType ifExists =
      const GlobalRuleType('@ifExists', '*', 1, 1, 2, const ['tag']);
  static const GlobalRuleType ifBlank =
      const GlobalRuleType('@ifBlank', 'string', 1, 1, 2, const ['tag']);
  static const GlobalRuleType ifEquals =
      const GlobalRuleType('@ifEquals', '*', 2, 2, 2, const ['tag', 'string']);
  static const GlobalRuleType ifContains =
      const GlobalRuleType('@ifContains', 'string', 2, 2, 2, const ['tag', 'string']);
  static const GlobalRuleType ifMatches =
      const GlobalRuleType('@ifMatches', '*', 2, 2, 2, const ['tag', 'string']);

  bool blankArgPredicate(List args) {
    if (args.isEmpty) return true;
    if (args.length == 1) {
      final val = int.parse(args[0], onError: (s) => null);
      if (val != null) return true;
    }
    return false;
  }

  static const Map<String, GlobalRuleType> globalRuleTypeMap =
      const <String, GlobalRuleType>{
    '@deIdentificationMethodCodeSeq': deIdentificationMethodCodeSeq,
    //TODO: Should be keep or remove other groupNumbers
    '@keepGroup': keepGroup,
    '@keepGroup18': keepGroup18,
    '@keepGroup20': keepGroup20,
    '@keepGroup28': keepGroup28,
    '@keepGroup50': keepGroup50,
    '@keepGroup60': keepGroup60,
    '@keepCurves': keepCurves,
    '@keepOverlays': keepOverLays,
    '@keepSafePrivate': keepSafePrivate,

    '@keepPrivateGroup': keepPrivateGroup,

    '@removeGroup': removeGroup,
    '@removeGroup18': removeGroup18,
    '@removeGroup20': removeGroup20,
    '@removeGroup28': removeGroup28,
    '@removeGroup50': removeGroup50,
    '@removeGroup60': removeGroup60,
    '@removeCurves': removeCurves,
    '@removeOverlays': removeOverlays,

    '@removeAllPrivateGroups': removeAllPrivateGroups,
    '@removePrivateGroup': removePrivateGroup,

    //TODO: are this useful globally
    '@ifExists': ifExists,
    '@ifBlank': ifBlank,
    '@ifEquals': ifEquals,
    '@ifContaints': ifContains,
    '@ifMatches': ifMatches,
  };

  static final List<String> names = globalRuleTypeMap.keys;

  static final List<GlobalRuleType> rules = globalRuleTypeMap.values;

  /* TODO: delete after verifying that [names] and [values] work
  static const List<String> ruleNames = const [
    '@deIdentificationMethodCodeSeq',
    '@empty',
    '@encrypt',
    '@hash',
    '@hashuid',
    '@hashname',
    '@hashptid',
    '@hashPtId',
    '@if',
    '@incrementDate',
    '@initials',
    '@integer',
    '@keep',
    '@keepGroup18',
    '@keepGroup20',
    '@keepGroup28',
    '@keepGroup50',
    '@keepGroup60',
    '@keepCurves',
    '@keepOverlays',
    '@keepSafePrivate',
    '@lookup',
    '@modifiyDate',
    '@param',
    '@privateattribute',
    '@privateElement',
    '@process',
    '@ptidlookup',
    '@remove',
    '@removePrivateGroup',
    '@removeGroup18',
    '@removeGroup20',
    '@removeGroup28',
    '@removeGroup50',
    '@removeGroup60',
    '@removeCurves',
    '@removeOverlays',
    '@require',
    '@round',
    '@select',
    '@skip',
    '@time',
    '@truncate'
        '@ifExists',
    '@ifBlank',
    '@ifEquals',
    '@ifContaints',
    '@ifMatches'
  ];
*/
}
