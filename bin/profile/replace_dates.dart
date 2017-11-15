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
import 'package:dcm_convert/byte_convert.dart';
import 'package:system/server.dart';
import 'package:tag/tag.dart';

import 'package:profile/profiler.dart';
import 'package:profile/src/profiles/basic.dart';
import 'package:profile/src/subject_0.dart';

/// A Program that reads a [File], decodes it into a [RootByteDataset],
/// and then converts that into a [RootTagDataset].
void main() {
  Server.initialize(name: "replace_dates", level: Level.debug2, throwOnError: true);

  // Edit this line
  var path = path1;
  Profile basic = new BasicProfile();
  Profiler profiler = new Profiler("basic", "", basic, subject0, {});

  File f = new File(path);
  log.debug2('Reading: $f');
  RootByteDataset sds = ByteReader.readFile(f, fast: true);
  log.debug('rds.isRoot: ${sds.isRoot}');

  // Formatter z = new Formatter(maxDepth: -1);
  //print(rds.format(z));
  print('${basic.keysToDelete.length} keys in keysToRemove');
  print('${sds.total} elements in dataset');
  print(sds.summary);

  //  profiler.replaceUids(rds, tagDS);

  Date enrollment = Date.parse("19700101");

  TagDataset tds = new RootTagDataset();
  walkDates(sds, tds,  enrollment);

  print('enrollment: "$enrollment"');
  print('${tds.length} Date Elements:');
  int i = 0;
  for (Element e in tds.elements) {
    print('$i: $e\n   "${e.value}"');
    i++;
  }

  print(tds.format(new Formatter()));
}

void walkDates(RootByteDataset sds, RootTagDataset tds, Date enrollment) {
	TagDataset parent = tds;
  for (Element be in sds.elements) {
    if (be.vrCode == VR.kDA.code) {
    	  var s = Date.normalizeStrings(be.values, enrollment);
    } else if (be.isSequence) {
    	  SQ sq = parent.lookup(be.code);
    	  if (sq = null) {
    	  	List<TagItem> items = new List<TagItem>(be.values.length);
    	  	for(int i = 0; i < be.values.length; i++)
    	  		//Urgent: add sequence to empty TagItem
    	  		items[i] = new TagItem(parent, null, null);
    	  	sq = new SQ(be.tag, parent, items);
      for(ByteItem bItem in be.i)

        walkDates(source, target, enrollment, tagDS);
      }
    }
  }
}

void normalizeDate(ByteElement be, Date enrollment, TagDataset tagDS) {
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
