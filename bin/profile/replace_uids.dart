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
      name: 'replace_uids', level: Level.debug2, throwOnError: true);

  // Edit this line
  const path = path0;
//  Profile basic =  BasicProfile();
//  Profiler profiler =  Profiler("basic", "", basic, subject0, {});

  final f =  File(path);
  log.debug2('Reading: $f');
  final rds = ByteReader.readFile(f);
  log.debug('rds.isRoot: ${rds.isRoot}');

  // Formatter z =  Formatter(maxDepth: -1);
  //print(rds.format(z));
  print('${BasicProfile.removeCodes.length} keys in keysToRemove');
  print('${rds.total} elements in dataset');
  print(rds.summary);

  //  profiler.replaceUids(rds, tagDS);

  final uiMap = <String, String>{};
  final uiElements = <Element>[];
  final dicomUids = <Element>[];
  final tagDS =  TagRootDataset.empty();
  walkUids(rds.elements, uiElements, dicomUids, uiMap, tagDS);

  print('${uiElements.length} Uid Elements:');
  var i = 0;
  for (final e in uiElements) {
    print('$i: $e\n   "${e.value}"');
    i++;
  }

  print('\n${dicomUids.length} dicomMap Entries:');
  i = 0;
  for (final e in dicomUids) {
    print('$i: "${e.value}"\n  $e');
    i++;
  }

  print('\n${uiMap.length} uiMap Entries:');
  i = 0;
  uiMap.forEach((oldUI, ui) {
    print('$i: $oldUI\n   $ui');
    i++;
  });

  print(tagDS.format( Formatter()));
}

void walkUids(Iterable<Element> elements, List<Element> uiElements,
    List<Element> dicomUids, Map<String, String> uidMap, Dataset tagDS) {
  for (var e in elements) {
    if (e is UI) {
      print(e);
      uiElements.add(e);
      final value = e.value;
      final uid = Uid.lookup(value);
      if (uid != null) {
        dicomUids.add(e);
        continue;
      }
      var ui = uidMap[value];
      if (ui != null) {
        print('duplicate: $e');
        continue;
      }
      ui = Uid.generateSecureUidString();
      uidMap[value] = ui;
      final te = TagElement.fromBytes(e.bytes, tagDS);
      final nte = te.update(<String>[ui]);
      tagDS.add(nte);
    } else if (e is SQ) {
      for (Dataset item in e.values) {
        walkUids(item.elements, uiElements, dicomUids, uidMap, tagDS);
      }
    }
  }
}
