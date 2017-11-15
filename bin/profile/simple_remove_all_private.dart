// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Original author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

import 'dart:io';

import 'package:dcm_convert/data/test_files.dart';
import 'package:dcm_convert/dcm.dart';

import 'package:profile/profiler.dart';

import 'package:system/server.dart';

import 'package:profile/src/profiles/basic.dart';

import 'package:profile/src/subject_0.dart';

/// A Program that reads a [File], decodes it into a [RootByteDataset],
/// and then converts that into a [RootTagDataset].
void main() {
  Server.initialize(level: Level.debug2, throwOnError: true);

  // Edit this line
  var path = path1;
  Profile basic = new Basic();
  Profiler profiler = new Profiler("basic", "", basic, subject0, {});

  File f = new File(path);
  log.debug2('Reading: $f');
  RootByteDataset rds = ByteReader.readFile(f, fast: true);
  log.debug('rds.isRoot: ${rds.isRoot}');

  // Formatter z = new Formatter(maxDepth: -1);
  //print(rds.format(z));
  print('${basic.keysToRemove.length} keys in keysToRemove');
  print('${rds.total} elements in dataset');
  print(rds.summary);

  profiler.processKeysToRemove(rds);

  List removed = profiler.report.removedElements;
  print('${removed.length} elements removed');
  int i = 0;
  for (Element e in removed) {
    if (e.isSequence) {
      print('$i: ${e.total} $e');
    } else {
      print('$i: $e');
    }
    i++;
  }
  print(rds.summary);
//  print(profiler.report.info);
}
