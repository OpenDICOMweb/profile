// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

import 'dart:io';

import 'package:system/system.dart';
import 'package:dcm_convert/data/test_files.dart';
import 'package:dcm_convert/dcm.dart';
import 'package:profile/profile.dart';

/// A Program that reads a [File], decodes it into a [RootByteDataset],
/// and then converts that into a [RootTagDataset].
void main() {
  log.level = Level.debug3;
  System.log.level = Level.debug0;

  // Edit this line
  var path = path0;

  File f = toFile(path, mustExist: true);
  log.debug2('Reading: $f');
  RootByteDataset rbds = ByteReader.readFile(f, fast: true);
  log.debug('rbds.isRoot: ${rbds.isRoot}');
  log.info0(rbds.summary);

  RootTagDataset rtds = new RootTagDataset();
   rtds = convertDataset(rbds, rtds);

  var profile = new ProfileBase("foo", 'http:', null);
  var map = profile.replaceUids(rtds);
  log.debug('Map: $map');
  log.debug('replaced: ${profile.replacedElements}');
  log.debug('study: ${rtds.lookup(kStudyInstanceUID).info}');
  log.debug('series: ${rtds.lookup(kSeriesInstanceUID).info}');
  log.debug('instance: ${rtds.lookup(kSOPInstanceUID).info}');

  log.info0(rbds.summary);



}
