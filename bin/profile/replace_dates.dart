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

import 'package:profile/profile.dart';
import 'package:profile/src/profiles/basic.dart';
import 'package:profile/src/subject_0.dart';

/// A Program that reads a [File], decodes it into a [RootByteDataset],
/// and then converts that into a [RootTagDataset].
void main() {
  Server.initialize(name: "replace_dates", level: Level.debug2, throwOnError: true);

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

  //  profiler.replaceUids(rds, tagDS);

  String enrollment = "19700101";
  List<Element> daElements = <Element>[];
  TagDataset tagDS = new RootTagDataset();
  walkDates(rds.elements, daElements,  enrollment, tagDS);

  print('enrollment: "$enrollment"');
  print('${daElements.length} Date Elements:');
  int i = 0;
  for (Element e in daElements) {
    print('$i: $e\n   "${e.value}"');
    i++;
  }

  print(tagDS.format(new Formatter()));
}

void walkDates(Iterable<Element> elements, List<Element> daElements,
    String enrollment, TagDataset tagDS) {
  for (Element e in elements) {
    if (e.vrCode == VR.kDA.code) {
      normalizeDate(e, enrollment, tagDS);
    } else if (e.isSequence) {
      for (Dataset item in e.values) {
        walkDates(item.elements, daElements, enrollment, tagDS);
      }
    }
  }
}

void normalizeDate(ByteElement be, String enrollment, TagDataset tagDS) {
  if (be.vrCode == VR.kDA.code) {
    //    print('\nByteE: ${e.info}');
  //  replacedElements.add(be);
    DA te = ByteReader.makeTagElement(be);
    te = te.normalize(enrollment);
    print('Normal: ${te.date}');
    print('Normal DA: $te');
    tagDS.add(te);
  } else {
    throw 'error';
  }
}
