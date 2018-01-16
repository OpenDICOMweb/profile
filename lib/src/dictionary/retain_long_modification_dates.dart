// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

import 'package:core/core.dart';

// ignore_for_file: type_annotate_public_apis
// *** This is a generated class ***
// ----------------------------------------------------------



/// Retail Long Modification Dates Option (see PS2.15, Annex E)
class RetainLongModifDatesOption {
  final String keyword;
  final int tag;
  final VR vr;
  final String action;

  const RetainLongModifDatesOption(this.keyword, this.tag, this.vr, this.action);

  static RetainLongModifDatesOption lookup(int tag) => map[tag];

  static const kStudyDate =
    const RetainLongModifDatesOption('StudyDate', 0x00080020, VR.kDA, 'C');
  static const kSeriesDate =
    const RetainLongModifDatesOption('SeriesDate', 0x00080021, VR.kDA, 'C');
  static const kAcquisitionDate =
    const RetainLongModifDatesOption('AcquisitionDate', 0x00080022, VR.kDA, 'C');
  static const kContentDate =
    const RetainLongModifDatesOption('ContentDate', 0x00080023, VR.kDA, 'C');
  static const kOverlayDate =
    const RetainLongModifDatesOption('OverlayDate', 0x00080024, VR.kDA, 'C');
  static const kCurveDate =
    const RetainLongModifDatesOption('CurveDate', 0x00080025, VR.kDA, 'C');
  static const kAcquisitionDateTime =
    const RetainLongModifDatesOption('AcquisitionDateTime', 0x0008002a, VR.kDT, 'C');
  static const kStudyTime =
    const RetainLongModifDatesOption('StudyTime', 0x00080030, VR.kTM, 'C');
  static const kSeriesTime =
    const RetainLongModifDatesOption('SeriesTime', 0x00080031, VR.kTM, 'C');
  static const kAcquisitionTime =
    const RetainLongModifDatesOption('AcquisitionTime', 0x00080032, VR.kTM, 'C');
  static const kContentTime =
    const RetainLongModifDatesOption('ContentTime', 0x00080033, VR.kTM, 'C');
  static const kOverlayTime =
    const RetainLongModifDatesOption('OverlayTime', 0x00080034, VR.kTM, 'C');
  static const kCurveTime =
    const RetainLongModifDatesOption('CurveTime', 0x00080035, VR.kTM, 'C');
  static const kTimezoneOffsetFromUTC =
    const RetainLongModifDatesOption('TimezoneOffsetFromUTC', 0x00080201, VR.kSH, 'C');
  static const kLastMenstrualDate =
    const RetainLongModifDatesOption('LastMenstrualDate', 0x001021d0, VR.kDA, 'C');
  static const kAdmittingDate =
    const RetainLongModifDatesOption('AdmittingDate', 0x00380020, VR.kDA, 'C');
  static const kAdmittingTime =
    const RetainLongModifDatesOption('AdmittingTime', 0x00380021, VR.kTM, 'C');
  static const kScheduledProcedureStepStartDate =
    const RetainLongModifDatesOption('ScheduledProcedureStepStartDate', 0x00400002, VR.kDA, 'C');
  static const kScheduledProcedureStepStartTime =
    const RetainLongModifDatesOption('ScheduledProcedureStepStartTime', 0x00400003, VR.kTM, 'C');
  static const kScheduledProcedureStepEndDate =
    const RetainLongModifDatesOption('ScheduledProcedureStepEndDate', 0x00400004, VR.kDA, 'C');
  static const kScheduledProcedureStepEndTime =
    const RetainLongModifDatesOption('ScheduledProcedureStepEndTime', 0x00400005, VR.kTM, 'C');
  static const kPerformedProcedureStepStartDate =
    const RetainLongModifDatesOption('PerformedProcedureStepStartDate', 0x00400244, VR.kDA, 'C');
  static const kPerformedProcedureStepStartTime =
    const RetainLongModifDatesOption('PerformedProcedureStepStartTime', 0x00400245, VR.kTM, 'C');
  static const kPerformedProcedureStepEndDate =
    const RetainLongModifDatesOption('PerformedProcedureStepEndDate', 0x00400250, VR.kDA, 'C');
  static const kPerformedProcedureStepEndTime =
    const RetainLongModifDatesOption('PerformedProcedureStepEndTime', 0x00400251, VR.kTM, 'C');

static const List<int> retain = const [

  ];

static const List<int> remove = const [
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

static const Map<int, RetainLongModifDatesOption> map = const {
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

static const List<int> tags = const [
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
