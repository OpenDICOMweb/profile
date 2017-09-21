// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

import 'dart:io';

import 'package:dcm_convert/data/test_files.dart';
import 'package:dcm_convert/dcm.dart';
import 'package:profile/profile.dart';
import 'package:system/server.dart';
import 'package:uid/uid.dart';

/// A Program that reads a [File], decodes it into a [RootByteDataset],
/// and then converts that into a [RootTagDataset].
void main() {
 Server.initialize(name: 'deid_replace_uids', level: Level.debug);

   /// A [Map] from current to replacement [Uid]s.
   Map<Uid, Uid> uidCache = <Uid, Uid>{};
  // Edit this line
  var path = path0;

  File f = toFile(path, mustExist: true);
  log.debug2('Reading: $f');
  RootByteDataset rbds = ByteReader.readFile(f, fast: true);
  log.debug('rbds.isRoot: ${rbds.isRoot}');
  log.info0(rbds.summary);

  RootTagDataset rtds = new RootTagDataset();
   rtds = convertDataset(rbds, rtds);

  var profile = new Profiler("foo", 'http:', null, null, null);
  var map = profile.replaceUids(rtds);
  log.debug('Map: $map');
  log.debug('replaced: ${profile.report.replacedElements}');
  log.debug('study: ${rtds.lookup(kStudyInstanceUID).info}');
  log.debug('series: ${rtds.lookup(kSeriesInstanceUID).info}');
  log.debug('instance: ${rtds.lookup(kSOPInstanceUID).info}');

  log.info0(rbds.summary);



}
