// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Original author: Jim Philbin <jfphilbin@gmail.edu> - 
// See the AUTHORS file for other contributors.

import 'dart:io';

String data = 'C:/odw/sdk/profile/lib/data/6688 Table for Jim.csv';

void main() {
  File file = new File(data);

  List<String> lines = file.readAsLinesSync();

  String out = "";
  for(String line in lines) {
    out += lineToString(line);
  }
  print(out);
}

String lineToString(String line) {
  List<String> sList = line.split('|');
  var caseNo = sList[0];
  var images = sList[1];
  var enrollment = sList[2];
  var study = sList[3];
  var normal = sList[4];

  return '["$caseNo", $images, "$enrollment", "$study", "$normal"],\n';

}