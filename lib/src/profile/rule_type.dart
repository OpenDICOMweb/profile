// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> - 
// See the AUTHORS file for other contributors.

//TODO: make sure this is needed / used.
import 'profile.dart';
import 'rule.dart';

const List<String> dataTypes = const ["char", "condition", "date", "default", "int", "param","rege"
    "xp",
    "siteId", "tag", "uidroot", "uint", "year", "month", "day"];
const List<String> vrTypes = const ["string", "AS", "DA", "LO", "private", "SQ", "TM", "UI", "??"];

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

  static const RuleType add = const RuleType("@add", "*", 1, 1, 0, const ["uint"]);
  static const RuleType always = const RuleType("@always", "??", 0, 0, 1);
  static const RuleType append = const RuleType("@append", "??", 0, 0, 1);

  // Arg MUSt be non-zero
  static const RuleType blank = const RuleType("@blank", "string", 1, 1, 0, const ["uint"]);

  static const RuleType contents = const RuleType("@contents", "*", 1, 3, 0,
                                             const ["tag", "regexp", "string"]);

  // Default separator = "-"
  static const RuleType date = const RuleType("@date", "DA", 0, 1, 0, const ["char"]);

  // Whitespace is allowed but ignored.  "RESET" might be present
  static const RuleType deIdentificationMethodCodeSeq =
  const RuleType("@DeIdentificationMethodCodeSeq", "SQ", 1, 1, 0, const ["string"]);

  // equivalent to @blank(0)
  static const RuleType empty = const RuleType("@empty", "string", 0, 0, 0);

  static const RuleType encrypt = const RuleType("@encrypt", "??", 2, 2, 0, const ["string"]);

  // String has no spaces
  static const RuleType hash = const RuleType("@hash", "string", 2, 2, 0, const ["tag", "uint"]);

  // Only on VR of "UI"
  // Using @param makes the UID invalid??
  static const RuleType hashUid = const RuleType(
      "@hashuid", "UI", 2, 3, 0, const ["uidroot", "param", "tag"]);

  static const RuleType hashName = const RuleType(
      "@hashname", "string", 1, 3, 0, const ["tag", "uint", "uint"]);

  // ??? only on ptid elements??? i.e. VR= LO
  static const RuleType hashPtId = const RuleType(
      "@hashptid", "LO", 2, 3, 0, const ["siteID", "tag", "uint"]);

  static const RuleType ifRule = const RuleType(
      "@if", "string", 2, 3, 2, const ["tag", "condition", "string"]);

  static const RuleType incrementDate = const RuleType(
      "@incrementDate", "DA", 2, 2, 0, const ["tag", "uint"]);

  static const RuleType initials = const RuleType("@initials", "PN", 1, 1, 0, const ["patientName"]);

  // ?? what is key type???
  // pad with leading zeros
  static const RuleType integer = const RuleType(
      "@integer", "string", 3, 3, 0, const ["tag", "keyType", "uint"]);

  static const RuleType keep = const RuleType("@keep", "*", 0, 0, 0);
  static const RuleType keepGroup18 = const RuleType("@keepGroup18", "*", 0, 0, 0);
  static const RuleType keepGroup20 = const RuleType("@keepGroup20", "*", 0, 0, 0);
  static const RuleType keepGroup28 = const RuleType("@keepGroup28", "*", 0, 0, 0);
  static const RuleType keepGroup50 = const RuleType("@keepGroup50", "*", 0, 0, 0);
  static const RuleType keepGroup60 = const RuleType("@keepGroup60", "*", 0, 0, 0);
  static const RuleType keepCurves = keepGroup50;
  static const RuleType keepOverLays = keepGroup60;
  static const RuleType keepSafePrivate = null;

  // ?? Patient ID only, i.e. LO
  static const RuleType lookup = const RuleType(
      "@lookup", "LO", 2, 3, 0, const ["tag", "uint", "action"]);

  // y,m,d may be "*"
  static const RuleType modifyDate = const RuleType("@modifiyDate", "DA", 4, 5, 0,
                                               const ["tag", "year", "month", "day", "date"]);

  // Needs special processing
  static const RuleType param = const RuleType("@param", "string", 1, 1, 0);

  //returns the value of the @param
  static const RuleType privateAttribute = privateElement;
  static const RuleType privateElement = const RuleType("@privateElement", "private", 1, 1, 0);
  static const RuleType process = const RuleType("@process", "SQ", 0, 0, 0);

  // Patient ID only
  static const RuleType ptIdLookup = const RuleType("@ptidlookup", "LO", 1, 1, 0);

  //Needs a lookup table
  static const RuleType remove = const RuleType("@remove", "*", 0, 0, 0);

  static const RuleType removeAllPrivateGroups = const RuleType("@removePrivateGroups", "*", 0, 0, 0);
  static const RuleType removePrivateGroup = const RuleType("@removePrivateGroups", "*", 1, 1, 0);

  static const RuleType removeUncheckedElements = const RuleType("@removeUncheckedElements", "*", 0, 0, 0);
  static const RuleType removeGroup18 = const RuleType("@removeGroup18", "*", 0, 0, 0);
  static const RuleType removeGroup20 = const RuleType("@removeGroup20", "*", 0, 0, 0);
  static const RuleType removeGroup28 = const RuleType("@removeGroup28", "*", 0, 0, 0);
  static const RuleType removeGroup50 = const RuleType("@removeGroup50", "*", 0, 0, 0);
  static const RuleType removeGroup60 = const RuleType("@removeGroup60", "*", 0, 0, 0);
  static const RuleType removeCurves = removeGroup50;
  static const RuleType removeOverlays = removeGroup60;

  static const RuleType require = const RuleType("@require", "*", 0, 2, 0, const ["tag", "default"]);
  static const RuleType round = const RuleType("@round", "AS", 2, 2, 0, const ["tag", "uint"]);
  static const RuleType select = const RuleType("@select", "AS", 0, 0, 2);
  static const RuleType skip = const RuleType("@skip", "*", 0, 0, 0);

  // Default separator is ","
  static const RuleType time = const RuleType("@time", "TM", 0, 1, 0, const ["char"]);

  // If n is negative truncate from the end of string
  static const RuleType truncate = const RuleType("@truncate", "string", 2, 2, 0, const ["tag", "int"]);

  // pos is first n, neg is last n, zero returns empty
  static const RuleType value = const RuleType("@value", "*", 1, 2, 2, const ["tag", "regexp"]);
  static const RuleType ifExists = const RuleType("@ifExists", "*", 1, 1, 2, const ["tag"]);
  static const RuleType ifBlank = const RuleType("@ifBlank", "string", 1, 1, 2, const ["tag"]);
  static const RuleType ifEquals = const RuleType("@ifEquals", "*", 2, 2, 2, const ["tag", "string"]);
  static const RuleType ifContains = const RuleType("@ifContains", "string", 2, 2, 2,
                                               const ["tag", "string"]);
  static const RuleType ifMatches = const RuleType("@ifMatches", "*", 2, 2, 2, const ["tag", "string"]);


  bool blankArgPredicate(List args) {
    if (args.length == 0) return true;
    if (args.length == 1) {
      int val = int.parse(args[0], onError: (s) => null);
      if (val != null) return true;
    }
    return false;
  }

  bool paramArgPredicate(Profile profile, Rule rule) {
    if (validArgLength(rule.args.length))
      throw new ArgumentError("Invalid @param Arg Length for rule: $rule");
    var args = rule.args;
    var arg0 = args[0];
    if ((arg0 is! String) && (arg0[0] != '@'))
      throw new ArgumentError('Invalid @param 0th argument: $arg0');
    String value = profile.getVariable(arg0);
    if (value == null)
      throw new ArgumentError('Invalid @param value: $value');
    rule.function = "&value";
    args[0] = value;
    return true;
  }

  static const Map<String, RuleType> map = const <String, RuleType>{
    "@add": add,
    "@always": always,
    "@append": append,
    "@blank": blank,
    "@contents": contents,
    "@date": date,
    "@deIdentificationMethodCodeSeq": deIdentificationMethodCodeSeq,
    "@empty": empty,
    "@encrypt": encrypt,
    "@hash": hash,
    "@hashuid": hashUid,
    "@hashname": hashName,
    "@hashptid": hashPtId,
    "@if": ifRule,
    "@incrementDate": incrementDate,
    "@initials": initials,
    "@integer": integer,
    "@keep": keep,
    "@keepGroup18": keepGroup18,
    "@keepGroup20": keepGroup20,
    "@keepGroup28": keepGroup28,
    "@keepGroup50": keepGroup50,
    "@keepGroup60": keepGroup60,
    "@keepCurves": keepCurves,
    "@keepOverlays": keepOverLays,
    "@keepSafePrivate": keepSafePrivate,
    "@lookup": lookup,
    "@modifyDate": modifyDate,
    "@param": param,
    "@privateattribute": privateElement,
    "@privateElement": privateElement,
    "@process": process,
    "@ptidlookup": ptIdLookup,
    "@remove": remove,
    "@removeAllPrivateGroups": removeAllPrivateGroups,
    "@removePrivateGroup": removePrivateGroup,
    "@removeGroup18": removeGroup18,
    "@removeGroup20": removeGroup20,
    "@removeGroup28": removeGroup28,
    "@removeGroup50": removeGroup50,
    "@removeGroup60": removeGroup60,
    "@removeCurves": removeCurves,
    "@removeOverlays": removeOverlays,
    "@require": require,
    "@round": round,
    "@select": select,
    "@skip": skip,
    "@time": time,
    "@truncate": truncate,
    "@value": value,
    "@ifExists": ifExists,
    "@ifBlank": ifBlank,
    "@ifEquals": ifEquals,
    "@ifContaints": ifContains,
    "@ifMatches": ifMatches,
  };

  static const List<String> names = const [
    "@add",
    "@always",
    "@append",
    "@blank",
    "@contents",
    "@date",
    "@deIdentificationMethodCodeSeq",
    "@empty",
    "@encrypt",
    "@hash",
    "@hashuid",
    "@hashname",
    "@hashptid",
    "@hashPtId",
    "@if",
    "@incrementDate",
    "@initials",
    "@integer",
    "@keep",
    "@keepGroup18",
    "@keepGroup20",
    "@keepGroup28",
    "@keepGroup50",
    "@keepGroup60",
    "@keepCurves",
    "@keepOverlays",
    "@keepSafePrivate",
    "@lookup",
    "@modifiyDate",
    "@param",
    "@privateattribute",
    "@privateElement",
    "@process",
    "@ptidlookup",
    "@remove",
    "@removePrivateGroup",
    "@removeGroup18",
    "@removeGroup20",
    "@removeGroup28",
    "@removeGroup50",
    "@removeGroup60",
    "@removeCurves",
    "@removeOverlays",
    "@require",
    "@round",
    "@select",
    "@skip",
    "@time",
    "@truncate"
        "@ifExists",
    "@ifBlank",
    "@ifEquals",
    "@ifContaints",
    "@ifMatches"
  ];

  //TODO: make [values] constant.
  static List<RuleType> values = map.values;
}
