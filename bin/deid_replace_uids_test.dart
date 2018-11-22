// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

import 'dart:io';

import 'package:converter/converter.dart';
import 'package:core/server.dart';
import 'package:test_tools/tools.dart';

import 'package:profile/profiler.dart';
import 'package:profile/src/subject_0.dart';

/// A Program that reads a [File], decodes it into a [ByteRootDataset],
/// and then converts that into a [TagRootDataset].
void main() {
 Server.initialize(name: 'deid_replace_uids', level: Level.debug);
   /// A [Map] from current to replacement [Uid]s.
 //  final uidCache = <Uid, Uid>{};
  // Edit this line
  final path = path0;

  log.debug2('Reading: $path');
  final rbds = ByteReader.readPath(path);
  log..debug('rbds.isRoot: ${rbds.isRoot}')
  ..info0(rbds.summary);

  final rtds = TagRootDataset.empty();
  TagDataset.convert(rbds, rtds);

 //Profile basic =  BasicProfile();
 final profiler =  Profiler('basic', '', basic, subject0, {});

  final map = profiler.replaceUids(rtds);
  log..debug('Map: $map')
  ..debug('replaced: ${profiler.report.replacedElements}')
  ..debug('study: ${rtds.lookup(kStudyInstanceUID).info}')
  ..debug('series: ${rtds.lookup(kSeriesInstanceUID).info}')
  ..debug('instance: ${rtds.lookup(kSOPInstanceUID).info}')
  ..info0(rbds.summary);



}
