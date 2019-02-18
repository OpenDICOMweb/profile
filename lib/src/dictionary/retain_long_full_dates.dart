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
class RetainLongFullDatesOption {
  final String keyword;
  final int tag;
  final VR vr;
  final String action;

  const RetainLongFullDatesOption(this.keyword, this.tag, this.vr, this.action);

  static RetainLongFullDatesOption lookup(int tag) => map[tag];

  static const kStudyDate =
      RetainLongFullDatesOption('StudyDate', 0x00080020, VR.kDA, 'K');
  static const kSeriesDate =
      RetainLongFullDatesOption('SeriesDate', 0x00080021, VR.kDA, 'K');
  static const kAcquisitionDate =
      RetainLongFullDatesOption('AcquisitionDate', 0x00080022, VR.kDA, 'K');
  static const kContentDate =
      RetainLongFullDatesOption('ContentDate', 0x00080023, VR.kDA, 'K');
  static const kOverlayDate =
      RetainLongFullDatesOption('OverlayDate', 0x00080024, VR.kDA, 'K');
  static const kCurveDate =
      RetainLongFullDatesOption('CurveDate', 0x00080025, VR.kDA, 'K');
  static const kAcquisitionDateTime =
      RetainLongFullDatesOption('AcquisitionDateTime', 0x0008002a, VR.kDT, 'K');
  static const kStudyTime =
      RetainLongFullDatesOption('StudyTime', 0x00080030, VR.kTM, 'K');
  static const kSeriesTime =
      RetainLongFullDatesOption('SeriesTime', 0x00080031, VR.kTM, 'K');
  static const kAcquisitionTime =
      RetainLongFullDatesOption('AcquisitionTime', 0x00080032, VR.kTM, 'K');
  static const kContentTime =
      RetainLongFullDatesOption('ContentTime', 0x00080033, VR.kTM, 'K');
  static const kOverlayTime =
      RetainLongFullDatesOption('OverlayTime', 0x00080034, VR.kTM, 'K');
  static const kCurveTime =
      RetainLongFullDatesOption('CurveTime', 0x00080035, VR.kTM, 'K');
  static const kTimezoneOffsetFromUTC = RetainLongFullDatesOption(
      'TimezoneOffsetFromUTC', 0x00080201, VR.kSH, 'K');
  static const kLastMenstrualDate =
      RetainLongFullDatesOption('LastMenstrualDate', 0x001021d0, VR.kDA, 'K');
  static const kAdmittingDate =
      RetainLongFullDatesOption('AdmittingDate', 0x00380020, VR.kDA, 'K');
  static const kAdmittingTime =
      RetainLongFullDatesOption('AdmittingTime', 0x00380021, VR.kTM, 'K');
  static const kScheduledProcedureStepStartDate = RetainLongFullDatesOption(
      'ScheduledProcedureStepStartDate', 0x00400002, VR.kDA, 'K');
  static const kScheduledProcedureStepStartTime = RetainLongFullDatesOption(
      'ScheduledProcedureStepStartTime', 0x00400003, VR.kTM, 'K');
  static const kScheduledProcedureStepEndDate = RetainLongFullDatesOption(
      'ScheduledProcedureStepEndDate', 0x00400004, VR.kDA, 'K');
  static const kScheduledProcedureStepEndTime = RetainLongFullDatesOption(
      'ScheduledProcedureStepEndTime', 0x00400005, VR.kTM, 'K');
  static const kPerformedProcedureStepStartDate = RetainLongFullDatesOption(
      'PerformedProcedureStepStartDate', 0x00400244, VR.kDA, 'K');
  static const kPerformedProcedureStepStartTime = RetainLongFullDatesOption(
      'PerformedProcedureStepStartTime', 0x00400245, VR.kTM, 'K');
  static const kPerformedProcedureStepEndDate = RetainLongFullDatesOption(
      'PerformedProcedureStepEndDate', 0x00400250, VR.kDA, 'K');
  static const kPerformedProcedureStepEndTime = RetainLongFullDatesOption(
      'PerformedProcedureStepEndTime', 0x00400251, VR.kTM, 'K');

  static const List<int> retain = [
    0x00080020,
    0x00080021,
    0x00080022,
    0x00080023,
    0x00080024,
    0x00080025,
    0x0008002a,
    0x00080030,
    0x00080031,
    0x00080032,
    0x00080033,
    0x00080034,
    0x00080035,
    0x00080201,
    0x001021d0,
    0x00380020,
    0x00380021,
    0x00400002,
    0x00400003,
    0x00400004,
    0x00400005,
    0x00400244,
    0x00400245,
    0x00400250,
    0x00400251
  ];

  static const List<int> remove = [];

  static const Map<int, RetainLongFullDatesOption> map = {
    0x00080020: kStudyDate,
    0x00080021: kSeriesDate,
    0x00080022: kAcquisitionDate,
    0x00080023: kContentDate,
    0x00080024: kOverlayDate,
    0x00080025: kCurveDate,
    0x0008002a: kAcquisitionDateTime,
    0x00080030: kStudyTime,
    0x00080031: kSeriesTime,
    0x00080032: kAcquisitionTime,
    0x00080033: kContentTime,
    0x00080034: kOverlayTime,
    0x00080035: kCurveTime,
    0x00080201: kTimezoneOffsetFromUTC,
    0x001021d0: kLastMenstrualDate,
    0x00380020: kAdmittingDate,
    0x00380021: kAdmittingTime,
    0x00400002: kScheduledProcedureStepStartDate,
    0x00400003: kScheduledProcedureStepStartTime,
    0x00400004: kScheduledProcedureStepEndDate,
    0x00400005: kScheduledProcedureStepEndTime,
    0x00400244: kPerformedProcedureStepStartDate,
    0x00400245: kPerformedProcedureStepStartTime,
    0x00400250: kPerformedProcedureStepEndDate,
    0x00400251: kPerformedProcedureStepEndTime
  };

  static const List<int> tags = [
    0x00080020,
    0x00080021,
    0x00080022,
    0x00080023,
    0x00080024,
    0x00080025,
    0x0008002a,
    0x00080030,
    0x00080031,
    0x00080032,
    0x00080033,
    0x00080034,
    0x00080035,
    0x00080201,
    0x001021d0,
    0x00380020,
    0x00380021,
    0x00400002,
    0x00400003,
    0x00400004,
    0x00400005,
    0x00400244,
    0x00400245,
    0x00400250,
    0x00400251
  ];
}
