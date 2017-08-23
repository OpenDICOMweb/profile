// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

import 'dart:io';

import 'package:dcm_convert/data/test_files.dart';
import 'package:dcm_convert/dcm.dart';

import 'package:profile/profile.dart';
import 'package:deid/dictionary.dart';
import 'package:system/system.dart';

/// A Program that reads a [File], decodes it into a [RootByteDataset],
/// and then converts that into a [RootTagDataset].
void main() {
  log.level = Level.debug3;
  System.log.level = Level.debug0;

  // Edit this line
  var path = path0;

  File f = toFile(path, mustExist: true);
  log.debug2('Reading: $f');
  RootByteDataset bRoot = ByteReader.readFile(f, fast: true);
  log.debug('bRoot.isRoot: ${bRoot.isRoot}');

  print('basicProfileRemoveCodes.length: ${basicProfileRemoveCodes.length}');
  print('basicProfile.removeCodes.length: ${BasicProfile.removeCodes.length}');
  print('basicProfile.removeCodes.length: ${BasicProfile.codes.length}');
  List<ByteElement> removeTargets = <ByteElement>[];
  List<ByteElement> removeResults = <ByteElement>[];

  print(bRoot.summary);
  for (int code in basicProfileRemoveCodes) {
    List<ByteElement> results = bRoot.lookupRecursive(code);
    if (results != null && results.length != 0) removeTargets.addAll(results);
  }
  print('removeTargets: [${removeTargets.length}]$removeTargets');

  for (int code in basicProfileRemoveCodes) {
    List<ByteElement> results = bRoot.remove(code);
    if (results != null && results.length != 0) removeResults.addAll(results);
  }

  for (int code in basicProfileRemoveCodes) {
    var e = bRoot.lookup(code);
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

  print(bRoot.summary);

  print('Removed ${removeResults.length} elements removed:');
  for (Element e in removeResults)
    print('  ${e.info}');

/*
  log.info('patientID: "${bRoot.patientId}"');
  ByteElement e = bRoot.remove(kPatientID);
  log.info('removed: ${e.info}');
  if (bRoot[kPatientID] != null)
    log.error('kPatientID not removed: $e');
  log.info('patientID: "${bRoot[kPatientID]}"');
  log.info('patientID: "${bRoot.patientId}"');
*/

/*  log.debug1(bRoot.parseInfo.info);
  if (bRoot == null) return null;

  bRoot.remove(kPatientID);
  RootTagDataset tRoot = convertByteDSToTagDS(bRoot);
  log.info('tRoot: $tRoot');*/

}
