// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

import 'dart:collection';

import 'package:core/core.dart';

/// A [Map<Uid, Uid>] from original [Uid] to replacement [Uid].
/// Once in the table an entry can not be updated.
class UidReplacementMap extends MapBase<Uid, Uid> {
  final Map<Uid, Uid> map;

  UidReplacementMap() : map = <Uid, Uid>{};

  @override
  Uid operator [](Object original) =>
      (original is Uid)
      ? map[original]
      : invalidUid(original);

  @override
  void operator []=(Object original, Uid replacement) {
    if (original is! Uid) return invalidUid(original);
    if (replacement is! Uid) return invalidUid(replacement);
    if (original is Uid && replacement is Uid) {
      final old = map.putIfAbsent(original, () => replacement);
      if (old != null) return invalidDuplicateUid(original);
    }
  }

  @override
  List<Uid> get keys => map.keys;

  @override
  void clear() => map.clear();

  @override
  Uid remove(Object original) =>
      (original is Uid) ? map.remove(original) : invalidUid(original);

  void initialize(Dataset ds) {
    final UI study = ds.lookup(kStudyInstanceUID);
    map[study.uid] = new Uid();
    final UI series = ds.lookup(kSeriesInstanceUID);
    map[series.uid] = new Uid();
    final UI instance = ds.lookup(kSOPInstanceUID);
    map[instance.uid] = new Uid();
  }

  Dataset update(Dataset original, [Dataset updated]) {
    updated ??= original;
    for(var e0 in original.elements) {
      if (e0 is UI) {
        final uids = e0.uids;
        if (uids.isEmpty) continue;

        List<String> newUids;
        var same = true;
        for(var i = 0; i < uids.length; i++) {
          final replacement = map[e0.uid];
           if (replacement == null) continue;
           newUids ??= _copyUids(uids, i);
           newUids[i] = replacement.asString;
           same = false;
        }

        if (same) continue;
        final e1 = e0.update(newUids);
        updated.update(e1.index, newUids);
      } else if (e0 is SQ) {
        //Urgent Jim to finish
      }
    }
    return updated;
  }

  List<String> _copyUids(List<Uid> vList, int index) {
    final nList = new List<String>(vList.length);
    for(var i = 0; i < index ; i++)
      nList[i] = vList[i].asString;
    return nList;
  }


  @override
  String toString() => '$runtimeType: $map';
}
