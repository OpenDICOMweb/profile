// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

//TODO: make sure this is needed / used.
import 'profile.dart';
import 'rule.dart';

// ignore_for_file: public_member_api_docs

const List<String> dataTypes = [
  'char',
  'condition',
  'date',
  'default',
  'int',
  'param',
  'rege',
  'xp',
  'siteId',
  'tag',
  'uidroot',
  'uint',
  'year',
  'month',
  'day'
];
const List<String> vrTypes = [
  'string',
  'AS',
  'DA',
  'LO',
  'private',
  'SQ',
  'TM',
  'UI',
  '??'
];

class RuleType {
  final String name;
  final String vrType;
  final int min;
  final int max;
  final int nScripts;
  final List<String> argTypes;
  final Function argPredicate;

  const RuleType(this.name, this.vrType, this.min, this.max, this.nScripts,
      [this.argTypes, this.argPredicate]);

  bool get hasArgs => min > 0;

  bool get hasScripts => nScripts > 0;

  bool validArgLength(int length) => (min <= length) && (max <= length);

  bool validArgs(List args) => argPredicate(args);

  static const RuleType add = RuleType('@add', '*', 1, 1, 0, ['uint']);
  static const RuleType always = RuleType('@always', '??', 0, 0, 1);
  static const RuleType append = RuleType('@append', '??', 0, 0, 1);

  // Arg MUSt be non-zero
  static const RuleType blank = RuleType('@blank', 'string', 1, 1, 0, ['uint']);

  static const RuleType contents =
      RuleType('@contents', '*', 1, 3, 0, ['tag', 'regexp', 'string']);

  // Default separator = '-'
  static const RuleType date = RuleType('@date', 'DA', 0, 1, 0, ['char']);

  // Whitespace is allowed but ignored.  'RESET' might be present
  static const RuleType deIdentificationMethodCodeSeq =
      RuleType('@DeIdentificationMethodCodeSeq', 'SQ', 1, 1, 0, ['string']);

  // equivalent to @blank(0)
  static const RuleType empty = RuleType('@empty', 'string', 0, 0, 0);

  static const RuleType encrypt =
      RuleType('@encrypt', '??', 2, 2, 0, ['string']);

  // String has no spaces
  static const RuleType hash =
      RuleType('@hash', 'string', 2, 2, 0, ['tag', 'uint']);

  // Only on VR of 'UI'
  // Using @param makes the UID invalid??
  static const RuleType hashUid =
      RuleType('@hashuid', 'UI', 2, 3, 0, ['uidroot', 'param', 'tag']);

  static const RuleType hashName =
      RuleType('@hashname', 'string', 1, 3, 0, ['tag', 'uint', 'uint']);

  // ??? only on ptid elements??? i.e. VR= LO
  static const RuleType hashPtId =
      RuleType('@hashptid', 'LO', 2, 3, 0, ['siteID', 'tag', 'uint']);

  static const RuleType ifRule =
      RuleType('@if', 'string', 2, 3, 2, ['tag', 'condition', 'string']);

  static const RuleType incrementDate =
      RuleType('@incrementDate', 'DA', 2, 2, 0, ['tag', 'uint']);

  static const RuleType initials =
      RuleType('@initials', 'PN', 1, 1, 0, ['patientName']);

  // ?? what is key type???
  // pad with leading zeros
  static const RuleType integer =
      RuleType('@integer', 'string', 3, 3, 0, ['tag', 'keyType', 'uint']);

  static const RuleType keep = RuleType('@keep', '*', 0, 0, 0);
  static const RuleType keepGroup18 = RuleType('@keepGroup18', '*', 0, 0, 0);
  static const RuleType keepGroup20 = RuleType('@keepGroup20', '*', 0, 0, 0);
  static const RuleType keepGroup28 = RuleType('@keepGroup28', '*', 0, 0, 0);
  static const RuleType keepGroup50 = RuleType('@keepGroup50', '*', 0, 0, 0);
  static const RuleType keepGroup60 = RuleType('@keepGroup60', '*', 0, 0, 0);
  static const RuleType keepCurves = keepGroup50;
  static const RuleType keepOverLays = keepGroup60;
  static const RuleType keepSafePrivate = null;

  // ?? Patient ID only, i.e. LO
  static const RuleType lookup =
      RuleType('@lookup', 'LO', 2, 3, 0, ['tag', 'uint', 'action']);

  // y,m,d may be '*'
  static const RuleType modifyDate = RuleType(
      '@modifiyDate', 'DA', 4, 5, 0, ['tag', 'year', 'month', 'day', 'date']);

  // Needs special processing
  static const RuleType param = RuleType('@param', 'string', 1, 1, 0);

  //returns the value of the @param
  static const RuleType privateAttribute = privateElement;
  static const RuleType privateElement =
      RuleType('@privateElement', 'private', 1, 1, 0);
  static const RuleType process = RuleType('@process', 'SQ', 0, 0, 0);

  // Patient ID only
  static const RuleType ptIdLookup = RuleType('@ptidlookup', 'LO', 1, 1, 0);

  //Needs a lookup table
  static const RuleType remove = RuleType('@remove', '*', 0, 0, 0);

  static const RuleType removeAllPrivateGroups =
      RuleType('@removePrivateGroups', '*', 0, 0, 0);
  static const RuleType removePrivateGroup =
      RuleType('@removePrivateGroups', '*', 1, 1, 0);

  static const RuleType removeUncheckedElements =
      RuleType('@removeUncheckedElements', '*', 0, 0, 0);
  static const RuleType removeGroup18 =
      RuleType('@removeGroup18', '*', 0, 0, 0);
  static const RuleType removeGroup20 =
      RuleType('@removeGroup20', '*', 0, 0, 0);
  static const RuleType removeGroup28 =
      RuleType('@removeGroup28', '*', 0, 0, 0);
  static const RuleType removeGroup50 =
      RuleType('@removeGroup50', '*', 0, 0, 0);
  static const RuleType removeGroup60 =
      RuleType('@removeGroup60', '*', 0, 0, 0);
  static const RuleType removeCurves = removeGroup50;
  static const RuleType removeOverlays = removeGroup60;

  static const RuleType require =
      RuleType('@require', '*', 0, 2, 0, ['tag', 'default']);
  static const RuleType round =
      RuleType('@round', 'AS', 2, 2, 0, ['tag', 'uint']);
  static const RuleType select = RuleType('@select', 'AS', 0, 0, 2);
  static const RuleType skip = RuleType('@skip', '*', 0, 0, 0);

  // Default separator is ','
  static const RuleType time = RuleType('@time', 'TM', 0, 1, 0, ['char']);

  // If n is negative truncate from the end of string
  static const RuleType truncate =
      RuleType('@truncate', 'string', 2, 2, 0, ['tag', 'int']);

  // pos is first n, neg is last n, zero returns empty
  static const RuleType value =
      RuleType('@value', '*', 1, 2, 2, ['tag', 'regexp']);
  static const RuleType ifExists = RuleType('@ifExists', '*', 1, 1, 2, ['tag']);
  static const RuleType ifBlank =
      RuleType('@ifBlank', 'string', 1, 1, 2, ['tag']);
  static const RuleType ifEquals =
      RuleType('@ifEquals', '*', 2, 2, 2, ['tag', 'string']);
  static const RuleType ifContains =
      RuleType('@ifContains', 'string', 2, 2, 2, ['tag', 'string']);
  static const RuleType ifMatches =
      RuleType('@ifMatches', '*', 2, 2, 2, ['tag', 'string']);

  bool blankArgPredicate(List args) {
    if (args.isEmpty) return true;
    if (args.length == 1) {
      final val = int.tryParse(args[0]);
      if (val != null) return true;
    }
    return false;
  }

  bool paramArgPredicate(Profile profile, Rule rule) {
    if (validArgLength(rule.args.length))
      throw ArgumentError('Invalid @param Arg Length for rule: $rule');
    final args = rule.args;
    final arg0 = args[0];
    if ((arg0 is! String) && (arg0[0] != '@'))
      throw ArgumentError('Invalid @param 0th argument: $arg0');
    final value = profile.getVariable(arg0);
    if (value == null) throw ArgumentError('Invalid @param value: $value');
    rule.function = '&value';
    args[0] = value;
    return true;
  }

  static const Map<String, RuleType> map = <String, RuleType>{
    '@add': add,
    '@always': always,
    '@append': append,
    '@blank': blank,
    '@contents': contents,
    '@date': date,
    '@deIdentificationMethodCodeSeq': deIdentificationMethodCodeSeq,
    '@empty': empty,
    '@encrypt': encrypt,
    '@hash': hash,
    '@hashuid': hashUid,
    '@hashname': hashName,
    '@hashptid': hashPtId,
    '@if': ifRule,
    '@incrementDate': incrementDate,
    '@initials': initials,
    '@integer': integer,
    '@keep': keep,
    '@keepGroup18': keepGroup18,
    '@keepGroup20': keepGroup20,
    '@keepGroup28': keepGroup28,
    '@keepGroup50': keepGroup50,
    '@keepGroup60': keepGroup60,
    '@keepCurves': keepCurves,
    '@keepOverlays': keepOverLays,
    '@keepSafePrivate': keepSafePrivate,
    '@lookup': lookup,
    '@modifyDate': modifyDate,
    '@param': param,
    '@privateattribute': privateElement,
    '@privateElement': privateElement,
    '@process': process,
    '@ptidlookup': ptIdLookup,
    '@remove': remove,
    '@removeAllPrivateGroups': removeAllPrivateGroups,
    '@removePrivateGroup': removePrivateGroup,
    '@removeGroup18': removeGroup18,
    '@removeGroup20': removeGroup20,
    '@removeGroup28': removeGroup28,
    '@removeGroup50': removeGroup50,
    '@removeGroup60': removeGroup60,
    '@removeCurves': removeCurves,
    '@removeOverlays': removeOverlays,
    '@require': require,
    '@round': round,
    '@select': select,
    '@skip': skip,
    '@time': time,
    '@truncate': truncate,
    '@value': value,
    '@ifExists': ifExists,
    '@ifBlank': ifBlank,
    '@ifEquals': ifEquals,
    '@ifContaints': ifContains,
    '@ifMatches': ifMatches,
  };

  static const List<String> names = [
    '@add',
    '@always',
    '@append',
    '@blank',
    '@contents',
    '@date',
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
    '@truncate',
    '@ifExists',
    '@ifBlank',
    '@ifEquals',
    '@ifContaints',
    '@ifMatches'
  ];

  //TODO: make [values] constant.
  static List<RuleType> values = map.values;
}
