// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Original author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.
//
import 'dart:io';


import 'package:converter/converter.dart';
import 'package:core/server.dart';

import 'package:profile/profiler.dart';

import 'package:profile/src/subject_0.dart';
import 'package:test_tools/tools.dart';

/// A Program that reads a [File], decodes it into a [ByteRootDataset],
/// and then converts that into a [TagRootDataset].
void main() {
  Server.initialize(level: Level.debug2, throwOnError: true);

  // Edit this line
  final path = path1;
//  Profile basic =  BasicProfile();
  final profiler =  Profiler('basic', '', BasicProfile, subject0, {});
  
  final rds = ByteReader.readPath(path);
  log.debug('rds.isRoot: ${rds.isRoot}');

  // Formatter z =  Formatter(maxDepth: -1);
  //print(rds.format(z));
  print('${BasicProfile.removeCodes.length} keys in keysToRemove');
  print('${rds.total} elements in dataset');
  print(rds.summary);

  profiler.processKeysToDelete(rds);

  final removed = profiler.report.deletedElements;
  print('${removed.length} elements removed');
  var i = 0;
  for (var e in removed) {
    if (e is SQ) {
      print('$i: ${e.total} $e');
    } else {
      print('$i: $e');
    }
    i++;
  }
  print(rds.summary);
//  print(profiler.report.info);
}
