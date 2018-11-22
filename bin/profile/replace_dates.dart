// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Original author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.
//
import 'dart:io';

import 'package:converter/converter.dart';
import 'package:core/server.dart';
import 'package:test_tools/tools.dart';

/// A Program that reads a [File], decodes it into a [ByteRootDataset],
/// and then converts that into a [TagRootDataset].
void main() {
  Server.initialize(
      name: 'replace_dates', level: Level.debug2, throwOnError: true);

  // Edit this line
  final path = path1;
  log.debug2('Reading: $path');
  final ds = TagReader.readPath(path);
  log.debug('rds.isRoot: ${ds.isRoot}');

  // Formatter z =  Formatter(maxDepth: -1);
  //print(rds.format(z));
  print('${BasicProfile.removeCodes.length} keys in keysToRemove');
  print('${ds.total} elements in dataset');
  print(ds.summary);

  //  profiler.replaceUids(rds, tagDS);

  final enrollment = Date.parse('19700101');

  final tds = TagRootDataset.empty();
  walkDates(ds, enrollment);

  print('enrollment: "$enrollment"');
  print('${tds.length} Date Elements:');
  var i = 0;
  for (var e in tds.elements) {
    print('$i: $e\n   "${e.value}"');
    i++;
  }

  print(tds.format(Formatter()));
}

void walkDates(Dataset ds, Date enrollment) {
  for (var e in ds.elements) {
    if (e is DA) {
      print('old: $e');
      final list = Date.normalizeStrings(e.values, enrollment);
      ds.update(e.code, list);
      print('new: ${ds.lookup(e.code, required: true)}');
    } else if (e is SQ) {
      for (var i = 0; i < e.items.length; i++)
        walkDates(e.items[i], enrollment);
    }
  }
}

void normalizeDate(ByteElement be, Date enrollment, Dataset ds) {
  if (be.vrCode == VR.kDA.code) {
    //    print('\nByteE: ${e.info}');
    //  replacedElements.add(be);
    DA te = TagElement.fromBytes(be.bytes, ds);
    te = te.normalize(enrollment);
    print('Normal: ${te.date}');
    print('Normal DA: $te');
    ds.add(te);
  } else {
    throw 'error';
  }
}
