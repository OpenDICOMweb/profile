// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> - 
// See the AUTHORS file for other contributors.

import 'dart:io';

import 'package:dcm_convert/dcm.dart';
import 'package:system/server.dart';

import 'package:dcm_convert/data/test_files.dart';

List<int> groups = <int>[0x0010, 0x0020];

void main() {
  Server.initialize(level: Level.debug2, throwOnError: true);

  var path = path0;

  File f = toFile(path, mustExist: true);
  log.debug2('Reading: $f');
  RootByteDataset rds = ByteReader.readFile(f, fast: true);
  log.debug('rds.isRoot: ${rds.isRoot}');
  //Formatter z = new Formatter(maxDepth: -1);
  //print(rds.format(z));

  print('${rds.total} elements in Dataset');
  int count = 0;
  for(Element e in rds.map.values.toList(growable: false)) {
    if (groups.contains(e.group)) count++;
  }
  print('$count group elements found');

  List<Element> removed = <Element>[];
  for(Element e in rds.map.values.toList(growable: false)) {
    if (groups.contains(e.group)) {
      rds.remove(e.key);
      removed.add(e);
    } else if (e.isSequence) {
      // Urgent: this should be recursive it isn't
      var sq = e as SequenceMixin;
      for (Dataset item in sq.items) {
        for (Element e in item.elements) {
          if (groups.contains(e.group)) {
            rds.remove(e.key);
            removed.add(e);
          }
        }
      }
    }
  }
  print('Removed ${removed.length} elements:');
  for(Element e in removed) {
    print('  $e');
  }

  print('${rds.total} elements in Dataset:');
  for(Element e in rds.map.values) {
    if (groups.contains(e.group))
      print('*** group element not removed: $e');
    print('  $e');
  }

}