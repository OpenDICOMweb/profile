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
import 'package:system/server.dart';

import 'package:profile/src/profiles/basic.dart';

/// A Program that reads a [File], decodes it into a [RootByteDataset],
/// and then converts that into a [RootTagDataset].
void main() {
  Server.initialize(level: Level.debug2, throwOnError: true);


  // Edit this line
  var path = path0;

  File f = new File(path);
  log.debug2('Reading: $f');
  RootByteDataset rds = ByteReader.readFile(f, fast: true);
  log.debug('rds.isRoot: ${rds.isRoot}');
  Formatter z = new Formatter(maxDepth: -1);
  rds.format(z);

  print('basicProfileRemoveCodes.length: ${basicProfileRemoveCodes.length}');
  print('basicProfile.removeCodes.length: ${BasicProfile.removeCodes.length}');
  print('basicProfile.removeCodes.length: ${BasicProfile.codes.length}');
  List<ByteElement> removeTargets = <ByteElement>[];
  List<ByteElement> removeResults = <ByteElement>[];

  print(rds.summary);


  for (int code in basicProfileRemoveCodes) {
    List<ByteElement> results = rds.lookupRecursive(code);
    if (results != null && results.length != 0) removeTargets.addAll(results);
  }

  print('removeTargets: length(${removeTargets.length})');
  int i = 0;
  for(Element e in removeTargets) {
    print('  $i: $e');
    i++;
  }

  i = 0;
  for (Element e in removeTargets) {
    if (e.isSequence) {
      var sq = e as SequenceMixin;
      print('  $i: Sequence: total(${sq.total})');
    } else {
      print('  $i: Element: $e');}
    ByteElement results = rds.remove(e.code);
    if (results != null && results.length != 0) removeResults.add(results);
    i++;
  }

  print('results: length(${removeTargets.length})');
  for(Element e in removeTargets) {
    print('  $e');
  }

  for (int code in basicProfileRemoveCodes) {
    var e = rds.lookup(code);
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

  print(rds.summary);

  i = 0;
  for (Element e in removeResults) {
    if (e.isSequence) {
      var sq = e as SequenceMixin;
      i += sq.total;
      print('  $i ${e.info}');
      print('  Total: ${sq.total}');
    } else {
      print('  $i ${e.info}');
      i++;
    }

  }
  print('Removed $i elements removed:');



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
