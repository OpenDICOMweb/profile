// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

import 'dart:io';

import 'package:core/server.dart';
import 'package:convert/data/test_files.dart';
import 'package:convert/dicom.dart';
import 'package:profile/profile.dart';

/// A Program that reads a [File], decodes it into a [BDRootDataset],
/// and then converts that into a [TagRootDataset].
void main() {
  Server.initialize(name: 'profile/remove_test', level: Level.debug);

  // Edit this line
  final path = path0;

  final f = toFile(path, mustExist: true);
  log.debug2('Reading: $f');
  final rbds = BDReader.readFile(f, reUseBD: true);
  log..debug('rbds.isRoot: ${rbds.isRoot}')
  ..info0(rbds.summary);

  var rtds = new TagRootDataset();
  rtds = convertDataset(rbds, rtds);

  final profile = new ProfileBase('foo', 'http:', null);
  final map = profile.replaceUids(rtds);
  log
    ..debug('Map: $map')
    ..debug('replaced: ${profile.replacedElements}')
    ..debug('study: ${rtds.lookup(kStudyInstanceUID).info}')
    ..debug('series: ${rtds.lookup(kSeriesInstanceUID).info}')
    ..debug('instance: ${rtds.lookup(kSOPInstanceUID).info}')
    ..info0(rbds.summary);
}
