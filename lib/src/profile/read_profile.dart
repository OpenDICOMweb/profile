// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Original author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

import 'dart:io';

import 'package:path/path.dart' as path;

import 'package:profile/src/profile/profile.dart';

Profile readProfileFile(String inPath) {
  final ext = path.extension(inPath);
  if (ext == '.json') {
    final inFile = new File(inPath);
    final s = inFile.readAsStringSync();
    return Profile.parse(s);
  }
  return null;
}

void writeProfileFile(String outPath, Profile profile) {
  final ext = path.extension(outPath);
  if (ext == '.json') {
    new File(outPath)..writeAsStringSync(profile.json);
  }
}

String blank = 'C:/odw/sdk/deidentification/bin/results/1.blank.json';

void main() {
  final p = readProfileFile(blank);
  print(p.map);
}
