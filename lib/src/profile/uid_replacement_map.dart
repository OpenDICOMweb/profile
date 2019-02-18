// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.
//
import 'dart:collection';

import 'package:core/core.dart';

// ignore_for_file: public_member_api_docs

/// A [Map<Uid, Uid>] from original [Uid] to replacement [Uid].
/// Once in the table an entry can not be updated.
class UidReplacementMap extends MapBase<Uid, Uid> {
  final Map<Uid, Uid> replacements;

  UidReplacementMap() : replacements = <Uid, Uid>{};

  @override
  Uid operator [](Object key) =>
      (key is Uid)
      ? replacements[key]
      : invalidUid(key);

  @override
  void operator []=(Uid key, Uid value) {
    if (key is! Uid) return invalidUid(key);
    if (value is! Uid) return invalidUid(value);
    if (key is Uid && value is Uid) {
      final old = replacements.putIfAbsent(key, () => value);
      if (old != null) return invalidDuplicateUid(key);
    }
  }

  @override
  List<Uid> get keys => replacements.keys;

  @override
  void clear() => replacements.clear();

  @override
  Uid remove(Object key) =>
      (key is Uid) ? replacements.remove(key) : invalidUid(key);

  void initialize(Dataset ds) {
    final UI study = ds.lookup(kStudyInstanceUID);
    replacements[study.uid] =  Uid();
    final UI series = ds.lookup(kSeriesInstanceUID);
    replacements[series.uid] =  Uid();
    final UI instance = ds.lookup(kSOPInstanceUID);
    replacements[instance.uid] =  Uid();
  }

  Dataset convert(Dataset original, [Dataset updated]) {
    updated ??= original;
    for(var e0 in original.elements) {
      if (e0 is UI) {
        final uids = e0.uids;
        if (uids.isEmpty) continue;

        final list = <String>[];
        var same = true;
        for(var uid in uids) {
          final s = replacements[uid];
           if (s == null) continue;
//           Uids ??= _copyUids(uids, i);
           list.add(s.asString);
           same = false;
        }

        if (same) continue;
        final e1 = e0.update(list);
        updated.update(e1.index, list);
      } else if (e0 is SQ) {
        //Urgent Jim to finish
      }
    }
    return updated;
  }

/*
  // TODO: convert the list here
  List<String> _createReplacementList(List<Uid> vList, int index) {
    final nList =  List<String>(vList.length);
    for(var i = 0; i < index ; i++)
      nList[i] = vList[i].asString;
    return nList;
  }
*/


  @override
  String toString() => '$runtimeType: $map';
}
