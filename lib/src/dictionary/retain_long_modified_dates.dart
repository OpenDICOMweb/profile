// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

import 'package:core/core.dart';

// ignore_for_file: type_annotate_public_apis

// *** This is a generated class ***
// ----------------------------------------------------------



/// Retain Long Modified Dates Option to the Basic De-Identification Profile.
class RetainLongModifiedDatesOption {
  final Tag tag;
  final String action;

  const RetainLongModifiedDatesOption(this.tag, this.action);

  static RetainLongModifiedDatesOption lookup(int tag) => map[tag];

  static const RetainLongModifiedDatesOption kStudyDate =
    const RetainLongModifiedDatesOption(PTag.kStudyDate,  'C');
  static const RetainLongModifiedDatesOption kSeriesDate =
    const RetainLongModifiedDatesOption(PTag.kSeriesDate,  'C');
  static const RetainLongModifiedDatesOption kAcquisitionDate =
    const RetainLongModifiedDatesOption(PTag.kAcquisitionDate,  'C');
  static const RetainLongModifiedDatesOption kContentDate =
    const RetainLongModifiedDatesOption(PTag.kContentDate,  'C');
  static const RetainLongModifiedDatesOption kOverlayDate =
    const RetainLongModifiedDatesOption(PTag.kOverlayDate,  'C');
  static const RetainLongModifiedDatesOption kCurveDate =
    const RetainLongModifiedDatesOption(PTag.kCurveDate,  'C');
  static const RetainLongModifiedDatesOption kAcquisitionDateTime =
    const RetainLongModifiedDatesOption(PTag.kAcquisitionDateTime,  'C');
  static const RetainLongModifiedDatesOption kStudyTime =
    const RetainLongModifiedDatesOption(PTag.kStudyTime,  'C');
  static const RetainLongModifiedDatesOption kSeriesTime =
    const RetainLongModifiedDatesOption(PTag.kSeriesTime,  'C');
  static const RetainLongModifiedDatesOption kAcquisitionTime =
    const RetainLongModifiedDatesOption(PTag.kAcquisitionTime,  'C');
  static const RetainLongModifiedDatesOption kContentTime =
    const RetainLongModifiedDatesOption(PTag.kContentTime,  'C');
  static const RetainLongModifiedDatesOption kOverlayTime =
    const RetainLongModifiedDatesOption(PTag.kOverlayTime,  'C');
  static const RetainLongModifiedDatesOption kCurveTime =
    const RetainLongModifiedDatesOption(PTag.kCurveTime,  'C');
  static const RetainLongModifiedDatesOption kTimezoneOffsetFromUTC =
    const RetainLongModifiedDatesOption(PTag.kTimezoneOffsetFromUTC,  'C');
  static const RetainLongModifiedDatesOption kLastMenstrualDate =
    const RetainLongModifiedDatesOption(PTag.kLastMenstrualDate,  'C');
  static const RetainLongModifiedDatesOption kAdmittingDate =
    const RetainLongModifiedDatesOption(PTag.kAdmittingDate,  'C');
  static const RetainLongModifiedDatesOption kAdmittingTime =
    const RetainLongModifiedDatesOption(PTag.kAdmittingTime,  'C');
  static const RetainLongModifiedDatesOption kScheduledProcedureStepStartDate =
    const RetainLongModifiedDatesOption(PTag.kScheduledProcedureStepStartDate,  'C');
  static const RetainLongModifiedDatesOption kScheduledProcedureStepStartTime =
    const RetainLongModifiedDatesOption(PTag.kScheduledProcedureStepStartTime,  'C');
  static const RetainLongModifiedDatesOption kScheduledProcedureStepEndDate =
    const RetainLongModifiedDatesOption(PTag.kScheduledProcedureStepEndDate,  'C');
  static const RetainLongModifiedDatesOption kScheduledProcedureStepEndTime =
    const RetainLongModifiedDatesOption(PTag.kScheduledProcedureStepEndTime,  'C');
  static const RetainLongModifiedDatesOption kPerformedProcedureStepStartDate =
    const RetainLongModifiedDatesOption(PTag.kPerformedProcedureStepStartDate,  'C');
  static const RetainLongModifiedDatesOption kPerformedProcedureStepStartTime =
    const RetainLongModifiedDatesOption(PTag.kPerformedProcedureStepStartTime,  'C');
  static const RetainLongModifiedDatesOption kPerformedProcedureStepEndDate =
    const RetainLongModifiedDatesOption(PTag.kPerformedProcedureStepEndDate,  'C');
  static const RetainLongModifiedDatesOption kPerformedProcedureStepEndTime =
    const RetainLongModifiedDatesOption(PTag.kPerformedProcedureStepEndTime,  'C');

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

static const Map<int, RetainLongModifiedDatesOption> map = const {
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
