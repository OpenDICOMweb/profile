// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

import 'dart:convert';

import 'package:core/dataset.dart';
import 'package:date_time/date_time.dart';
import 'package:system/system.dart';

class SubjectDB {
  final List<Subject> db;

  SubjectDB(List<Subject> subjects) : db = new List.from(subjects, growable: false);

  Subject operator [](int i) => db[i];

  int get length => db.length;

  String get json {
    var out = '[\n';
    List<String> sList = <String>[];
    for (int i = 0; i < length; i++) sList.add(db[i].json);
    out += sList.join(',\n');
    return out += '\n]\n';
  }
}

const List<int> defaultNormalizedDates = const <int> [
  kInstanceCreationDate, // No reformat
  kStudyDate,
  kSeriesDate,
  kAcquisitionDate,
  kContentDate,
  kOverlayDate,
  kCurveDate,
  kPatientBirthDate, // ***
  kPatientBirthDateInAlternativeCalendar, //??
  kPatientDeathDateInAlternativeCalendar, //??
  kLastMenstrualDate,
  kEthicsCommitteeApprovalEffectivenessStartDate, //??
  kEthicsCommitteeApprovalEffectivenessEndDate,   //??
  kSecondaryReviewDate, //??
  kExpiryDate, //??
  kDateOfGainCalibration, //??
  kProcedureCreationDate, //??
  kProcedureExpirationDate, //??
  kProcedureLastModifiedDate, //??
  kCalibrationDate, //??
  kDateOfSecondaryCapture, //??
  kDateOfLastCalibration, // No?
  kDateOfLastDetectorCalibration, // No?
  kModifiedImageDate, // yes?
  kStudyVerifiedDate, //??
  kStudyReadDate, //??
  kScheduledStudyStartDate, kScheduledStudyStopDate, //??
  kStudyArrivalDate, //??
  kStudyCompletionDate, //??
  kScheduledAdmissionDate, //??
  kScheduledDischargeDate, //??
  kAdmittingDate, //??
  kDischargeDate, //??
  kScheduledProcedureStepStartDate, kScheduledProcedureStepEndDate,
  kPerformedProcedureStepStartDate, kPerformedProcedureStepEndDate,
  kIssueDateOfImagingServiceRequest, // No?
  kFindingsGroupRecordingDateTrial, // yes?
  kDateOfDocumentOrVerbalTransactionTrial, // yes?
  kDate, // yes?
  kReferencedDateTime, // yes?
  kObservationDateTrial, // yes?
  kPresentationCreationDate, // yes?
  kCreationDate, //??
  kStructureSetDate, // ??
  kTreatmentControlPointDate, //??
  kFirstTreatmentDate, //??
  kMostRecentTreatmentDate, //??
  kSafePositionExitDate, //??
  kSafePositionReturnDate, //??
  kTreatmentDate, //??
  kRTPlanDate, //??
  kSourceStrengthReferenceDate, //??
  kReviewDate,
  kInterpretationRecordedDate,
  kInterpretationTranscriptionDate,
  kInterpretationApprovalDate, //??
];

const List<int> defaultNormalizedDateTimes = const <int> [
  kInstanceCoercionDateTime,
  kAcquisitionDateTime,
  kRadiopharmaceuticalStartDateTime, kRadiopharmaceuticalStopDateTime,
  kDateTimeOfLastCalibration, // No
  kFrameAcquisitionDateTime, //??
  kFrameReferenceDateTime, //??
  kStartAcquisitionDateTime, kEndAcquisitionDateTime, //??
  kDecayCorrectionDateTime, //??
  kExclusionStartDateTime, //??
  kInstructionPerformedDateTime, //??
  kContributionDateTime, //??
  kScheduledProcedureStepStartDateTime, // why no end date/time
  kScheduledProcedureStepModificationDateTime,
  kExpectedCompletionDateTime,
  kPerformedProcedureStepStartDateTime, kPerformedProcedureStepEndDateTime,
  kProcedureStepCancellationDateTime,
  kVerificationDateTime, //??
  kObservationDateTime, //??
  kParticipationDateTime, //??
  kDateTime, //??
  kReferencedDateTime, //??
  kApprovalStatusDateTime, //??
  kProductExpirationDateTime, //??
  kSubstanceAdministrationDateTime, //??
  kAssertionDateTime, //??
  kAssertionExpirationDateTime, // ??
  kEffectiveDateTime, //??
  kInformationIssueDateTime, //??
  kHangingProtocolCreationDateTime, // No
  kSOPAuthorizationDateTime, //??
  kDigitalSignatureDateTime, //??
  kAttributeModificationDateTime, //??
];

class Subject {
  final String name;
  final String id;
  final String accession;
  final Date studyDate;
  final int caseNumber;      // Should be caseID
  final String enrollmentDate;
  final String trialNumber;  // Should be trialID
  final String trialName;
  final String siteNumber; // Should be siteID
  final String siteName;
  final String timepointID;
  final String timepointDescription;
  final String submissionType;
  final String additionalTrialInput;
  final String anonymizationProfile;
  final String validationProfile;
  final String user;
  final Map<String, dynamic> parameters;

  Subject(
      this.name,
      this.id,
      this.accession,
      String studyDate,
      this.caseNumber,
      this.enrollmentDate,
      this.trialNumber,
      this.trialName,
      this.siteNumber,
      this.siteName,
      this.timepointID,
      this.timepointDescription,
      this.submissionType,
      this.additionalTrialInput,
      this.anonymizationProfile,
      this.validationProfile,
      this.user,
      this.parameters)
      : studyDate = Date.parse(studyDate);

  //  String operator [](String name)  => parameters[name];
  String get info => '''
          Patient Name: "$name"
            Patient ID: "$id"
      Accession Number: "$accession"
            Study Date: "$studyDate"
           Case Number: $caseNumber,
       Enrollment Date: "$enrollmentDate",
          Trial Number: "$trialNumber",
            Trial Name: "$trialName",
           Site Number: "$siteNumber",
             Site Name: "$siteName",
         Time Point ID: "$timepointID",
Time Point Description: "$timepointDescription",
       Submission Type: "$submissionType",
Additional Trial Input: "$additionalTrialInput",
 Anonymization Profile: "$anonymizationProfile",
    Validation Profile: "$validationProfile",
                  User: "$user"
            Parameters: $parameters
''';

  String get json => '''  {
  "Patient Name": "$name",
  "Patient ID": "$id",
  "Accession Number": "$accession",
  "Study Date": "$studyDate",
  "Case Number": $caseNumber,
  "Enrollment Date": "$enrollmentDate",
  "Trial Number": "$trialNumber",
  "Trial Name": "$trialName",
   "Site Number": "$siteNumber",
  "Site Name": "$siteName",
  "Time Point ID": "$timepointID",
  "Time Point Description": "$timepointDescription",
  "Submission Type": "$submissionType",
  "Additional Trial Input": "$additionalTrialInput",
  "Anonymization Profile": "$anonymizationProfile",
  "Validation Profile": "$validationProfile",
  "User": "$user"
  "Parameters": ${JSON.encode(parameters)}
  }''';

  bool standardModifications(Dataset rds) {
    /// Required Modifications
    rds.replace(kInstanceCoercionDateTime, [DcmDateTime.now.dcm]);
    rds.update(kPatientName, [name]);
    rds.update(kPatientID, [id]);
    normalize(rds, kPatientBirthDate);
    rds.update(kClinicalTrialSubjectID, [id]);
    rds.update(kAccessionNumber, [accession]);
    rds.update(kStudyDate, [studyDate]);
    rds.update(kClinicalTrialProtocolID, [trialNumber]);
    rds.update(kClinicalTrialProtocolName, [id]);
    rds.update(kClinicalTrialSiteID, [siteNumber]);
    rds.update(kClinicalTrialSiteName, [siteNumber]);
    rds.update(kClinicalTrialTimePointID, [timepointID]);
    rds.update(kClinicalTrialTimePointID, [timepointID]);
    rds.update(kClinicalTrialTimePointDescription, [timepointDescription]);

    return true;
  }
  //Urgent Jim:
  // - add definitions to constants

  //TODO: explain normalization int ReadMe.
  /// Returns [true] if the Element corresponding to code was _normalized_.
  bool normalize(Dataset rds, int code) {
    String oDate = rds.getStringByCode(code);
    if (oDate == null) return false;
    String nDate = Date.normalizeString(oDate, enrollmentDate);
    /// TODO: add replaceByCode to Dataset
    rds.replace(code, [nDate]);
    return true;
  }

  @override
  String toString() => 'name:"$name", id:"$id", date:"$studyDate", case: $caseNumber';
}
