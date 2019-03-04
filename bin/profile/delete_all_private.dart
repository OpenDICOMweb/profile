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
import 'package:test_tools/tools.dart';

/// A Program that reads a [File], decodes it into a [ByteRootDataset],
/// and then converts that into a [TagRootDataset].
void main() {
  Server.initialize(level: Level.info, throwOnError: false);

  log.info('Testing ${paths.length} files:');
  for (var i = 0; i < paths.length; i++) {
    final path = paths[i];

    // Byte Dataset
    final bds = ByteReader.readPath(path);
    var before = bds.findAllPrivateCodes(recursive: true);

    if (before.isNotEmpty) {
      log
        ..info('$i: path: :$path"')
        ..info('  BDS Before (${before.length}) ${codeListToString(before)}')
        ..info('  BDS: ${bds.summary}')
        ..debug(bds.format(Formatter(maxDepth: -1)));

      var removed = bds.deleteAllPrivate(recursive: true);
      log.info('  BDS ${removed.length} elements removed');
      var after = bds.findAllPrivateCodes(recursive: true);
      log.info('  BDS After (${after.length}) ${codeListToString(after)}');
      final v = checkForPrivateElements(bds);
      if (v) {
        print('** Private elements found');
        continue;
      }
      assert(after.isEmpty, 'BDS After: $after');
      log
        ..info('  Private: ${bds.nPrivate}')
        ..info('  Private SQ: ${bds.nPrivateSequences}')
        ..info(bds.summary);

      // Test Tag Reader
      final tds = TagReader.readPath(path);
      before = tds.findAllPrivateCodes(recursive: true);

      log
        ..info('  TDS Before (${before.length}) ${codeListToString(before)}')
        ..info('  TDS: ${tds.summary}')
        ..debug(tds.format(Formatter(maxDepth: -1)));

      removed = tds.deleteAllPrivate(recursive: true);

      after = tds.findAllPrivateCodes(recursive: true);
      log.info('  TDS After (${after.length}) ${codeListToString(after)}');
      assert(after.isEmpty, 'TDS After: $after');
      log..info('  TDS ${removed.length} elements removed')..info(tds.summary);
    }
  }
}
