// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

// *** This is a generated class ***
// ----------------------------------------------------------

import 'package:core/core.dart';

import 'action.dart';
import 'basic_profile.dart';

// DICOM attributes in De-Identification Profile (and Options)
class CleanDescriptorsOption extends BasicProfile {
  const CleanDescriptorsOption(Tag tag, String name, 
      [Function action = Action.clean])
      : super(tag, name, action);

  static CleanDescriptorsOption lookup(int tag) => map[tag];

  static const CleanDescriptorsOption kStudyDescription =
      const CleanDescriptorsOption(PTag.kStudyDescription, 'C', Action.clean);
  static const CleanDescriptorsOption kSeriesDescription =
      const CleanDescriptorsOption(PTag.kSeriesDescription, 'C', Action.clean);
  static const CleanDescriptorsOption kAdmittingDiagnosesDescription =
      const CleanDescriptorsOption(PTag.kAdmittingDiagnosesDescription, 'C', Action.clean);
  static const CleanDescriptorsOption kAdmittingDiagnosesCodeSequence =
      const CleanDescriptorsOption(PTag.kAdmittingDiagnosesCodeSequence, 'C', Action.clean);
  static const CleanDescriptorsOption kDerivationDescription =
      const CleanDescriptorsOption(PTag.kDerivationDescription, 'C', Action.clean);
  static const CleanDescriptorsOption kIdentifyingComments =
      const CleanDescriptorsOption(PTag.kIdentifyingComments, 'C', Action.clean);
  static const CleanDescriptorsOption kMedicalAlerts =
      const CleanDescriptorsOption(PTag.kMedicalAlerts, 'C', Action.clean);
  static const CleanDescriptorsOption kAllergies =
      const CleanDescriptorsOption(PTag.kAllergies, 'C', Action.clean);
  static const CleanDescriptorsOption kOccupation =
      const CleanDescriptorsOption(PTag.kOccupation, 'C', Action.clean);
  static const CleanDescriptorsOption kAdditionalPatientsHistory =
      const CleanDescriptorsOption(PTag.kAdditionalPatientHistory, 'C', Action.clean);
  static const CleanDescriptorsOption kPatientComments =
      const CleanDescriptorsOption(PTag.kPatientComments, 'C', Action.clean);
  static const CleanDescriptorsOption kContrastBolusAgent =
      const CleanDescriptorsOption(PTag.kContrastBolusAgent, 'C', Action.clean);
  static const CleanDescriptorsOption kProtocolName =
      const CleanDescriptorsOption(PTag.kProtocolName, 'C', Action.clean);
  static const CleanDescriptorsOption kAcquisitionDeviceProcessingDescription =
      const CleanDescriptorsOption(
          PTag.kAcquisitionDeviceProcessingDescription, 'C', Action.clean);
  static const CleanDescriptorsOption kAcquisitionComments =
      const CleanDescriptorsOption(PTag.kAcquisitionComments, 'C', Action.clean);
  static const CleanDescriptorsOption kAcquisitionProtocolDescription =
      const CleanDescriptorsOption(PTag.kAcquisitionProtocolDescription, 'C', Action.clean);
  static const CleanDescriptorsOption kContributionDescription =
      const CleanDescriptorsOption(PTag.kContributionDescription, 'C', Action.clean);
  static const CleanDescriptorsOption kImageComments =
      const CleanDescriptorsOption(PTag.kImageComments, 'C', Action.clean);
  static const CleanDescriptorsOption kFrameComments =
      const CleanDescriptorsOption(PTag.kFrameComments, 'C', Action.clean);
  static const CleanDescriptorsOption kReasonforStudy =
      const CleanDescriptorsOption(PTag.kReasonForStudy, 'C', Action.clean);
  static const CleanDescriptorsOption kRequestedProcedureDescription =
      const CleanDescriptorsOption(PTag.kRequestedProcedureDescription, 'C', Action.clean);
  static const CleanDescriptorsOption kRequestedContrastAgent =
      const CleanDescriptorsOption(PTag.kRequestedContrastAgent, 'C', Action.clean);
  static const CleanDescriptorsOption kStudyComments =
      const CleanDescriptorsOption(PTag.kStudyComments, 'C', Action.clean);
  static const CleanDescriptorsOption kDischargeDiagnosisDescription =
      const CleanDescriptorsOption(PTag.kDischargeDiagnosisDescription, 'C', Action.clean);
  static const CleanDescriptorsOption kServiceEpisodeDescription =
      const CleanDescriptorsOption(PTag.kServiceEpisodeDescription, 'C', Action.clean);
  static const CleanDescriptorsOption kPatientState =
      const CleanDescriptorsOption(PTag.kPatientState, 'C', Action.clean);
  static const CleanDescriptorsOption kVisitComments =
      const CleanDescriptorsOption(PTag.kVisitComments, 'C', Action.clean);
  static const CleanDescriptorsOption kScheduledProcedureStepDescription =
      const CleanDescriptorsOption(
          PTag.kScheduledProcedureStepDescription, 'C', Action.clean);
  static const CleanDescriptorsOption kPerformedProcedureStepDescription =
      const CleanDescriptorsOption(
          PTag.kPerformedProcedureStepDescription, 'C', Action.clean);
  static const CleanDescriptorsOption kRequestAttributesSequence =
      const CleanDescriptorsOption(PTag.kRequestAttributesSequence, 'C', Action.clean);
  static const CleanDescriptorsOption kCommentsonthePerformedProcedureStep =
      const CleanDescriptorsOption(
          PTag.kCommentsOnThePerformedProcedureStep, 'C', Action.clean);
  static const CleanDescriptorsOption kRequestedProcedureComments =
      const CleanDescriptorsOption(PTag.kRequestedProcedureComments, 'C', Action.clean);
  static const CleanDescriptorsOption kReasonfortheImagingServiceRequest =
      const CleanDescriptorsOption(
          PTag.kReasonForTheImagingServiceRequest, 'C', Action.clean);
  static const CleanDescriptorsOption kImagingServiceRequestComments =
      const CleanDescriptorsOption(PTag.kImagingServiceRequestComments, 'C', Action.clean);
  static const CleanDescriptorsOption kInterpretationText =
      const CleanDescriptorsOption(PTag.kInterpretationText, 'C', Action.clean);
  static const CleanDescriptorsOption kInterpretationDiagnosisDescription =
      const CleanDescriptorsOption(
          PTag.kInterpretationDiagnosisDescription, 'C', Action.clean);
  static const CleanDescriptorsOption kImpressions =
      const CleanDescriptorsOption(PTag.kImpressions, 'C', Action.clean);
  static const CleanDescriptorsOption kResultsComments =
      const CleanDescriptorsOption(PTag.kResultsComments, 'C', Action.clean);

  //TODO: this needs to be merged with BasicProfile.remove
  static const List<int> retain = const [];

  //TODO: this needs to be merged with BasicProfile.remove
  static const List<int> remove = const [
    0x00081030,
    0x0008103e,
    0x00081080,
    0x00081084,
    0x00082111,
    0x00084000,
    0x00102000,
    0x00102110,
    0x00102180,
    0x001021b0,
    0x00104000,
    0x00180010,
    0x00181030,
    0x00181400,
    0x00184000,
    0x00189424,
    0x0018a003,
    0x00204000,
    0x00209158,
    0x00321030,
    0x00321060,
    0x00321070,
    0x00324000,
    0x00380040,
    0x00380062,
    0x00380500,
    0x00384000,
    0x00400007,
    0x00400254,
    0x00400275,
    0x00400280,
    0x00401400,
    0x00402001,
    0x00402400,
    0x4008010b,
    0x40080115,
    0x40080300,
    0x40084000
  ];

  static const Map<int, CleanDescriptorsOption> map = const {
    0x00081030: kStudyDescription,
    0x0008103e: kSeriesDescription,
    0x00081080: kAdmittingDiagnosesDescription,
    0x00081084: kAdmittingDiagnosesCodeSequence,
    0x00082111: kDerivationDescription,
    0x00084000: kIdentifyingComments,
    0x00102000: kMedicalAlerts,
    0x00102110: kAllergies,
    0x00102180: kOccupation,
    0x001021b0: kAdditionalPatientsHistory,
    0x00104000: kPatientComments,
    0x00180010: kContrastBolusAgent,
    0x00181030: kProtocolName,
    0x00181400: kAcquisitionDeviceProcessingDescription,
    0x00184000: kAcquisitionComments,
    0x00189424: kAcquisitionProtocolDescription,
    0x0018a003: kContributionDescription,
    0x00204000: kImageComments,
    0x00209158: kFrameComments,
    0x00321030: kReasonforStudy,
    0x00321060: kRequestedProcedureDescription,
    0x00321070: kRequestedContrastAgent,
    0x00324000: kStudyComments,
    0x00380040: kDischargeDiagnosisDescription,
    0x00380062: kServiceEpisodeDescription,
    0x00380500: kPatientState,
    0x00384000: kVisitComments,
    0x00400007: kScheduledProcedureStepDescription,
    0x00400254: kPerformedProcedureStepDescription,
    0x00400275: kRequestAttributesSequence,
    0x00400280: kCommentsonthePerformedProcedureStep,
    0x00401400: kRequestedProcedureComments,
    0x00402001: kReasonfortheImagingServiceRequest,
    0x00402400: kImagingServiceRequestComments,
    0x4008010b: kInterpretationText,
    0x40080115: kInterpretationDiagnosisDescription,
    0x40080300: kImpressions,
    0x40084000: kResultsComments
  };

  static const List<int> tags = const [
    0x00081030,
    0x0008103e,
    0x00081080,
    0x00081084,
    0x00082111,
    0x00084000,
    0x00102000,
    0x00102110,
    0x00102180,
    0x001021b0,
    0x00104000,
    0x00180010,
    0x00181030,
    0x00181400,
    0x00184000,
    0x00189424,
    0x0018a003,
    0x00204000,
    0x00209158,
    0x00321030,
    0x00321060,
    0x00321070,
    0x00324000,
    0x00380040,
    0x00380062,
    0x00380500,
    0x00384000,
    0x00400007,
    0x00400254,
    0x00400275,
    0x00400280,
    0x00401400,
    0x00402001,
    0x00402400,
    0x4008010b,
    0x40080115,
    0x40080300,
    0x40084000
  ];
}
