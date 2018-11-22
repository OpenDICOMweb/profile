// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Original author: Jim Philbin <jfphilbin@gmail.edu> - 
// See the AUTHORS file for other contributors.

import 'dart:io';

String data = 'C:/odw/sdk/profile/lib/data/6688 Table for Jim.csv';

void main() {
  final file =  File(data);

  final lines = file.readAsLinesSync();

  final sb = StringBuffer();
  for(var line in lines) {
    sb.writeln(lineToString(line));
  }
  print('$sb');
}

String lineToString(String line) {
  final sList = line.split('|');
  final caseNo = sList[0];
  final images = sList[1];
  final enrollment = sList[2];
  final study = sList[3];
  final normal = sList[4];

  return '["$caseNo", $images, "$enrollment", "$study", "$normal"],\n';

}