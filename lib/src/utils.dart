// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Original author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.
//
import 'package:core/core.dart';

/// Returns a [String] representing the list of DICOM Tag Codes.
String codeListToString(List<int> list) {
  final sb = StringBuffer('Private Codes: [');
  for (final code in list) sb.write('${dcm(code)}, ');
  sb.write(']');
  return '$sb';
}

/// Returns _true_ if [ds] contains Private Elements.
bool checkForPrivateElements(Dataset ds) {
  for (final e in ds) {
    if (e.isPrivate) {
      print('** Private Found: $e');
      return true;
    }
    if (e is SQ) e.items.forEach(checkForPrivateElements);
  }
  return false;
}
