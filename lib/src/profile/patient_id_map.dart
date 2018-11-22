// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> - 
// See the AUTHORS file for other contributors.
//
import 'dart:convert' as cvt;

import 'package:profile/src//trial.dart';

//TODO: finish
//ISSUE: should the [PatientIdMap] be part of the Trial data structure.

class PatientIdMap {
  final Trial trial;
  final Map<int, int> _map;

  PatientIdMap(this.trial, this._map);

  int lookup(int ptId) => _map[ptId];

  static PatientIdMap load(String jsonTrial, String jsonPatientIdMap) {
    final Trial trial = cvt.json.decode(jsonTrial);
    final Map<int, int> map = cvt.json.decode(jsonPatientIdMap);
    return  PatientIdMap(trial, map);
  }
}