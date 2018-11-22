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
  Server.initialize(level: Level.info, throwOnError: true);

  log.info('Testing ${paths.length} files:');
  for (var i = 0; i < paths.length; i++) {
    final path = paths[i];
    final bds = ByteReader.readPath(path);
    log
      ..info('$i: path: :$path"')
      ..info(bds.summary)
      ..debug(bds.format(Formatter(maxDepth: -1)));

    final removed = bds.deleteAllPrivate(recursive: true);

    final after = bds.findAllPrivateCodes(recursive: true);
    assert(after.isEmpty, 'after: $after');
    log..info('${removed.length} elements removed')..info(bds.summary);
  }
}
