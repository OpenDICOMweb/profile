// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

import 'dart:io';

import 'package:converter/converter.dart';
import 'package:core/server.dart';
import 'package:test_tools/tools.dart';

/// A Program that reads a [File], decodes it into a [ByteRootDataset],
/// and then converts that into a [TagRootDataset].
void main() {
  Server.initialize(level: Level.info, throwOnError: true);

  // Edit this line
  final path = path0;

  final byteRds = ByteReader.readPath(path);
  log
    ..debug('bRoot.isRoot: ${byteRds.isRoot}')
    ..debug(byteRds.summary)
    ..debug(
        'basicProfile.removeCodes.length: ${BasicProfile.removeCodes.length}')
    ..debug('basicProfile.Codes.length: ${BasicProfile.codes.length}');
  final removeTargets = <Element>[];
  final removeResults = <Element>[];

  // Delete Elements that should be removed
  for (var code in BasicProfile.removeCodes) {
    final results = byteRds.lookupAll(code);
    if (results != null && results.isNotEmpty) removeTargets.addAll(results);
  }
  // Check that all appropriate Elements are removed.
  for (var code in BasicProfile.removeCodes) {
    final results = byteRds.deleteAll(code);
    if (results != null && results.isNotEmpty) {
      log.debug('Error results: $results');
      removeResults.addAll(results);
    }
  }
  assert(removeTargets.length == removeResults.length);
  log
    ..info(byteRds.summary)
    ..info('removed(${removeResults.length}')
    ..info('removeTargets: length(${removeTargets.length})');
  var i = 0;

  for (var e in removeTargets) {
    log.debug('  $i: $e');
    i++;
  }

  i = 0;
  for (var e in removeTargets) {
    if (e is SQ) {
      log.debug('  $i: Sequence: total(${e.total})');
    } else {
      log.debug('  $i: Element: $e');
    }
    final result = byteRds.delete(e.code);
    if (result != null && result.isNotEmpty) removeResults.add(result);
    i++;
  }

  log.debug('results: length(${removeTargets.length})');
  for (var e in removeTargets) log.debug('  $e');

  for (var code in BasicProfile.removeCodes) {
    final e = byteRds.lookup(code);
    if (e != null) throw 'Element still present';
  }

// Urgent: figure out how to determine correctness
  if (removeTargets.length == removeResults.length) {
    for (var i = 0; i < removeTargets.length; i++)
      if (removeTargets[i] != removeResults[i]) throw 'Unequal results';
  } else {
    throw 'Different Lengths: \n  $removeTargets \n  $removeResults';
  }

  log.debug(byteRds.summary);

  i = 0;
  for (var e in removeResults) {
    if (e is SQ) {
      i += e.total;
      log.debug('  $i ${e.info}\n  Total: ${e.total}');
    } else {
      log.debug('  $i ${e.info}');
      i++;
    }
  }
  log.debug('Removed $i elements removed:');

  final issues = Issues();
  final tagRds = TagRootDataset.convert(byteRds, issues);
  log.info(tagRds.summary);
  if (issues.isNotEmpty) log.error('Issues: $issues');
  if (byteRds.total != tagRds.total)
    log.error('Byte length(${byteRds.total} != Tag length(${tagRds.total}');
  if (byteRds != tagRds) log.error('$tagRds != $byteRds');

/*
  log.info('patientID: "${bRoot.patientId}"');
  Element e = bRoot.remove(kPatientID);
  log.info('removed: ${e.info}');
  if (bRoot[kPatientID] != null)
    log.error('kPatientID not removed: $e');
  log.info('patientID: "${bRoot[kPatientID]}"');
  log.info('patientID: "${bRoot.patientId}"');
*/

/*  log.debug1(bRoot.parseInfo.info);
  if (bRoot == null) return null;

  bRoot.remove(kPatientID);
  TagRootDataset tRoot = TagDataset.convert(bRoot);
  log.info('tRoot: $tRoot');*/
}
