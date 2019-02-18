// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.
//
import 'package:core/core.dart';

// ignore_for_file: public_member_api_docs

/// This library implements DICOM study de-identification.  It conforms to
/// DICOM PS3.15 Appendix E.
///
/// D   - Replace with a non-zero length value that may be a dummy
///       value and consistent with the VR.
/// Z   - Replace with a zero length value, or a non-zero length value
///       that may be a dummy value and consistent with the VR.
/// X   - Remove.
/// K   - Keep (unchanged for non-sequence attributes, cleaned for sequences).
/// C   - Clean, that is update with values of similar meaning known
///       not to contain identifying information and consistent with the VR.
/// U   - Replace with a non-zero length UID that is internally
///       consistent within a set of Instances.
/// ZD  - Z unless D is required to maintain IOD conformance
///       (Type 2 versus Type 1).
/// XZ  - X unless Z is required to maintain IOD conformance
///       (Type 3 versus Type 2).
/// XD  - X unless D is required to maintain IOD conformance
///       (Type 3 versus Type 1).
/// XZD - X unless Z or D is required to maintain IOD conformance
///       (Type 3 versus Type 2 versus Type 1).
/// XZU - X unless Z or replacement of contained instance UIDs (U)
///       is required to maintain IOD conformance (Type 3 versus
///       Type 2 versus Type 1 sequences containing UID references).

//TODO: make this work with IODs, which means all have to have an AType argument

const List<String> defaultDummyValue = ['Open DICOMweb De-Identifier'];

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
      Action(1, '', 'Invalid', 'Invalid/Undefined Action', invalid);

  static const Action kX = Action(1, 'X', 'Remove', 'Remove Element', remove);

  static const Action kU =
      Action(2, 'U', 'ReplaceUid', 'Replace UID value(s)', replaceUids);

  static const Action kZ = Action(3, 'Z', 'ReplaceWithNoValue',
      'Replace with NoValue (or Dummy value(s))', replaceNoValues);

  static const Action kXD = Action(4, 'XD', 'RemoveUnlessDummy',
      'Remove(X) unless Dummy(D)', removeUnlessDummy);

  static const Action kXZ = Action(5, 'XZ', 'RemoveUnlessNoValue',
      'Remove(X) unless NoValue(Z)', removeUnlessZero);

  static const Action kXZD = Action(
      6,
      'XZD',
      'RemoveUnlessZeroOrDummy',
      'Remove(X) unless Replace with NoValue(Z) unless Replace with Dummy(D)',
      removeUnlessZeroOrDummy);

  static const Action kD = Action(7, 'D', 'ReplaceWithDummy',
      'Replace with Dummy value(S)', updateWithDummy);

  static const Action kZD = Action(8, 'ZD', 'NoValueUnlessDummy',
      'Replace with NoValue(Z) unless Dummy required', zeroUnlessDummy);

  static const Action kXZU = Action(
      9,
      'XZU',
      'RemoveUidUnlessNoValueOrReplace',
      'X '
      'unless Z '
      'unless U',
      removeUidUnlessNoValuesOrReplace);
  static const Action kK = Action(10, 'K', 'Keep', 'Keep Element', retain);

  //Urgent: figure out what this means
  static const Action kKB =
      Action(11, 'KB', 'KeepBe___', 'Keep Because ????', retainBlank);

  static const Action kC =
      Action(12, 'C', 'Clean', 'Remove PII from value(s)', clean);

  static const Action kA =
      Action(13, 'A', 'Add', 'Add If Missing', addIfMissing);

  static const Action kUN =
      Action(14, 'UN', 'Unknown', 'Action Unknown', unknownAction);

  Element call(Dataset ds, Tag tag, [List values]) => action(ds, tag, values);

  static bool _isEmpty(List values, bool emptyAllowed) =>
      values == null || emptyAllowed;

  static Action invalid(Dataset ds, Tag tag, [List values]) =>
      throw UnsupportedError('Invalid Action');

  static Element updateWithDummy<V>(Dataset ds, Tag tag, [List<V> values]) =>
      ds.update<V>(tag.code, values);

  /// Replace with a zero length value, or a non-zero length value
  /// that may be a dummy value and consistent with the VR'.
  //static zeroOrDummy(Dataset ds, Tag tag, arg, AType aType) =>
  static List<Element> replaceNoValues(Dataset ds, Tag tag) =>
      ds.noValuesAll(tag.code);

  /// Remove the attribute'.
  static List<Element> remove(Dataset ds, Tag tag) => ds.deleteAll(tag.code);

  /// Keep (unchanged for non-sequence attributes, cleaned for sequences)';
  //TODO: deidentifySequence has to be at a higher level
  static void retain(Dataset ds, Tag tag) =>
      //fIX OR fLUSH
      // ds.retain(tag);
      1 + 1;

  /// retain (unchanged for non-sequence attributes, cleaned for sequences)';
  //TODO: deidentifySequence has to be at a higher level
  static void retainBlank(Dataset ds, Tag tag) =>
      //fIX OR fLUSH
      // ds.retain(tag);
      1 + 1;

  //TODO: what if not present
  /// Clean, that is replace with values of similar meaning known
  /// not to contain identifying information and consistent with the VR.
  //static clean(Datasetds, Tag tag, arg, AType aType) =>
  static bool clean<V>(Dataset ds, Tag tag, List<V> values) =>
      ds.update<V>(tag.code, values) != null;

  /// Replace with a non-zero length UID that is internally consistent
  /// within a set of Instances';
  static List<Uid> replaceUids(Dataset ds, Tag tag, [Iterable<Uid> values]) =>
      ds.replaceUids(tag.code, values);

  /// Z unless D is required to maintain
  /// IOD conformance (Type 2 versus Type 1)';
  static Element zeroUnlessDummy<V>(Dataset ds, Tag tag, [List<V> values]) {
    //TODO: create a version of this file that works with an IOD definition
    // AType aType = ds.IOD.lookup(a.tag).aType;
    // if ((aType == AType.k1) || (aType == AType.k1C)) {
    //   a.replace(values);
    // } else {
    //TODO: This should really have an IOD argument
    if (_isEmpty(values, true)) return ds.noValues(tag.code);
    return ds.update<V>(tag.code, values);
  }

  /// X unless Z is required to maintain IOD conformance
  /// (Type 3 versus Type 2)';
  static Element removeUnlessZero<V>(Dataset ds, Tag tag, [List<V> values]) {
    //TODO: make this work with IODs
    // AType aType = ds.IOD.lookup(a.tag).aType;
    // if ((aType == AType.k2) || (aType == AType.k2C)) {
    //   a.Zero(values);
    // } else {
    // ds.a.remove()
    if (_isEmpty(values, true)) return ds.noValues(tag.code);
    return ds.update<V>(tag.code, values);
  }

  /// X unless D is required to maintain IOD conformance
  /// (Type 3 versus Type 1)';
  static Element removeUnlessDummy<V>(Dataset ds, Tag tag, List<V> values) {
    //TODO: make this work with IODs
    // AType aType = ds.IOD.lookup(a.tag).aType;
    // if ((aType == AType.k3)  {
    //   ds.remove.a;
    // } else {
    // a.replace(values);
    if (_isEmpty(values, true)) return ds.delete(tag.code);
    return ds.update<V>(tag.code, values);
  }

  /// X unless Z or D is required to maintain IOD conformance
  /// (Type 3 versus Type 2 versus Type 1)';
  static Element removeUnlessZeroOrDummy(Dataset ds, Tag tag, List values) {
    //TODO: fix when AType info available
    if (_isEmpty(values, true)) return ds.noValues(tag.code);
    return ds.lookup(tag.code).update(values);
  }

  /// X unless Z or replacement of contained instance UIDs (U) is
  /// required to maintain IOD conformance
  /// (Type 3 versus Type 2 versus Type 1 sequences containing UID references)';
  static Element removeUidUnlessNoValuesOrReplace(
      Dataset ds, Tag tag, List<Uid> values) {
    if (ds.lookup(tag.code) is! SQ)
      throw InvalidTagError('in RemoveUid', tag, UI);
    //TODO: fix when AType info available
    if (_isEmpty(values, true)) return ds.noValues(tag.code);
    return ds.update<Uid>(tag.code, values);
  }

  static Element addIfMissing(Dataset ds, Tag tag, List<Item> values) {
    final e = ds.lookup(tag.code);
    if (e is! SQ) throw InvalidTagError('addIfMissing', tag, Element);
    //TODO: fix when AType info available
    if (_isEmpty(values, true)) return ds.noValues(tag.code);
    return ds.update<Item>(tag.code, values);
  }

  static Element unknownAction(Dataset ds, Tag tag, List values) =>
      throw UnimplementedError();

  @override
  String toString() => 'De-idenfication Action.$id';

  static const Map<String, Action> map = {
    //TODO: Turn into Jump table
    'X': kX,
    'Z': kZ,
    'D': kD,
    'U': kU,
    'XZ': kXZ,
    'XD': kXZ,
    'ZD': kZD,
    'A': kA,
    'K': kK,
    'C': kC
  };
}
