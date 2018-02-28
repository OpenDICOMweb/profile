// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

import 'dart:io';

import 'package:convert/convert.dart';
import 'package:core/server.dart';
import 'package:profile/profile.dart';

import 'package:convert/data/test_files.dart';

// ignore_for_file: only_throw_errors

/// A Program that reads a [File], decodes it into a [RootDataset],
/// and then converts that into a [RootDataset].
void main() {
  Server.initialize(name: 'profile/remove_test', level: Level.debug);
  // Edit this line
  final path = path0;

  log.debug2('Reading: $path');
  final bdRds = BDReader.readPath(path, reUseBD: true);
  log.debug('bRoot.isRoot: ${bdRds.isRoot}');

  print('basicProfileRemoveCodes.length: ${basicProfileRemoveCodes.length}');
  print('basicProfile.removeCodes.length: ${BasicProfile.removeCodes.length}');
  print('basicProfile.removeCodes.length: ${BasicProfile.codes.length}');
  final removeTargets = <Element>[];
  final removeResults = <Element>[];

  print(bdRds.summary);
  for (var code in basicProfileRemoveCodes) {
    final results = bdRds.lookupAll(code);
    if (results != null && results.isNotEmpty) removeTargets.addAll(results);
  }
  print('removeTargets: [${removeTargets.length}]$removeTargets');

  for (var code in basicProfileRemoveCodes) {
    final results = bdRds.delete(code);
    if (results != null && results.isNotEmpty) removeResults.add(results);
  }

  for (var code in basicProfileRemoveCodes) {
    final e = bdRds.lookup(code);
    if (e != null) throw 'Element still present';
  }

/* Urgent: figure out how to determine correctness
  if (removeTargets.length == removeResults.length) {
    for (int i = 0; i < removeTargets.length; i++)
      if (removeTargets[i] != removeResults[i])
        throw 'Unequal results';
  } else {
    throw 'Different Lengths: \n  $removeTargets \n  $removeResults';
  }
*/

  print(bdRds.summary);

  print('Removed ${removeResults.length} elements removed:');
  for (var e in removeResults)
    print('  ${e.info}');

/*
  log.info('patientID: "${bRoot.patientId}"');
  BDElement e = bRoot.remove(kPatientID);
  log.info('removed: ${e.info}');
  if (bRoot[kPatientID] != null)
    log.error('kPatientID not removed: $e');
  log.info('patientID: "${bRoot[kPatientID]}"');
  log.info('patientID: "${bRoot.patientId}"');
*/

/*  log.debug1(bRoot.parseInfo.info);
  if (bRoot == null) return null;

  bRoot.remove(kPatientID);
  RootDataset tRoot = convertByteDSToTagDS(bRoot);
  log.info('tRoot: $tRoot');*/

}
