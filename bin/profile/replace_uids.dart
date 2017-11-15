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
import 'package:system/server.dart';
import 'package:tag/tag.dart';

import 'package:profile/profiler.dart';
import 'package:profile/src/profiles/basic.dart';
import 'package:profile/src/subject_0.dart';

/// A Program that reads a [File], decodes it into a [RootByteDataset],
/// and then converts that into a [RootTagDataset].
void main() {
  Server.initialize(name: 'replace_uids', level: Level.debug2, throwOnError: true);

  // Edit this line
  var path = path0;
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


  //  profiler.replaceUids(rds, tagDS);

  Map<String, String> uiMap = <String, String>{};
  List<Element> uiElements = <Element>[];
  List<Element> dicomUids = <Element>[];
  TagDataset tagDS = new RootTagDataset();
  walkUids(rds.elements, uiElements, dicomUids, uiMap, tagDS);

  print('${uiElements.length} Uid Elements:');
  int i = 0;
  for (Element e in uiElements) {
    print('$i: $e\n   "${e.value}"');
    i++;
  }

  print('\n${dicomUids.length} dicomMap Entries:');
  i = 0;
  for (Element e in dicomUids) {
    print('$i: "${e.value}"\n  $e');
    i++;
  }

  print('\n${uiMap.length} uiMap Entries:');
  i = 0;
  uiMap.forEach((oldUI, newUI) {
    print('$i: $oldUI\n   $newUI');
    i++;
  });

  print(tagDS.format(new Formatter()));
}

void walkUids(Iterable<Element> elements, 
              List<Element> uiElements,
    List<Element> dicomUids, 
              Map<String, String> uiMap, TagDataset tagDS) {
  for (Element e in elements) {
    if (e.vrCode == VR.kUI.code) {
      print(e);
      uiElements.add(e);
      var oldUI = e.value;
      Uid uid = Uid.lookup(oldUI);
      if (uid != null) {
        dicomUids.add(e);
        continue;
      }
      var newUI = uiMap[oldUI];
      if (newUI != null) {
        print('duplicate: $e');
        continue;
      }
      newUI = Uid.generateSecureUidString();
      uiMap[oldUI] = newUI;
      TagElement te = ByteReader.makeTagElement(e);
      TagElement nte = te.update([newUI]);
      tagDS.add(nte);
    } else if (e.isSequence) {
      for (Dataset item in e.values) {
        walkUids(item.elements, uiElements, dicomUids, uiMap, tagDS);
      }
    }
  }
}


