// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.
//
import 'dart:io';

import 'package:core/server.dart';
import 'package:converter/converter.dart';
import 'package:test_tools/tools.dart';

/// A Program that reads a [File], decodes it into a [ByteRootDataset],
/// and then converts that into a [TagRootDataset].
void main() {
  Server.initialize(name: 'profile/remove_test', level: Level.debug);

  // Edit this line
  final path = path0;

  log.debug2('Reading: $path');
  final bdRds = ByteReader.readPath(path);
  log
    ..debug('rbds.isRoot: ${bdRds.isRoot}')
    ..info0(bdRds.summary)
    ..debug('replaced: ${bdRds.removed}')
    ..debug('study: ${bdRds.lookup(kStudyInstanceUID).info}')
    ..debug('series: ${bdRds.lookup(kSeriesInstanceUID).info}')
    ..debug('instance: ${bdRds.lookup(kSOPInstanceUID).info}');

  var tagRds =  TagRootDataset.empty();
  tagRds = TagRootDataset.convert(bdRds);

  final map = replaceUids(tagRds);
  log
    ..debug('Map: $map')
    ..debug('replaced: ${tagRds.removed}')
    ..debug('study: ${tagRds.lookup(kStudyInstanceUID).info}')
    ..debug('series: ${tagRds.lookup(kSeriesInstanceUID).info}')
    ..debug('instance: ${tagRds.lookup(kSOPInstanceUID).info}')
    ..info0(bdRds.summary);
}
