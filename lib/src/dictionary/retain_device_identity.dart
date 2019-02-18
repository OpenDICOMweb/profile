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

/// Retain Device Identity Option to the Basic De-Identification Profile.
class RetainDeviceIdentityOption {
  final String keyword;
  final int tag;
  final VR vr;
  final String action;

  const RetainDeviceIdentityOption(
      this.keyword, this.tag, this.vr, this.action);

  static RetainDeviceIdentityOption lookup(int tag) => map[tag];

  static const kStationName =
      RetainDeviceIdentityOption('StationName', 0x00081010, VR.kSH, 'K');
  static const kDeviceSerialNumber =
      RetainDeviceIdentityOption('DeviceSerialNumber', 0x00181000, VR.kLO, 'K');
  static const kDeviceUID =
      RetainDeviceIdentityOption('DeviceUID', 0x00181002, VR.kUI, 'K');
  static const kPlateID =
      RetainDeviceIdentityOption('PlateID', 0x00181004, VR.kLO, 'K');
  static const kGeneratorID =
      RetainDeviceIdentityOption('GeneratorID', 0x00181005, VR.kLO, 'K');
  static const kCassetteID =
      RetainDeviceIdentityOption('CassetteID', 0x00181007, VR.kLO, 'K');
  static const kGantryID =
      RetainDeviceIdentityOption('GantryID', 0x00181008, VR.kLO, 'K');
  static const kDetectorID =
      RetainDeviceIdentityOption('DetectorID', 0x0018700a, VR.kSH, 'K');
  static const kScheduledStudyLocation = RetainDeviceIdentityOption(
      'ScheduledStudyLocation', 0x00321020, VR.kLO, 'K');
  static const kScheduledStudyLocationAETitle = RetainDeviceIdentityOption(
      'ScheduledStudyLocationAETitle', 0x00321021, VR.kAE, 'K');
  static const kScheduledStationAETitle = RetainDeviceIdentityOption(
      'ScheduledStationAETitle', 0x00400001, VR.kAE, 'K');
  static const kScheduledStationName = RetainDeviceIdentityOption(
      'ScheduledStationName', 0x00400010, VR.kSH, 'K');
  static const kScheduledProcedureStepLocation = RetainDeviceIdentityOption(
      'ScheduledProcedureStepLocation', 0x00400011, VR.kSH, 'K');
  static const kPerformedStationAETitle = RetainDeviceIdentityOption(
      'PerformedStationAETitle', 0x00400241, VR.kAE, 'K');
  static const kPerformedStationName = RetainDeviceIdentityOption(
      'PerformedStationName', 0x00400242, VR.kSH, 'K');
  static const kScheduledStationNameCodeSequence = RetainDeviceIdentityOption(
      'ScheduledStationNameCodeSequence', 0x00404025, VR.kSQ, 'K');
  static const kScheduledStationGeographicLocationCodeSequence =
      RetainDeviceIdentityOption(
          'ScheduledStationGeographicLocationCodeSequence',
          0x00404027,
          VR.kSQ,
          'K');
  static const kPerformedStationNameCodeSequence = RetainDeviceIdentityOption(
      'PerformedStationNameCodeSequence', 0x00404028, VR.kSQ, 'K');
  static const kPerformedStationGeographicLocationCodeSequence =
      RetainDeviceIdentityOption(
          'PerformedStationGeographicLocationCodeSequence',
          0x00404030,
          VR.kSQ,
          'K');

  static const List<int> retain = [
    0x00081010,
    0x00181000,
    0x00181002,
    0x00181004,
    0x00181005,
    0x00181007,
    0x00181008,
    0x0018700a,
    0x00321020,
    0x00321021,
    0x00400001,
    0x00400010,
    0x00400011,
    0x00400241,
    0x00400242,
    0x00404025,
    0x00404027,
    0x00404028,
    0x00404030
  ];

  static const List<int> remove = [];

  static const Map<int, RetainDeviceIdentityOption> map = {
    0x00081010: kStationName,
    0x00181000: kDeviceSerialNumber,
    0x00181002: kDeviceUID,
    0x00181004: kPlateID,
    0x00181005: kGeneratorID,
    0x00181007: kCassetteID,
    0x00181008: kGantryID,
    0x0018700a: kDetectorID,
    0x00321020: kScheduledStudyLocation,
    0x00321021: kScheduledStudyLocationAETitle,
    0x00400001: kScheduledStationAETitle,
    0x00400010: kScheduledStationName,
    0x00400011: kScheduledProcedureStepLocation,
    0x00400241: kPerformedStationAETitle,
    0x00400242: kPerformedStationName,
    0x00404025: kScheduledStationNameCodeSequence,
    0x00404027: kScheduledStationGeographicLocationCodeSequence,
    0x00404028: kPerformedStationNameCodeSequence,
    0x00404030: kPerformedStationGeographicLocationCodeSequence
  };

  static const List<int> tags = [
    0x00081010,
    0x00181000,
    0x00181002,
    0x00181004,
    0x00181005,
    0x00181007,
    0x00181008,
    0x0018700a,
    0x00321020,
    0x00321021,
    0x00400001,
    0x00400010,
    0x00400011,
    0x00400241,
    0x00400242,
    0x00404025,
    0x00404027,
    0x00404028,
    0x00404030
  ];
}
