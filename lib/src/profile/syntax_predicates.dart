// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu>
// See the AUTHORS file for other contributors.

const String id = r'(\w+)';
const String atId = r'(@\w+)';
const String integer = r'([-+]?\d+)';
const String pOther = r'([\w\$]+)';
const String pFunction = r'(@\w+\(\))';
const String pValue = '($pFunction|$atId|$id|$integer|$pOther)';

// Parameter expressions
final RegExp parameterKeyRE =  RegExp(id);
final RegExp parameterValueRE =  RegExp(pValue);

bool isValidParameterKey(String key) {
  final m = parameterKeyRE.firstMatch(key);
  return ((m == null) || (m.end != key.length)) ? false : true;
}

bool isNotValidParameterKey(String key) => ! isValidParameterKey(key);

bool isValidParameterValue(String value) {
  final m = parameterValueRE.firstMatch(value);
  return ((m == null) || (m.end != value.length)) ? false : true;
}

bool isNotValidParameterValue(String key) => ! isValidParameterValue(key);


void main() {

  var m = parameterKeyRE.firstMatch('@FOO');
  if ((m == null) || (m.end != '@FOO'.length)) {
    print('Fail');
  } else {
    printMatch(m);
  }

  m = parameterValueRE.firstMatch('FOO');
  if (m == null) {
    print('Fail');
  } else {
    printMatch(m);
  }
}

void printMatch(Match m) {
  final count = m.groupCount;
  print('count=$count');
  for(var i=0; i < count; i++)
      print('  m[$i] = "${m[i]}"');
}