// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.
//
import 'package:converter/converter.dart';
import 'package:core/server.dart';
import 'package:test_tools/tools.dart';

void main() {
  Server.initialize(level: Level.info, throwOnError: true);

  const path = path0;
  const group = 10;

  final rds = ByteReader.readPath(path);
  print('remove group: $group');
  final startTotal = rds.total;
  final startTopLevel = rds.elements.length;
  print('$startTotal total elements in Dataset');
  print('$startTopLevel top level elements in Dataset');

  var count = 0;
  for (final e in rds.elements) {
    if (group == e.group) count++;
  }
  print('$count top level group elements found');

  final removed = <Element>[];
  for (final e in rds.elements) {
    if (e is SQ) {
      // Urgent: this should be recursive it isn't
      for (final item in e.items) {
        for (final e in item.elements) {
          if (group == e.group) {
            final deleted = item.deleteAll(e.code);
            removed.addAll(deleted);
            if (rds.lookupAll(e.code) != null) print('$e not removed');
          }
        }
      }
    } else if (group == e.group) {
      final ok = rds.delete(e.code);
      if (ok == null) print('** $e not removed');
      removed.add(e);
      if (rds.lookup(e.code) != null) print('$e not removed');
    }
  }
  final endTotal = rds.total;
  final endTopLevel = rds.elements.length;
  print('$endTotal total elements in Dataset');
  print('$endTopLevel top level elements in Dataset');
  print('Removed ${removed.length} elements:');
  for (final e in removed) print('  $e');

  for (final e in rds.elements) {
    if (group == e.group) print('*** group element not removed: $e');
  }
}
