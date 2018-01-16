// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

import 'package:core/core.dart';


/// This library implements DICOM study de-identification.  It conforms to
/// DICOM PS3.15 Appendix E.
///
/// D   - Replace with a non-zero length value that may be a dummy value and consistent
///       with the VR.
/// Z   - Replace with a zero length value, or a non-zero length value that may be a dummy
///       value and consistent with the VR.
/// X   - Remove.
/// K   - Keep (unchanged for non-sequence attributes, cleaned for sequences).
/// C   - Clean, that is update with values of similar meaning known not to contain
///       identifying information and consistent with the VR.
/// U   - Replace with a non-zero length UID that is internally consistent within a set
///       of Instances.
/// ZD  - Z unless D is required to maintain IOD conformance (Type 2 versus Type 1).
/// XZ  - X unless Z is required to maintain IOD conformance (Type 3 versus Type 2).
/// XD  - X unless D is required to maintain IOD conformance (Type 3 versus Type 1).
/// XZD - X unless Z or D is required to maintain IOD conformance
///         (Type 3 versus Type 2 versus Type 1).
/// XZU - X unless Z or replacement of contained instance UIDs (U) is required to
///         maintain IOD conformance (Type 3 versus Type 2 versus Type 1 sequences
///         containing UID references).

//TODO: make this work with IODs, which means all have to have an AType argument

const List<String> defaultDummyValue = const ['Open DICOMweb De-Identifier'];

/// De-identification [Action]s as defined in PS3.15 Annex E.
class Action {
  final int index;
  final String id;
  final String keyword;
  final String description;
  final dynamic action;

  const Action(
      this.index, this.id, this.keyword, this.description, this.action);

  static const Action kInvalid =
      const Action(1, '', 'Invalid', 'Invalid/Undefined Action', invalid);

  static const Action kX =
      const Action(1, 'X', 'Remove', 'Remove Element', remove);

  static const Action kU =
      const Action(2, 'U', 'ReplaceUid', 'Replace UID value(s)', replaceUids);

  static const Action kZ = const Action(3, 'Z', 'ReplaceWithNoValue',
      'Replace with NoValue (or Dummy value(s))', replaceNoValues);

  static const Action kXD = const Action(4, 'XD', 'RemoveUnlessDummy',
      'Remove(X) unless Dummy(D)', removeUnlessDummy);

  static const Action kXZ = const Action(5, 'XZ', 'RemoveUnlessNoValue',
      'Remove(X) unless NoValue(Z)', removeUnlessZero);

  static const Action kXZD = const Action(
      6,
      'XZD',
      'RemoveUnlessZeroOrDummy',
      'Remove(X) unless Replace with NoValue(Z) unless Replace with Dummy(D)',
      removeUnlessZeroOrDummy);

  static const Action kD = const Action(7, 'D', 'ReplaceWithDummy',
      'Replace with Dummy value(S)', updateWithDummy);

  static const Action kZD = const Action(8, 'ZD', 'NoValueUnlessDummy',
      'Replace with NoValue(Z) unless Dummy required', zeroUnlessDummy);

  static const Action kXZU = const Action(
      9,
      'XZU',
      'RemoveUidUnlessNoValueOrReplace',
      'X '
      'unless Z '
      'unless U',
      removeUidUnlessNoValuesOrReplace);
  static const Action kK = const Action(10, 'K', 'Keep', 'Keep Element', retain);

  //Urgent: figure out what this means
  static const Action kKB =
      const Action(11, 'KB', 'KeepBe___', 'Keep Because ????', retainBlank);

  static const Action kC =
      const Action(12, 'C', 'Clean', 'Remove PII from value(s)', clean);

  static const Action kA =
      const Action(13, 'A', 'Add', 'Add If Missing', addIfMissing);

  static const Action kUN =
      const Action(14, 'UN', 'Unknown', 'Action Unknown', unknownAction);

  Element call(Dataset ds, Tag tag, [List values]) =>
      action(ds, tag, values);

  static bool _isEmpty(List values, bool emptyAllowed) => values == null || emptyAllowed;

  static Action invalid(Dataset ds, Tag tag, [List values]) =>
      throw new UnsupportedError('Invalid Action');

  static Element updateWithDummy(Dataset ds, Tag tag, [List values]) =>
      ds.update(tag.code, values);

  /// Replace with a zero length value, or a non-zero length value
  /// that may be a dummy value and consistent with the VR'.
  //static zeroOrDummy(Dataset ds, Tag tag, arg, AType aType) =>
  static List<Element> replaceNoValues(Dataset ds, Tag tag) => ds.noValuesAll(tag.code);

  /// Remove the attribute'.
  static List<Element> remove(Dataset ds, Tag tag) => ds.deleteAll(tag.code);

  /// Keep (unchanged for non-sequence attributes, cleaned for sequences)';
  //TODO: deidentifySequence has to be at a higher level
  static void retain(Dataset ds, Tag tag) => ds.r(tag);

  /// retain (unchanged for non-sequence attributes, cleaned for sequences)';
  //TODO: deidentifySequence has to be at a higher level
  static void retainBlank(Dataset ds, Tag tag) => ds.retain(tag);

  //TODO: what if not present
  /// Clean, that is replace with values of similar meaning known
  /// not to contain identifying information and consistent with the VR.
  //static clean(Datasetds, Tag tag, arg, AType aType) =>
  static bool clean(Dataset ds, Tag tag, List values) =>
      ds.update(tag.code, values) != null;

  /// Replace with a non-zero length UID that is internally consistent
  /// within a set of Instances';
  static Element replaceUids(Dataset ds, Tag tag,
          [List<String> values]) =>
      ds.replaceUidsByTag(tag, values);

  /// Z unless D is required to maintain
  /// IOD conformance (Type 2 versus Type 1)';
  static List<Element> zeroUnlessDummy(Dataset ds, Tag tag, [List values]) {
    //TODO: create a version of this file that works with an IOD definition
    // AType aType = ds.IOD.lookup(a.tag).aType;
    // if ((aType == AType.k1) || (aType == AType.k1C)) {
    //   a.replace(values);
    // } else {
    //TODO: This should really have an IOD argument
    if (_isEmpty(values, true)) return ds.noValues(tag.code);
    return ds.update(tag.code, values);
  }

  /// X unless Z is required to maintain IOD conformance (Type 3 versus Type 2)';
  static List<Element> removeUnlessZero(Dataset ds, Tag tag, [List values]) {
    //TODO: make this work with IODs
    // AType aType = ds.IOD.lookup(a.tag).aType;
    // if ((aType == AType.k2) || (aType == AType.k2C)) {
    //   a.Zero(values);
    // } else {
    // ds.a.remove()
    if (_isEmpty(values, true)) return ds.noValues(tag.code);
    return ds.update(tag.code, values);
  }

  /// X unless D is required to maintain IOD conformance (Type 3 versus Type 1)';
  static List<Element> removeUnlessDummy(Dataset ds, Tag tag, List values) {
    //TODO: make this work with IODs
    // AType aType = ds.IOD.lookup(a.tag).aType;
    // if ((aType == AType.k3)  {
    //   ds.remove.a;
    // } else {
    // a.replace(values);
    if (_isEmpty(values, true)) return ds.remove(tag.code);
    return ds.update(tag.code, values);
  }

  /// X unless Z or D is required to maintain IOD conformance
  /// (Type 3 versus Type 2 versus Type 1)';
  static List<Element> removeUnlessZeroOrDummy(
      Dataset ds, Tag tag, List values) {
    //TODO: fix when AType info available
    if (_isEmpty(values, true)) return ds.noValues(tag.code);
    return ds.lookup(tag.code).update(values);
  }

  /// X unless Z or replacement of contained instance UIDs (U) is
  /// required to maintain IOD conformance
  /// (Type 3 versus Type 2 versus Type 1 sequences containing UID references)';
  static List<Element> removeUidUnlessNoValuesOrReplace(
      Dataset ds, Tag tag, List values) {
    if (ds.lookup(tag.code) is! SQ)
      throw new InvalidTagError(
          'Invalid Tag(${ds.lookup(tag.code)}) for this action');
    //TODO: fix when AType info available
    if (_isEmpty(values, true)) return ds.noValues(tag.code);
    return ds.update(tag.code, values);
  }

  static Element addIfMissing(Dataset ds, Tag tag, List values) {
    var e = ds.lookup(tag.code);
    if (e is! SQ)
      throw new InvalidTagError('Invalid Tag ($e) for this action');
    //TODO: fix when AType info available
    if (_isEmpty(values, true)) return ds.noValues(tag.code, recursive: false);
    return ds.update(tag.code, values);
  }

  static Element unknownAction(Dataset ds, Tag tag, List values) =>
      throw new UnimplementedError();

  @override
  String toString() => 'De-idenfication Action.$id';

  static const Map<String, Action> map = const {
    //TODO: Turn into Jump table
    'X': kX, 'Z': kZ, 'D': kD, 'U': kU, 'XZ': kXZ, 'XD': kXZ,
    'ZD': kZD, 'A': kA, 'K': kK, 'C': kC
  };
}
