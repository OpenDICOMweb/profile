// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

import 'package:core/core.dart';

// ignore_for_file: type_annotate_public_apis
// ignore_for_file: public_member_api_docs

// *** This is a generated class ***
// ----------------------------------------------------------

// DICOM attributes in De-Identification Profile (and Options)
class RetainPatientCharacteristicsOption {
  final String keyword;
  final int tag;
  final VR vr;
  final String action;

  const RetainPatientCharacteristicsOption(
      this.keyword, this.tag, this.vr, this.action);

  static RetainPatientCharacteristicsOption lookup(int tag) => map[tag];

  static const kPatientsSex = RetainPatientCharacteristicsOption(
      'PatientsSex', 0x00100040, VR.kCS, 'K');
  static const kPatientsAge = RetainPatientCharacteristicsOption(
      'PatientsAge', 0x00101010, VR.kAS, 'K');
  static const kPatientsSize = RetainPatientCharacteristicsOption(
      'PatientsSize', 0x00101020, VR.kDS, 'K');
  static const kPatientsWeight = RetainPatientCharacteristicsOption(
      'PatientsWeight', 0x00101030, VR.kDS, 'K');
  static const kAllergies =
      RetainPatientCharacteristicsOption('Allergies', 0x00102110, VR.kLO, 'C');
  static const kEthnicGroup = RetainPatientCharacteristicsOption(
      'EthnicGroup', 0x00102160, VR.kSH, 'K');
  static const kSmokingStatus = RetainPatientCharacteristicsOption(
      'SmokingStatus', 0x001021a0, VR.kCS, 'K');
  static const kPregnancyStatus = RetainPatientCharacteristicsOption(
      'PregnancyStatus', 0x001021c0, VR.kUS, 'K');
  static const kPatientSexNeutered = RetainPatientCharacteristicsOption(
      'PatientSexNeutered', 0x00102203, VR.kCS, 'K');
  static const kSpecialNeeds = RetainPatientCharacteristicsOption(
      'SpecialNeeds', 0x00380050, VR.kLO, 'C');
  static const kPatientState = RetainPatientCharacteristicsOption(
      'PatientState', 0x00380500, VR.kLO, 'C');
  static const kPreMedication = RetainPatientCharacteristicsOption(
      'Pre_Medication', 0x00400012, VR.kLO, 'C');

  static const List<int> retain = [
    0x00100040,
    0x00101010,
    0x00101020,
    0x00101030,
    0x00102160,
    0x001021a0,
    0x001021c0,
    0x00102203
  ];

  static const List<int> remove = [
    0x00102110,
    0x00380050,
    0x00380500,
    0x00400012
  ];

  static const Map<int, RetainPatientCharacteristicsOption> map = {
    0x00100040: kPatientsSex,
    0x00101010: kPatientsAge,
    0x00101020: kPatientsSize,
    0x00101030: kPatientsWeight,
    0x00102110: kAllergies,
    0x00102160: kEthnicGroup,
    0x001021a0: kSmokingStatus,
    0x001021c0: kPregnancyStatus,
    0x00102203: kPatientSexNeutered,
    0x00380050: kSpecialNeeds,
    0x00380500: kPatientState,
    0x00400012: kPreMedication
  };

  static const List<int> tags = [
    0x00100040,
    0x00101010,
    0x00101020,
    0x00101030,
    0x00102110,
    0x00102160,
    0x001021a0,
    0x001021c0,
    0x00102203,
    0x00380050,
    0x00380500,
    0x00400012
  ];
}
