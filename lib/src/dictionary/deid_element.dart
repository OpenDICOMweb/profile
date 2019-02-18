// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

import 'package:core/core.dart';

// ignore_for_file: type_annotate_public_apis
// ignore_for_file: public_member_api_docs

class DeIdElement {
  final int tag;
  final String keyword;
  final VR vr;
  final VM vm;
  final bool isSingleton;

  const DeIdElement(this.tag, this.keyword, this.vr, this.vm,
      {this.isSingleton = true});

  static DeIdElement lookup(int tag) => map[tag];

  static const kAffectedSOPInstanceUID =
      DeIdElement(0x00001000, 'AffectedSOPInstanceUID', VR.kUI, VM.k1);
  static const kRequestedSOPInstanceUID =
      DeIdElement(0x00001001, 'RequestedSOPInstanceUID', VR.kUI, VM.k1);
  static const kMediaStorageSOPInstanceUID =
      DeIdElement(0x00020003, 'MediaStorageSOPInstanceUID', VR.kUI, VM.k1);
  static const kReferencedSOPClassUIDInFile =
      DeIdElement(0x00041510, 'ReferencedSOPClassUIDInFile', VR.kUI, VM.k1);
  static const kInstanceCreatorUID =
      DeIdElement(0x00080014, 'InstanceCreatorUID', VR.kUI, VM.k1);
  static const kInstanceCoercionDateTime =
      DeIdElement(0x00080015, 'InstanceCoercionDateTime', VR.kDT, VM.k1);
  static const kSOPInstanceUID =
      DeIdElement(0x00080018, 'SOPInstanceUID', VR.kUI, VM.k1);
  static const kStudyDate = DeIdElement(0x00080020, 'StudyDate', VR.kDA, VM.k1);
  static const kSeriesDate =
      DeIdElement(0x00080021, 'SeriesDate', VR.kDA, VM.k1);
  static const kAcquisitionDate =
      DeIdElement(0x00080022, 'AcquisitionDate', VR.kDA, VM.k1);
  static const kContentDate =
      DeIdElement(0x00080023, 'ContentDate', VR.kDA, VM.k1);
  static const kOverlayDate =
      DeIdElement(0x00080024, 'OverlayDate', VR.kDA, VM.k1);
  static const kCurveDate = DeIdElement(0x00080025, 'CurveDate', VR.kDA, VM.k1);
  static const kAcquisitionDateTime =
      DeIdElement(0x0008002a, 'AcquisitionDateTime', VR.kDT, VM.k1);
  static const kStudyTime = DeIdElement(0x00080030, 'StudyTime', VR.kTM, VM.k1);
  static const kSeriesTime =
      DeIdElement(0x00080031, 'SeriesTime', VR.kTM, VM.k1);
  static const kAcquisitionTime =
      DeIdElement(0x00080032, 'AcquisitionTime', VR.kTM, VM.k1);
  static const kContentTime =
      DeIdElement(0x00080033, 'ContentTime', VR.kTM, VM.k1);
  static const kOverlayTime =
      DeIdElement(0x00080034, 'OverlayTime', VR.kTM, VM.k1);
  static const kCurveTime = DeIdElement(0x00080035, 'CurveTime', VR.kTM, VM.k1);
  static const kAccessionNumber =
      DeIdElement(0x00080050, 'AccessionNumber', VR.kSH, VM.k1);
  static const kFailedSOPInstanceUIDList = DeIdElement(
      0x00080058, 'FailedSOPInstanceUIDList', VR.kUI, VM.k1_n,
      isSingleton: false);
  static const kInstitutionName =
      DeIdElement(0x00080080, 'InstitutionName', VR.kLO, VM.k1);
  static const kInstitutionAddress =
      DeIdElement(0x00080081, 'InstitutionAddress', VR.kST, VM.k1);
  static const kInstitutionCodeSequence =
      DeIdElement(0x00080082, 'InstitutionCodeSequence', VR.kSQ, VM.k1);
  static const kReferringPhysicianName =
      DeIdElement(0x00080090, 'ReferringPhysicianName', VR.kPN, VM.k1);
  static const kReferringPhysicianAddress =
      DeIdElement(0x00080092, 'ReferringPhysicianAddress', VR.kST, VM.k1);
  static const kReferringPhysicianTelephoneNumbers = DeIdElement(
      0x00080094, 'ReferringPhysicianTelephoneNumbers', VR.kSH, VM.k1_n,
      isSingleton: false);
  static const kReferringPhysicianIdentificationSequence = DeIdElement(
      0x00080096, 'ReferringPhysicianIdentificationSequence', VR.kSQ, VM.k1);
  static const kContextGroupExtensionCreatorUID =
      DeIdElement(0x0008010d, 'ContextGroupExtensionCreatorUID', VR.kUI, VM.k1);
  static const kTimezoneOffsetFromUTC =
      DeIdElement(0x00080201, 'TimezoneOffsetFromUTC', VR.kSH, VM.k1);
  static const kStationName =
      DeIdElement(0x00081010, 'StationName', VR.kSH, VM.k1);
  static const kStudyDescription =
      DeIdElement(0x00081030, 'StudyDescription', VR.kLO, VM.k1);
  static const kSeriesDescription =
      DeIdElement(0x0008103e, 'SeriesDescription', VR.kLO, VM.k1);
  static const kInstitutionalDepartmentName =
      DeIdElement(0x00081040, 'InstitutionalDepartmentName', VR.kLO, VM.k1);
  static const kPhysiciansOfRecord = DeIdElement(
      0x00081048, 'PhysiciansOfRecord', VR.kPN, VM.k1_n,
      isSingleton: false);
  static const kPhysiciansOfRecordIdentificationSequence = DeIdElement(
      0x00081049, 'PhysiciansOfRecordIdentificationSequence', VR.kSQ, VM.k1);
  static const kPerformingPhysicianName = DeIdElement(
      0x00081050, 'PerformingPhysicianName', VR.kPN, VM.k1_n,
      isSingleton: false);
  static const kPerformingPhysicianIdentificationSequence = DeIdElement(
      0x00081052, 'PerformingPhysicianIdentificationSequence', VR.kSQ, VM.k1);
  static const kNameOfPhysiciansReadingStudy = DeIdElement(
      0x00081060, 'NameOfPhysiciansReadingStudy', VR.kPN, VM.k1_n,
      isSingleton: false);
  static const kPhysiciansReadingStudyIdentificationSequence = DeIdElement(
      0x00081062,
      'PhysiciansReadingStudyIdentificationSequence',
      VR.kSQ,
      VM.k1);
  static const kOperatorsName = DeIdElement(
      0x00081070, 'OperatorsName', VR.kPN, VM.k1_n,
      isSingleton: false);
  static const kOperatorIdentificationSequence =
      DeIdElement(0x00081072, 'OperatorIdentificationSequence', VR.kSQ, VM.k1);
  static const kAdmittingDiagnosesDescription = DeIdElement(
      0x00081080, 'AdmittingDiagnosesDescription', VR.kLO, VM.k1_n,
      isSingleton: false);
  static const kAdmittingDiagnosesCodeSequence =
      DeIdElement(0x00081084, 'AdmittingDiagnosesCodeSequence', VR.kSQ, VM.k1);
  static const kReferencedStudySequence =
      DeIdElement(0x00081110, 'ReferencedStudySequence', VR.kSQ, VM.k1);
  static const kReferencedPerformedProcedureStepSequence = DeIdElement(
      0x00081111, 'ReferencedPerformedProcedureStepSequence', VR.kSQ, VM.k1);
  static const kReferencedPatientSequence =
      DeIdElement(0x00081120, 'ReferencedPatientSequence', VR.kSQ, VM.k1);
  static const kReferencedImageSequence =
      DeIdElement(0x00081140, 'ReferencedImageSequence', VR.kSQ, VM.k1);
  static const kReferencedSOPInstanceUID =
      DeIdElement(0x00081155, 'ReferencedSOPInstanceUID', VR.kUI, VM.k1);
  static const kTransactionUID =
      DeIdElement(0x00081195, 'TransactionUID', VR.kUI, VM.k1);
  static const kDerivationDescription =
      DeIdElement(0x00082111, 'DerivationDescription', VR.kST, VM.k1);
  static const kSourceImageSequence =
      DeIdElement(0x00082112, 'SourceImageSequence', VR.kSQ, VM.k1);
  static const kIrradiationEventUID = DeIdElement(
      0x00083010, 'IrradiationEventUID', VR.kUI, VM.k1_n,
      isSingleton: false);
  static const kIdentifyingComments =
      DeIdElement(0x00084000, 'IdentifyingComments', VR.kLT, VM.k1);
  static const kCreatorVersionUID =
      DeIdElement(0x00089123, 'CreatorVersionUID', VR.kUI, VM.k1);
  static const kPatientName =
      DeIdElement(0x00100010, 'PatientName', VR.kPN, VM.k1);
  static const kPatientID = DeIdElement(0x00100020, 'PatientID', VR.kLO, VM.k1);
  static const kIssuerOfPatientID =
      DeIdElement(0x00100021, 'IssuerOfPatientID', VR.kLO, VM.k1);
  static const kPatientBirthDate =
      DeIdElement(0x00100030, 'PatientBirthDate', VR.kDA, VM.k1);
  static const kPatientBirthTime =
      DeIdElement(0x00100032, 'PatientBirthTime', VR.kTM, VM.k1);
  static const kPatientSex =
      DeIdElement(0x00100040, 'PatientSex', VR.kCS, VM.k1);
  static const kPatientInsurancePlanCodeSequence = DeIdElement(
      0x00100050, 'PatientInsurancePlanCodeSequence', VR.kSQ, VM.k1);
  static const kPatientPrimaryLanguageCodeSequence = DeIdElement(
      0x00100101, 'PatientPrimaryLanguageCodeSequence', VR.kSQ, VM.k1);
  static const kPatientPrimaryLanguageModifierCodeSequence = DeIdElement(
      0x00100102, 'PatientPrimaryLanguageModifierCodeSequence', VR.kSQ, VM.k1);
  static const kOtherPatientIDs = DeIdElement(
      0x00101000, 'OtherPatientIDs', VR.kLO, VM.k1_n,
      isSingleton: false);
  static const kOtherPatientNames = DeIdElement(
      0x00101001, 'OtherPatientNames', VR.kPN, VM.k1_n,
      isSingleton: false);
  static const kOtherPatientIDsSequence =
      DeIdElement(0x00101002, 'OtherPatientIDsSequence', VR.kSQ, VM.k1);
  static const kPatientBirthName =
      DeIdElement(0x00101005, 'PatientBirthName', VR.kPN, VM.k1);
  static const kPatientAge =
      DeIdElement(0x00101010, 'PatientAge', VR.kAS, VM.k1);
  static const kPatientSize =
      DeIdElement(0x00101020, 'PatientSize', VR.kDS, VM.k1);
  static const kPatientWeight =
      DeIdElement(0x00101030, 'PatientWeight', VR.kDS, VM.k1);
  static const kPatientAddress =
      DeIdElement(0x00101040, 'PatientAddress', VR.kLO, VM.k1);
  static const kInsurancePlanIdentification = DeIdElement(
      0x00101050, 'InsurancePlanIdentification', VR.kLO, VM.k1_n,
      isSingleton: false);
  static const kPatientMotherBirthName =
      DeIdElement(0x00101060, 'PatientMotherBirthName', VR.kPN, VM.k1);
  static const kMilitaryRank =
      DeIdElement(0x00101080, 'MilitaryRank', VR.kLO, VM.k1);
  static const kBranchOfService =
      DeIdElement(0x00101081, 'BranchOfService', VR.kLO, VM.k1);
  static const kMedicalRecordLocator =
      DeIdElement(0x00101090, 'MedicalRecordLocator', VR.kLO, VM.k1);
  static const kReferencedPatientPhotoSequence =
      DeIdElement(0x00101100, 'ReferencedPatientPhotoSequence', VR.kSQ, VM.k1);
  static const kMedicalAlerts = DeIdElement(
      0x00102000, 'MedicalAlerts', VR.kLO, VM.k1_n,
      isSingleton: false);
  static const kAllergies =
      DeIdElement(0x00102110, 'Allergies', VR.kLO, VM.k1_n, isSingleton: false);
  static const kCountryOfResidence =
      DeIdElement(0x00102150, 'CountryOfResidence', VR.kLO, VM.k1);
  static const kRegionOfResidence =
      DeIdElement(0x00102152, 'RegionOfResidence', VR.kLO, VM.k1);
  static const kPatientTelephoneNumbers = DeIdElement(
      0x00102154, 'PatientTelephoneNumbers', VR.kSH, VM.k1_n,
      isSingleton: false);
  static const kEthnicGroup =
      DeIdElement(0x00102160, 'EthnicGroup', VR.kSH, VM.k1);
  static const kOccupation =
      DeIdElement(0x00102180, 'Occupation', VR.kSH, VM.k1);
  static const kSmokingStatus =
      DeIdElement(0x001021a0, 'SmokingStatus', VR.kCS, VM.k1);
  static const kAdditionalPatientHistory =
      DeIdElement(0x001021b0, 'AdditionalPatientHistory', VR.kLT, VM.k1);
  static const kPregnancyStatus =
      DeIdElement(0x001021c0, 'PregnancyStatus', VR.kUS, VM.k1);
  static const kLastMenstrualDate =
      DeIdElement(0x001021d0, 'LastMenstrualDate', VR.kDA, VM.k1);
  static const kPatientReligiousPreference =
      DeIdElement(0x001021f0, 'PatientReligiousPreference', VR.kLO, VM.k1);
  static const kPatientSexNeutered =
      DeIdElement(0x00102203, 'PatientSexNeutered', VR.kCS, VM.k1);
  static const kResponsiblePerson =
      DeIdElement(0x00102297, 'ResponsiblePerson', VR.kPN, VM.k1);
  static const kResponsibleOrganization =
      DeIdElement(0x00102299, 'ResponsibleOrganization', VR.kLO, VM.k1);
  static const kPatientComments =
      DeIdElement(0x00104000, 'PatientComments', VR.kLT, VM.k1);
  static const kContrastBolusAgent =
      DeIdElement(0x00180010, 'ContrastBolusAgent', VR.kLO, VM.k1);
  static const kDeviceSerialNumber =
      DeIdElement(0x00181000, 'DeviceSerialNumber', VR.kLO, VM.k1);
  static const kDeviceUID = DeIdElement(0x00181002, 'DeviceUID', VR.kUI, VM.k1);
  static const kPlateID = DeIdElement(0x00181004, 'PlateID', VR.kLO, VM.k1);
  static const kGeneratorID =
      DeIdElement(0x00181005, 'GeneratorID', VR.kLO, VM.k1);
  static const kCassetteID =
      DeIdElement(0x00181007, 'CassetteID', VR.kLO, VM.k1);
  static const kGantryID = DeIdElement(0x00181008, 'GantryID', VR.kLO, VM.k1);
  static const kProtocolName =
      DeIdElement(0x00181030, 'ProtocolName', VR.kLO, VM.k1);
  static const kAcquisitionDeviceProcessingDescription = DeIdElement(
      0x00181400, 'AcquisitionDeviceProcessingDescription', VR.kLO, VM.k1);
  static const kTargetUID = DeIdElement(0x00182042, 'TargetUID', VR.kUI, VM.k1);
  static const kAcquisitionComments =
      DeIdElement(0x00184000, 'AcquisitionComments', VR.kLT, VM.k1);
  static const kDetectorID =
      DeIdElement(0x0018700a, 'DetectorID', VR.kSH, VM.k1);
  static const kAcquisitionProtocolDescription =
      DeIdElement(0x00189424, 'AcquisitionProtocolDescription', VR.kLT, VM.k1);
  static const kStartAcquisitionDateTime =
      DeIdElement(0x00189516, 'StartAcquisitionDateTime', VR.kDT, VM.k1);
  static const kEndAcquisitionDateTime =
      DeIdElement(0x00189517, 'EndAcquisitionDateTime', VR.kDT, VM.k1);
  static const kContributionDescription =
      DeIdElement(0x0018a003, 'ContributionDescription', VR.kST, VM.k1);
  static const kStudyInstanceUID =
      DeIdElement(0x0020000d, 'StudyInstanceUID', VR.kUI, VM.k1);
  static const kSeriesInstanceUID =
      DeIdElement(0x0020000e, 'SeriesInstanceUID', VR.kUI, VM.k1);
  static const kStudyID = DeIdElement(0x00200010, 'StudyID', VR.kSH, VM.k1);
  static const kFrameOfReferenceUID =
      DeIdElement(0x00200052, 'FrameOfReferenceUID', VR.kUI, VM.k1);
  static const kSynchronizationFrameOfReferenceUID = DeIdElement(
      0x00200200, 'SynchronizationFrameOfReferenceUID', VR.kUI, VM.k1);
  static const kModifyingDeviceID =
      DeIdElement(0x00203401, 'ModifyingDeviceID', VR.kCS, VM.k1);
  static const kModifyingDeviceManufacturer =
      DeIdElement(0x00203404, 'ModifyingDeviceManufacturer', VR.kLO, VM.k1);
  static const kModifiedImageDescription =
      DeIdElement(0x00203406, 'ModifiedImageDescription', VR.kLO, VM.k1);
  static const kImageComments =
      DeIdElement(0x00204000, 'ImageComments', VR.kLT, VM.k1);
  static const kFrameComments =
      DeIdElement(0x00209158, 'FrameComments', VR.kLT, VM.k1);
  static const kConcatenationUID =
      DeIdElement(0x00209161, 'ConcatenationUID', VR.kUI, VM.k1);
  static const kDimensionOrganizationUID =
      DeIdElement(0x00209164, 'DimensionOrganizationUID', VR.kUI, VM.k1);
  static const kPaletteColorLookupTableUID =
      DeIdElement(0x00281199, 'PaletteColorLookupTableUID', VR.kUI, VM.k1);
  static const kLargePaletteColorLookupTableUID =
      DeIdElement(0x00281214, 'LargePaletteColorLookupTableUID', VR.kUI, VM.k1);
  static const kImagePresentationComments =
      DeIdElement(0x00284000, 'ImagePresentationComments', VR.kLT, VM.k1);
  static const kStudyIDIssuer =
      DeIdElement(0x00320012, 'StudyIDIssuer', VR.kLO, VM.k1);
  static const kScheduledStudyLocation =
      DeIdElement(0x00321020, 'ScheduledStudyLocation', VR.kLO, VM.k1);
  static const kScheduledStudyLocationAETitle = DeIdElement(
      0x00321021, 'ScheduledStudyLocationAETitle', VR.kAE, VM.k1_n,
      isSingleton: false);
  static const kReasonForStudy =
      DeIdElement(0x00321030, 'ReasonForStudy', VR.kLO, VM.k1);
  static const kRequestingPhysician =
      DeIdElement(0x00321032, 'RequestingPhysician', VR.kPN, VM.k1);
  static const kRequestingService =
      DeIdElement(0x00321033, 'RequestingService', VR.kLO, VM.k1);
  static const kRequestedProcedureDescription =
      DeIdElement(0x00321060, 'RequestedProcedureDescription', VR.kLO, VM.k1);
  static const kRequestedContrastAgent =
      DeIdElement(0x00321070, 'RequestedContrastAgent', VR.kLO, VM.k1);
  static const kStudyComments =
      DeIdElement(0x00324000, 'StudyComments', VR.kLT, VM.k1);
  static const kReferencedPatientAliasSequence =
      DeIdElement(0x00380004, 'ReferencedPatientAliasSequence', VR.kSQ, VM.k1);
  static const kAdmissionID =
      DeIdElement(0x00380010, 'AdmissionID', VR.kLO, VM.k1);
  static const kIssuerOfAdmissionID =
      DeIdElement(0x00380011, 'IssuerOfAdmissionID', VR.kLO, VM.k1);
  static const kScheduledPatientInstitutionResidence = DeIdElement(
      0x0038001e, 'ScheduledPatientInstitutionResidence', VR.kLO, VM.k1);
  static const kAdmittingDate =
      DeIdElement(0x00380020, 'AdmittingDate', VR.kDA, VM.k1);
  static const kAdmittingTime =
      DeIdElement(0x00380021, 'AdmittingTime', VR.kTM, VM.k1);
  static const kDischargeDiagnosisDescription =
      DeIdElement(0x00380040, 'DischargeDiagnosisDescription', VR.kLO, VM.k1);
  static const kSpecialNeeds =
      DeIdElement(0x00380050, 'SpecialNeeds', VR.kLO, VM.k1);
  static const kServiceEpisodeID =
      DeIdElement(0x00380060, 'ServiceEpisodeID', VR.kLO, VM.k1);
  static const kIssuerOfServiceEpisodeID =
      DeIdElement(0x00380061, 'IssuerOfServiceEpisodeID', VR.kLO, VM.k1);
  static const kServiceEpisodeDescription =
      DeIdElement(0x00380062, 'ServiceEpisodeDescription', VR.kLO, VM.k1);
  static const kCurrentPatientLocation =
      DeIdElement(0x00380300, 'CurrentPatientLocation', VR.kLO, VM.k1);
  static const kPatientInstitutionResidence =
      DeIdElement(0x00380400, 'PatientInstitutionResidence', VR.kLO, VM.k1);
  static const kPatientState =
      DeIdElement(0x00380500, 'PatientState', VR.kLO, VM.k1);
  static const kVisitComments =
      DeIdElement(0x00384000, 'VisitComments', VR.kLT, VM.k1);
  static const kScheduledStationAETitle = DeIdElement(
      0x00400001, 'ScheduledStationAETitle', VR.kAE, VM.k1_n,
      isSingleton: false);
  static const kScheduledProcedureStepStartDate =
      DeIdElement(0x00400002, 'ScheduledProcedureStepStartDate', VR.kDA, VM.k1);
  static const kScheduledProcedureStepStartTime =
      DeIdElement(0x00400003, 'ScheduledProcedureStepStartTime', VR.kTM, VM.k1);
  static const kScheduledProcedureStepEndDate =
      DeIdElement(0x00400004, 'ScheduledProcedureStepEndDate', VR.kDA, VM.k1);
  static const kScheduledProcedureStepEndTime =
      DeIdElement(0x00400005, 'ScheduledProcedureStepEndTime', VR.kTM, VM.k1);
  static const kScheduledPerformingPhysicianName = DeIdElement(
      0x00400006, 'ScheduledPerformingPhysicianName', VR.kPN, VM.k1);
  static const kScheduledProcedureStepDescription = DeIdElement(
      0x00400007, 'ScheduledProcedureStepDescription', VR.kLO, VM.k1);
  static const kScheduledPerformingPhysicianIdentificationSequence =
      DeIdElement(0x0040000b,
          'ScheduledPerformingPhysicianIdentificationSequence', VR.kSQ, VM.k1);
  static const kScheduledStationName = DeIdElement(
      0x00400010, 'ScheduledStationName', VR.kSH, VM.k1_n,
      isSingleton: false);
  static const kScheduledProcedureStepLocation =
      DeIdElement(0x00400011, 'ScheduledProcedureStepLocation', VR.kSH, VM.k1);
  static const kPreMedication =
      DeIdElement(0x00400012, 'PreMedication', VR.kLO, VM.k1);
  static const kPerformedStationAETitle =
      DeIdElement(0x00400241, 'PerformedStationAETitle', VR.kAE, VM.k1);
  static const kPerformedStationName =
      DeIdElement(0x00400242, 'PerformedStationName', VR.kSH, VM.k1);
  static const kPerformedLocation =
      DeIdElement(0x00400243, 'PerformedLocation', VR.kSH, VM.k1);
  static const kPerformedProcedureStepStartDate =
      DeIdElement(0x00400244, 'PerformedProcedureStepStartDate', VR.kDA, VM.k1);
  static const kPerformedProcedureStepStartTime =
      DeIdElement(0x00400245, 'PerformedProcedureStepStartTime', VR.kTM, VM.k1);
  static const kPerformedProcedureStepEndDate =
      DeIdElement(0x00400250, 'PerformedProcedureStepEndDate', VR.kDA, VM.k1);
  static const kPerformedProcedureStepEndTime =
      DeIdElement(0x00400251, 'PerformedProcedureStepEndTime', VR.kTM, VM.k1);
  static const kPerformedProcedureStepID =
      DeIdElement(0x00400253, 'PerformedProcedureStepID', VR.kSH, VM.k1);
  static const kPerformedProcedureStepDescription = DeIdElement(
      0x00400254, 'PerformedProcedureStepDescription', VR.kLO, VM.k1);
  static const kRequestAttributesSequence =
      DeIdElement(0x00400275, 'RequestAttributesSequence', VR.kSQ, VM.k1);
  static const kCommentsOnThePerformedProcedureStep = DeIdElement(
      0x00400280, 'CommentsOnThePerformedProcedureStep', VR.kST, VM.k1);
  static const kAcquisitionContextSequence =
      DeIdElement(0x00400555, 'AcquisitionContextSequence', VR.kSQ, VM.k1);
  static const kRequestedProcedureID =
      DeIdElement(0x00401001, 'RequestedProcedureID', VR.kSH, VM.k1);
  static const kPatientTransportArrangements =
      DeIdElement(0x00401004, 'PatientTransportArrangements', VR.kLO, VM.k1);
  static const kRequestedProcedureLocation =
      DeIdElement(0x00401005, 'RequestedProcedureLocation', VR.kLO, VM.k1);
  static const kNamesOfIntendedRecipientsOfResults = DeIdElement(
      0x00401010, 'NamesOfIntendedRecipientsOfResults', VR.kPN, VM.k1_n,
      isSingleton: false);
  static const kIntendedRecipientsOfResultsIdentificationSequence = DeIdElement(
      0x00401011,
      'IntendedRecipientsOfResultsIdentificationSequence',
      VR.kSQ,
      VM.k1);
  static const kPersonIdentificationCodeSequence = DeIdElement(
      0x00401101, 'PersonIdentificationCodeSequence', VR.kSQ, VM.k1);
  static const kPersonAddress =
      DeIdElement(0x00401102, 'PersonAddress', VR.kST, VM.k1);
  static const kPersonTelephoneNumbers = DeIdElement(
      0x00401103, 'PersonTelephoneNumbers', VR.kLO, VM.k1_n,
      isSingleton: false);
  static const kRequestedProcedureComments =
      DeIdElement(0x00401400, 'RequestedProcedureComments', VR.kLT, VM.k1);
  static const kReasonForTheImagingServiceRequest = DeIdElement(
      0x00402001, 'ReasonForTheImagingServiceRequest', VR.kLO, VM.k1);
  static const kOrderEnteredBy =
      DeIdElement(0x00402008, 'OrderEnteredBy', VR.kPN, VM.k1);
  static const kOrderEntererLocation =
      DeIdElement(0x00402009, 'OrderEntererLocation', VR.kSH, VM.k1);
  static const kOrderCallbackPhoneNumber =
      DeIdElement(0x00402010, 'OrderCallbackPhoneNumber', VR.kSH, VM.k1);
  static const kPlacerOrderNumberImagingServiceRequest = DeIdElement(
      0x00402016, 'PlacerOrderNumberImagingServiceRequest', VR.kLO, VM.k1);
  static const kFillerOrderNumberImagingServiceRequest = DeIdElement(
      0x00402017, 'FillerOrderNumberImagingServiceRequest', VR.kLO, VM.k1);
  static const kImagingServiceRequestComments =
      DeIdElement(0x00402400, 'ImagingServiceRequestComments', VR.kLT, VM.k1);
  static const kConfidentialityConstraintOnPatientDataDescription = DeIdElement(
      0x00403001,
      'ConfidentialityConstraintOnPatientDataDescription',
      VR.kLO,
      VM.k1);
  static const kScheduledProcedureStepStartDateTime = DeIdElement(
      0x00404005, 'ScheduledProcedureStepStartDateTime', VR.kDT, VM.k1);
  static const kScheduledProcedureStepModificationDateTime = DeIdElement(
      0x00404010, 'ScheduledProcedureStepModificationDateTime', VR.kDT, VM.k1);
  static const kExpectedCompletionDateTime =
      DeIdElement(0x00404011, 'ExpectedCompletionDateTime', VR.kDT, VM.k1);
  static const kReferencedGeneralPurposeScheduledProcedureStepTransactionUID =
      DeIdElement(
          0x00404023,
          'ReferencedGeneralPurposeScheduledProcedureStepTransactionUID',
          VR.kUI,
          VM.k1);
  static const kScheduledStationNameCodeSequence = DeIdElement(
      0x00404025, 'ScheduledStationNameCodeSequence', VR.kSQ, VM.k1);
  static const kScheduledStationGeographicLocationCodeSequence = DeIdElement(
      0x00404027,
      'ScheduledStationGeographicLocationCodeSequence',
      VR.kSQ,
      VM.k1);
  static const kPerformedStationNameCodeSequence = DeIdElement(
      0x00404028, 'PerformedStationNameCodeSequence', VR.kSQ, VM.k1);
  static const kPerformedStationGeographicLocationCodeSequence = DeIdElement(
      0x00404030,
      'PerformedStationGeographicLocationCodeSequence',
      VR.kSQ,
      VM.k1);
  static const kScheduledHumanPerformersSequence = DeIdElement(
      0x00404034, 'ScheduledHumanPerformersSequence', VR.kSQ, VM.k1);
  static const kActualHumanPerformersSequence =
      DeIdElement(0x00404035, 'ActualHumanPerformersSequence', VR.kSQ, VM.k1);
  static const kHumanPerformerOrganization =
      DeIdElement(0x00404036, 'HumanPerformerOrganization', VR.kLO, VM.k1);
  static const kHumanPerformerName =
      DeIdElement(0x00404037, 'HumanPerformerName', VR.kPN, VM.k1);
  static const kPerformedProcedureStepStartDateTime = DeIdElement(
      0x00404050, 'PerformedProcedureStepStartDateTime', VR.kDT, VM.k1);
  static const kPerformedProcedureStepEndDateTime = DeIdElement(
      0x00404051, 'PerformedProcedureStepEndDateTime', VR.kDT, VM.k1);
  static const kProcedureStepCancellationDateTime = DeIdElement(
      0x00404052, 'ProcedureStepCancellationDateTime', VR.kDT, VM.k1);
  static const kVerifyingOrganization =
      DeIdElement(0x0040a027, 'VerifyingOrganization', VR.kLO, VM.k1);
  static const kVerifyingObserverSequence =
      DeIdElement(0x0040a073, 'VerifyingObserverSequence', VR.kSQ, VM.k1);
  static const kVerifyingObserverName =
      DeIdElement(0x0040a075, 'VerifyingObserverName', VR.kPN, VM.k1);
  static const kAuthorObserverSequence =
      DeIdElement(0x0040a078, 'AuthorObserverSequence', VR.kSQ, VM.k1);
  static const kParticipantSequence =
      DeIdElement(0x0040a07a, 'ParticipantSequence', VR.kSQ, VM.k1);
  static const kCustodialOrganizationSequence =
      DeIdElement(0x0040a07c, 'CustodialOrganizationSequence', VR.kSQ, VM.k1);
  static const kVerifyingObserverIdentificationCodeSequence = DeIdElement(
      0x0040a088, 'VerifyingObserverIdentificationCodeSequence', VR.kSQ, VM.k1);
  static const kPersonName =
      DeIdElement(0x0040a123, 'PersonName', VR.kPN, VM.k1);
  static const kUID = DeIdElement(0x0040a124, 'UID', VR.kUI, VM.k1);
  static const kObservationUID =
      DeIdElement(0x0040a171, 'ObservationUID', VR.kUI, VM.k1);
  static const kReferencedObservationUIDTrial =
      DeIdElement(0x0040a172, 'ReferencedObservationUIDTrial', VR.kUI, VM.k1);
  static const kObservationDateTrial =
      DeIdElement(0x0040a192, 'ObservationDateTrial', VR.kDA, VM.k1);
  static const kObservationTimeTrial =
      DeIdElement(0x0040a193, 'ObservationTimeTrial', VR.kTM, VM.k1);
  static const kCurrentObserverTrial =
      DeIdElement(0x0040a307, 'CurrentObserverTrial', VR.kPN, VM.k1);
  static const kVerbalSourceTrial =
      DeIdElement(0x0040a352, 'VerbalSourceTrial', VR.kPN, VM.k1);
  static const kAddressTrial =
      DeIdElement(0x0040a353, 'AddressTrial', VR.kST, VM.k1);
  static const kTelephoneNumberTrial =
      DeIdElement(0x0040a354, 'TelephoneNumberTrial', VR.kLO, VM.k1);
  static const kVerbalSourceIdentifierCodeSequenceTrial = DeIdElement(
      0x0040a358, 'VerbalSourceIdentifierCodeSequenceTrial', VR.kSQ, VM.k1);
  static const kObservationSubjectUIDTrial =
      DeIdElement(0x0040a402, 'ObservationSubjectUIDTrial', VR.kUI, VM.k1);
  static const kContentSequence =
      DeIdElement(0x0040a730, 'ContentSequence', VR.kSQ, VM.k1);
  static const kTemplateExtensionOrganizationUID = DeIdElement(
      0x0040db0c, 'TemplateExtensionOrganizationUID', VR.kUI, VM.k1);
  static const kTemplateExtensionCreatorUID =
      DeIdElement(0x0040db0d, 'TemplateExtensionCreatorUID', VR.kUI, VM.k1);
  static const kGraphicAnnotationSequence =
      DeIdElement(0x00700001, 'GraphicAnnotationSequence', VR.kSQ, VM.k1);
  static const kContentCreatorName =
      DeIdElement(0x00700084, 'ContentCreatorName', VR.kPN, VM.k1);
  static const kContentCreatorIdentificationCodeSequence = DeIdElement(
      0x00700086, 'ContentCreatorIdentificationCodeSequence', VR.kSQ, VM.k1);
  static const kFiducialUID =
      DeIdElement(0x0070031a, 'FiducialUID', VR.kUI, VM.k1);
  static const kStorageMediaFileSetUID =
      DeIdElement(0x00880140, 'StorageMediaFileSetUID', VR.kUI, VM.k1);
  static const kIconImageSequence =
      DeIdElement(0x00880200, 'IconImageSequence', VR.kSQ, VM.k1);
  static const kTopicTitle =
      DeIdElement(0x00880904, 'TopicTitle', VR.kLO, VM.k1);
  static const kTopicSubject =
      DeIdElement(0x00880906, 'TopicSubject', VR.kST, VM.k1);
  static const kTopicAuthor =
      DeIdElement(0x00880910, 'TopicAuthor', VR.kLO, VM.k1);
  static const kTopicKeywords = DeIdElement(
      0x00880912, 'TopicKeywords', VR.kLO, VM.k1_32,
      isSingleton: false);
  static const kDigitalSignatureUID =
      DeIdElement(0x04000100, 'DigitalSignatureUID', VR.kUI, VM.k1);
  static const kReferencedDigitalSignatureSequence = DeIdElement(
      0x04000402, 'ReferencedDigitalSignatureSequence', VR.kSQ, VM.k1);
  static const kReferencedSOPInstanceMACSequence = DeIdElement(
      0x04000403, 'ReferencedSOPInstanceMACSequence', VR.kSQ, VM.k1);
  static const kMAC = DeIdElement(0x04000404, 'MAC', VR.kOB, VM.k1);
  static const kModifiedAttributesSequence =
      DeIdElement(0x04000550, 'ModifiedAttributesSequence', VR.kSQ, VM.k1);
  static const kOriginalAttributesSequence =
      DeIdElement(0x04000561, 'OriginalAttributesSequence', VR.kSQ, VM.k1);
  static const kTextString =
      DeIdElement(0x20300020, 'TextString', VR.kLO, VM.k1);
  static const kReferencedFrameOfReferenceUID =
      DeIdElement(0x30060024, 'ReferencedFrameOfReferenceUID', VR.kUI, VM.k1);
  static const kRelatedFrameOfReferenceUID =
      DeIdElement(0x300600c2, 'RelatedFrameOfReferenceUID', VR.kUI, VM.k1);
  static const kSourceSerialNumber =
      DeIdElement(0x30080105, 'SourceSerialNumber', VR.kLO, VM.k1);
  static const kDoseReferenceUID =
      DeIdElement(0x300a0013, 'DoseReferenceUID', VR.kUI, VM.k1);
  static const kReviewerName =
      DeIdElement(0x300e0008, 'ReviewerName', VR.kPN, VM.k1);
  static const kArbitrary = DeIdElement(0x40000010, 'Arbitrary', VR.kLT, VM.k1);
  static const kTextComments =
      DeIdElement(0x40004000, 'TextComments', VR.kLT, VM.k1);
  static const kResultsIDIssuer =
      DeIdElement(0x40080042, 'ResultsIDIssuer', VR.kLO, VM.k1);
  static const kInterpretationRecorder =
      DeIdElement(0x40080102, 'InterpretationRecorder', VR.kPN, VM.k1);
  static const kInterpretationTranscriber =
      DeIdElement(0x4008010a, 'InterpretationTranscriber', VR.kPN, VM.k1);
  static const kInterpretationText =
      DeIdElement(0x4008010b, 'InterpretationText', VR.kST, VM.k1);
  static const kInterpretationAuthor =
      DeIdElement(0x4008010c, 'InterpretationAuthor', VR.kPN, VM.k1);
  static const kInterpretationApproverSequence =
      DeIdElement(0x40080111, 'InterpretationApproverSequence', VR.kSQ, VM.k1);
  static const kPhysicianApprovingInterpretation = DeIdElement(
      0x40080114, 'PhysicianApprovingInterpretation', VR.kPN, VM.k1);
  static const kInterpretationDiagnosisDescription = DeIdElement(
      0x40080115, 'InterpretationDiagnosisDescription', VR.kLT, VM.k1);
  static const kResultsDistributionListSequence =
      DeIdElement(0x40080118, 'ResultsDistributionListSequence', VR.kSQ, VM.k1);
  static const kDistributionName =
      DeIdElement(0x40080119, 'DistributionName', VR.kPN, VM.k1);
  static const kDistributionAddress =
      DeIdElement(0x4008011a, 'DistributionAddress', VR.kLO, VM.k1);
  static const kInterpretationIDIssuer =
      DeIdElement(0x40080202, 'InterpretationIDIssuer', VR.kLO, VM.k1);
  static const kImpressions =
      DeIdElement(0x40080300, 'Impressions', VR.kST, VM.k1);
  static const kResultsComments =
      DeIdElement(0x40084000, 'ResultsComments', VR.kST, VM.k1);
  static const kDigitalSignaturesSequence =
      DeIdElement(0xfffafffa, 'DigitalSignaturesSequence', VR.kSQ, VM.k1);
  static const kDataSetTrailingPadding =
      DeIdElement(0xfffcfffc, 'DataSetTrailingPadding', VR.kOB, VM.k1);

  static const map = <int, DeIdElement>{
    0x00001000: kAffectedSOPInstanceUID,
    0x00001001: kRequestedSOPInstanceUID,
    0x00020003: kMediaStorageSOPInstanceUID,
    0x00041510: kReferencedSOPClassUIDInFile,
    0x00080014: kInstanceCreatorUID,
    0x00080015: kInstanceCoercionDateTime,
    0x00080018: kSOPInstanceUID,
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
    0x00080050: kAccessionNumber,
    0x00080058: kFailedSOPInstanceUIDList,
    0x00080080: kInstitutionName,
    0x00080081: kInstitutionAddress,
    0x00080082: kInstitutionCodeSequence,
    0x00080090: kReferringPhysicianName,
    0x00080092: kReferringPhysicianAddress,
    0x00080094: kReferringPhysicianTelephoneNumbers,
    0x00080096: kReferringPhysicianIdentificationSequence,
    0x0008010d: kContextGroupExtensionCreatorUID,
    0x00080201: kTimezoneOffsetFromUTC,
    0x00081010: kStationName,
    0x00081030: kStudyDescription,
    0x0008103e: kSeriesDescription,
    0x00081040: kInstitutionalDepartmentName,
    0x00081048: kPhysiciansOfRecord,
    0x00081049: kPhysiciansOfRecordIdentificationSequence,
    0x00081050: kPerformingPhysicianName,
    0x00081052: kPerformingPhysicianIdentificationSequence,
    0x00081060: kNameOfPhysiciansReadingStudy,
    0x00081062: kPhysiciansReadingStudyIdentificationSequence,
    0x00081070: kOperatorsName,
    0x00081072: kOperatorIdentificationSequence,
    0x00081080: kAdmittingDiagnosesDescription,
    0x00081084: kAdmittingDiagnosesCodeSequence,
    0x00081110: kReferencedStudySequence,
    0x00081111: kReferencedPerformedProcedureStepSequence,
    0x00081120: kReferencedPatientSequence,
    0x00081140: kReferencedImageSequence,
    0x00081155: kReferencedSOPInstanceUID,
    0x00081195: kTransactionUID,
    0x00082111: kDerivationDescription,
    0x00082112: kSourceImageSequence,
    0x00083010: kIrradiationEventUID,
    0x00084000: kIdentifyingComments,
    0x00089123: kCreatorVersionUID,
    0x00100010: kPatientName,
    0x00100020: kPatientID,
    0x00100021: kIssuerOfPatientID,
    0x00100030: kPatientBirthDate,
    0x00100032: kPatientBirthTime,
    0x00100040: kPatientSex,
    0x00100050: kPatientInsurancePlanCodeSequence,
    0x00100101: kPatientPrimaryLanguageCodeSequence,
    0x00100102: kPatientPrimaryLanguageModifierCodeSequence,
    0x00101000: kOtherPatientIDs,
    0x00101001: kOtherPatientNames,
    0x00101002: kOtherPatientIDsSequence,
    0x00101005: kPatientBirthName,
    0x00101010: kPatientAge,
    0x00101020: kPatientSize,
    0x00101030: kPatientWeight,
    0x00101040: kPatientAddress,
    0x00101050: kInsurancePlanIdentification,
    0x00101060: kPatientMotherBirthName,
    0x00101080: kMilitaryRank,
    0x00101081: kBranchOfService,
    0x00101090: kMedicalRecordLocator,
    0x00101100: kReferencedPatientPhotoSequence,
    0x00102000: kMedicalAlerts,
    0x00102110: kAllergies,
    0x00102150: kCountryOfResidence,
    0x00102152: kRegionOfResidence,
    0x00102154: kPatientTelephoneNumbers,
    0x00102160: kEthnicGroup,
    0x00102180: kOccupation,
    0x001021a0: kSmokingStatus,
    0x001021b0: kAdditionalPatientHistory,
    0x001021c0: kPregnancyStatus,
    0x001021d0: kLastMenstrualDate,
    0x001021f0: kPatientReligiousPreference,
    0x00102203: kPatientSexNeutered,
    0x00102297: kResponsiblePerson,
    0x00102299: kResponsibleOrganization,
    0x00104000: kPatientComments,
    0x00180010: kContrastBolusAgent,
    0x00181000: kDeviceSerialNumber,
    0x00181002: kDeviceUID,
    0x00181004: kPlateID,
    0x00181005: kGeneratorID,
    0x00181007: kCassetteID,
    0x00181008: kGantryID,
    0x00181030: kProtocolName,
    0x00181400: kAcquisitionDeviceProcessingDescription,
    0x00182042: kTargetUID,
    0x00184000: kAcquisitionComments,
    0x0018700a: kDetectorID,
    0x00189424: kAcquisitionProtocolDescription,
    0x00189516: kStartAcquisitionDateTime,
    0x00189517: kEndAcquisitionDateTime,
    0x0018a003: kContributionDescription,
    0x0020000d: kStudyInstanceUID,
    0x0020000e: kSeriesInstanceUID,
    0x00200010: kStudyID,
    0x00200052: kFrameOfReferenceUID,
    0x00200200: kSynchronizationFrameOfReferenceUID,
    0x00203401: kModifyingDeviceID,
    0x00203404: kModifyingDeviceManufacturer,
    0x00203406: kModifiedImageDescription,
    0x00204000: kImageComments,
    0x00209158: kFrameComments,
    0x00209161: kConcatenationUID,
    0x00209164: kDimensionOrganizationUID,
    0x00281199: kPaletteColorLookupTableUID,
    0x00281214: kLargePaletteColorLookupTableUID,
    0x00284000: kImagePresentationComments,
    0x00320012: kStudyIDIssuer,
    0x00321020: kScheduledStudyLocation,
    0x00321021: kScheduledStudyLocationAETitle,
    0x00321030: kReasonForStudy,
    0x00321032: kRequestingPhysician,
    0x00321033: kRequestingService,
    0x00321060: kRequestedProcedureDescription,
    0x00321070: kRequestedContrastAgent,
    0x00324000: kStudyComments,
    0x00380004: kReferencedPatientAliasSequence,
    0x00380010: kAdmissionID,
    0x00380011: kIssuerOfAdmissionID,
    0x0038001e: kScheduledPatientInstitutionResidence,
    0x00380020: kAdmittingDate,
    0x00380021: kAdmittingTime,
    0x00380040: kDischargeDiagnosisDescription,
    0x00380050: kSpecialNeeds,
    0x00380060: kServiceEpisodeID,
    0x00380061: kIssuerOfServiceEpisodeID,
    0x00380062: kServiceEpisodeDescription,
    0x00380300: kCurrentPatientLocation,
    0x00380400: kPatientInstitutionResidence,
    0x00380500: kPatientState,
    0x00384000: kVisitComments,
    0x00400001: kScheduledStationAETitle,
    0x00400002: kScheduledProcedureStepStartDate,
    0x00400003: kScheduledProcedureStepStartTime,
    0x00400004: kScheduledProcedureStepEndDate,
    0x00400005: kScheduledProcedureStepEndTime,
    0x00400006: kScheduledPerformingPhysicianName,
    0x00400007: kScheduledProcedureStepDescription,
    0x0040000b: kScheduledPerformingPhysicianIdentificationSequence,
    0x00400010: kScheduledStationName,
    0x00400011: kScheduledProcedureStepLocation,
    0x00400012: kPreMedication,
    0x00400241: kPerformedStationAETitle,
    0x00400242: kPerformedStationName,
    0x00400243: kPerformedLocation,
    0x00400244: kPerformedProcedureStepStartDate,
    0x00400245: kPerformedProcedureStepStartTime,
    0x00400250: kPerformedProcedureStepEndDate,
    0x00400251: kPerformedProcedureStepEndTime,
    0x00400253: kPerformedProcedureStepID,
    0x00400254: kPerformedProcedureStepDescription,
    0x00400275: kRequestAttributesSequence,
    0x00400280: kCommentsOnThePerformedProcedureStep,
    0x00400555: kAcquisitionContextSequence,
    0x00401001: kRequestedProcedureID,
    0x00401004: kPatientTransportArrangements,
    0x00401005: kRequestedProcedureLocation,
    0x00401010: kNamesOfIntendedRecipientsOfResults,
    0x00401011: kIntendedRecipientsOfResultsIdentificationSequence,
    0x00401101: kPersonIdentificationCodeSequence,
    0x00401102: kPersonAddress,
    0x00401103: kPersonTelephoneNumbers,
    0x00401400: kRequestedProcedureComments,
    0x00402001: kReasonForTheImagingServiceRequest,
    0x00402008: kOrderEnteredBy,
    0x00402009: kOrderEntererLocation,
    0x00402010: kOrderCallbackPhoneNumber,
    0x00402016: kPlacerOrderNumberImagingServiceRequest,
    0x00402017: kFillerOrderNumberImagingServiceRequest,
    0x00402400: kImagingServiceRequestComments,
    0x00403001: kConfidentialityConstraintOnPatientDataDescription,
    0x00404005: kScheduledProcedureStepStartDateTime,
    0x00404010: kScheduledProcedureStepModificationDateTime,
    0x00404011: kExpectedCompletionDateTime,
    0x00404023: kReferencedGeneralPurposeScheduledProcedureStepTransactionUID,
    0x00404025: kScheduledStationNameCodeSequence,
    0x00404027: kScheduledStationGeographicLocationCodeSequence,
    0x00404028: kPerformedStationNameCodeSequence,
    0x00404030: kPerformedStationGeographicLocationCodeSequence,
    0x00404034: kScheduledHumanPerformersSequence,
    0x00404035: kActualHumanPerformersSequence,
    0x00404036: kHumanPerformerOrganization,
    0x00404037: kHumanPerformerName,
    0x00404050: kPerformedProcedureStepStartDateTime,
    0x00404051: kPerformedProcedureStepEndDateTime,
    0x00404052: kProcedureStepCancellationDateTime,
    0x0040a027: kVerifyingOrganization,
    0x0040a073: kVerifyingObserverSequence,
    0x0040a075: kVerifyingObserverName,
    0x0040a078: kAuthorObserverSequence,
    0x0040a07a: kParticipantSequence,
    0x0040a07c: kCustodialOrganizationSequence,
    0x0040a088: kVerifyingObserverIdentificationCodeSequence,
    0x0040a123: kPersonName,
    0x0040a124: kUID,
    0x0040a171: kObservationUID,
    0x0040a172: kReferencedObservationUIDTrial,
    0x0040a192: kObservationDateTrial,
    0x0040a193: kObservationTimeTrial,
    0x0040a307: kCurrentObserverTrial,
    0x0040a352: kVerbalSourceTrial,
    0x0040a353: kAddressTrial,
    0x0040a354: kTelephoneNumberTrial,
    0x0040a358: kVerbalSourceIdentifierCodeSequenceTrial,
    0x0040a402: kObservationSubjectUIDTrial,
    0x0040a730: kContentSequence,
    0x0040db0c: kTemplateExtensionOrganizationUID,
    0x0040db0d: kTemplateExtensionCreatorUID,
    0x00700001: kGraphicAnnotationSequence,
    0x00700084: kContentCreatorName,
    0x00700086: kContentCreatorIdentificationCodeSequence,
    0x0070031a: kFiducialUID,
    0x00880140: kStorageMediaFileSetUID,
    0x00880200: kIconImageSequence,
    0x00880904: kTopicTitle,
    0x00880906: kTopicSubject,
    0x00880910: kTopicAuthor,
    0x00880912: kTopicKeywords,
    0x04000100: kDigitalSignatureUID,
    0x04000402: kReferencedDigitalSignatureSequence,
    0x04000403: kReferencedSOPInstanceMACSequence,
    0x04000404: kMAC,
    0x04000550: kModifiedAttributesSequence,
    0x04000561: kOriginalAttributesSequence,
    0x20300020: kTextString,
    0x30060024: kReferencedFrameOfReferenceUID,
    0x300600c2: kRelatedFrameOfReferenceUID,
    0x30080105: kSourceSerialNumber,
    0x300a0013: kDoseReferenceUID,
    0x300e0008: kReviewerName,
    0x40000010: kArbitrary,
    0x40004000: kTextComments,
    0x40080042: kResultsIDIssuer,
    0x40080102: kInterpretationRecorder,
    0x4008010a: kInterpretationTranscriber,
    0x4008010b: kInterpretationText,
    0x4008010c: kInterpretationAuthor,
    0x40080111: kInterpretationApproverSequence,
    0x40080114: kPhysicianApprovingInterpretation,
    0x40080115: kInterpretationDiagnosisDescription,
    0x40080118: kResultsDistributionListSequence,
    0x40080119: kDistributionName,
    0x4008011a: kDistributionAddress,
    0x40080202: kInterpretationIDIssuer,
    0x40080300: kImpressions,
    0x40084000: kResultsComments,
    0xfffafffa: kDigitalSignaturesSequence,
    0xfffcfffc: kDataSetTrailingPadding
  };

  static const List<int> keys = <int>[
    0x00001000,
    0x00001001,
    0x00020003,
    0x00041510,
    0x00080014,
    0x00080015,
    0x00080018,
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
    0x00080050,
    0x00080058,
    0x00080080,
    0x00080081,
    0x00080082,
    0x00080090,
    0x00080092,
    0x00080094,
    0x00080096,
    0x0008010d,
    0x00080201,
    0x00081010,
    0x00081030,
    0x0008103e,
    0x00081040,
    0x00081048,
    0x00081049,
    0x00081050,
    0x00081052,
    0x00081060,
    0x00081062,
    0x00081070,
    0x00081072,
    0x00081080,
    0x00081084,
    0x00081110,
    0x00081111,
    0x00081120,
    0x00081140,
    0x00081155,
    0x00081195,
    0x00082111,
    0x00082112,
    0x00083010,
    0x00084000,
    0x00089123,
    0x00100010,
    0x00100020,
    0x00100021,
    0x00100030,
    0x00100032,
    0x00100040,
    0x00100050,
    0x00100101,
    0x00100102,
    0x00101000,
    0x00101001,
    0x00101002,
    0x00101005,
    0x00101010,
    0x00101020,
    0x00101030,
    0x00101040,
    0x00101050,
    0x00101060,
    0x00101080,
    0x00101081,
    0x00101090,
    0x00101100,
    0x00102000,
    0x00102110,
    0x00102150,
    0x00102152,
    0x00102154,
    0x00102160,
    0x00102180,
    0x001021a0,
    0x001021b0,
    0x001021c0,
    0x001021d0,
    0x001021f0,
    0x00102203,
    0x00102297,
    0x00102299,
    0x00104000,
    0x00180010,
    0x00181000,
    0x00181002,
    0x00181004,
    0x00181005,
    0x00181007,
    0x00181008,
    0x00181030,
    0x00181400,
    0x00182042,
    0x00184000,
    0x0018700a,
    0x00189424,
    0x00189516,
    0x00189517,
    0x0018a003,
    0x0020000d,
    0x0020000e,
    0x00200010,
    0x00200052,
    0x00200200,
    0x00203401,
    0x00203404,
    0x00203406,
    0x00204000,
    0x00209158,
    0x00209161,
    0x00209164,
    0x00281199,
    0x00281214,
    0x00284000,
    0x00320012,
    0x00321020,
    0x00321021,
    0x00321030,
    0x00321032,
    0x00321033,
    0x00321060,
    0x00321070,
    0x00324000,
    0x00380004,
    0x00380010,
    0x00380011,
    0x0038001e,
    0x00380020,
    0x00380021,
    0x00380040,
    0x00380050,
    0x00380060,
    0x00380061,
    0x00380062,
    0x00380300,
    0x00380400,
    0x00380500,
    0x00384000,
    0x00400001,
    0x00400002,
    0x00400003,
    0x00400004,
    0x00400005,
    0x00400006,
    0x00400007,
    0x0040000b,
    0x00400010,
    0x00400011,
    0x00400012,
    0x00400241,
    0x00400242,
    0x00400243,
    0x00400244,
    0x00400245,
    0x00400250,
    0x00400251,
    0x00400253,
    0x00400254,
    0x00400275,
    0x00400280,
    0x00400555,
    0x00401001,
    0x00401004,
    0x00401005,
    0x00401010,
    0x00401011,
    0x00401101,
    0x00401102,
    0x00401103,
    0x00401400,
    0x00402001,
    0x00402008,
    0x00402009,
    0x00402010,
    0x00402016,
    0x00402017,
    0x00402400,
    0x00403001,
    0x00404005,
    0x00404010,
    0x00404011,
    0x00404023,
    0x00404025,
    0x00404027,
    0x00404028,
    0x00404030,
    0x00404034,
    0x00404035,
    0x00404036,
    0x00404037,
    0x00404050,
    0x00404051,
    0x00404052,
    0x0040a027,
    0x0040a073,
    0x0040a075,
    0x0040a078,
    0x0040a07a,
    0x0040a07c,
    0x0040a088,
    0x0040a123,
    0x0040a124,
    0x0040a171,
    0x0040a172,
    0x0040a192,
    0x0040a193,
    0x0040a307,
    0x0040a352,
    0x0040a353,
    0x0040a354,
    0x0040a358,
    0x0040a402,
    0x0040a730,
    0x0040db0c,
    0x0040db0d,
    0x00700001,
    0x00700084,
    0x00700086,
    0x0070031a,
    0x00880140,
    0x00880200,
    0x00880904,
    0x00880906,
    0x00880910,
    0x00880912,
    0x04000100,
    0x04000402,
    0x04000403,
    0x04000404,
    0x04000550,
    0x04000561,
    0x20300020,
    0x30060024,
    0x300600c2,
    0x30080105,
    0x300a0013,
    0x300e0008,
    0x40000010,
    0x40004000,
    0x40080042,
    0x40080102,
    0x4008010a,
    0x4008010b,
    0x4008010c,
    0x40080111,
    0x40080114,
    0x40080115,
    0x40080118,
    0x40080119,
    0x4008011a,
    0x40080202,
    0x40080300,
    0x40084000,
    0xfffafffa,
    0xfffcfffc
  ];

  static const List values = <DeIdElement>[
    kAffectedSOPInstanceUID,
    kRequestedSOPInstanceUID,
    kMediaStorageSOPInstanceUID,
    kReferencedSOPClassUIDInFile,
    kInstanceCreatorUID,
    kInstanceCoercionDateTime,
    kSOPInstanceUID,
    kStudyDate,
    kSeriesDate,
    kAcquisitionDate,
    kContentDate,
    kOverlayDate,
    kCurveDate,
    kAcquisitionDateTime,
    kStudyTime,
    kSeriesTime,
    kAcquisitionTime,
    kContentTime,
    kOverlayTime,
    kCurveTime,
    kAccessionNumber,
    kFailedSOPInstanceUIDList,
    kInstitutionName,
    kInstitutionAddress,
    kInstitutionCodeSequence,
    kReferringPhysicianName,
    kReferringPhysicianAddress,
    kReferringPhysicianTelephoneNumbers,
    kReferringPhysicianIdentificationSequence,
    kContextGroupExtensionCreatorUID,
    kTimezoneOffsetFromUTC,
    kStationName,
    kStudyDescription,
    kSeriesDescription,
    kInstitutionalDepartmentName,
    kPhysiciansOfRecord,
    kPhysiciansOfRecordIdentificationSequence,
    kPerformingPhysicianName,
    kPerformingPhysicianIdentificationSequence,
    kNameOfPhysiciansReadingStudy,
    kPhysiciansReadingStudyIdentificationSequence,
    kOperatorsName,
    kOperatorIdentificationSequence,
    kAdmittingDiagnosesDescription,
    kAdmittingDiagnosesCodeSequence,
    kReferencedStudySequence,
    kReferencedPerformedProcedureStepSequence,
    kReferencedPatientSequence,
    kReferencedImageSequence,
    kReferencedSOPInstanceUID,
    kTransactionUID,
    kDerivationDescription,
    kSourceImageSequence,
    kIrradiationEventUID,
    kIdentifyingComments,
    kCreatorVersionUID,
    kPatientName,
    kPatientID,
    kIssuerOfPatientID,
    kPatientBirthDate,
    kPatientBirthTime,
    kPatientSex,
    kPatientInsurancePlanCodeSequence,
    kPatientPrimaryLanguageCodeSequence,
    kPatientPrimaryLanguageModifierCodeSequence,
    kOtherPatientIDs,
    kOtherPatientNames,
    kOtherPatientIDsSequence,
    kPatientBirthName,
    kPatientAge,
    kPatientSize,
    kPatientWeight,
    kPatientAddress,
    kInsurancePlanIdentification,
    kPatientMotherBirthName,
    kMilitaryRank,
    kBranchOfService,
    kMedicalRecordLocator,
    kReferencedPatientPhotoSequence,
    kMedicalAlerts,
    kAllergies,
    kCountryOfResidence,
    kRegionOfResidence,
    kPatientTelephoneNumbers,
    kEthnicGroup,
    kOccupation,
    kSmokingStatus,
    kAdditionalPatientHistory,
    kPregnancyStatus,
    kLastMenstrualDate,
    kPatientReligiousPreference,
    kPatientSexNeutered,
    kResponsiblePerson,
    kResponsibleOrganization,
    kPatientComments,
    kContrastBolusAgent,
    kDeviceSerialNumber,
    kDeviceUID,
    kPlateID,
    kGeneratorID,
    kCassetteID,
    kGantryID,
    kProtocolName,
    kAcquisitionDeviceProcessingDescription,
    kTargetUID,
    kAcquisitionComments,
    kDetectorID,
    kAcquisitionProtocolDescription,
    kStartAcquisitionDateTime,
    kEndAcquisitionDateTime,
    kContributionDescription,
    kStudyInstanceUID,
    kSeriesInstanceUID,
    kStudyID,
    kFrameOfReferenceUID,
    kSynchronizationFrameOfReferenceUID,
    kModifyingDeviceID,
    kModifyingDeviceManufacturer,
    kModifiedImageDescription,
    kImageComments,
    kFrameComments,
    kConcatenationUID,
    kDimensionOrganizationUID,
    kPaletteColorLookupTableUID,
    kLargePaletteColorLookupTableUID,
    kImagePresentationComments,
    kStudyIDIssuer,
    kScheduledStudyLocation,
    kScheduledStudyLocationAETitle,
    kReasonForStudy,
    kRequestingPhysician,
    kRequestingService,
    kRequestedProcedureDescription,
    kRequestedContrastAgent,
    kStudyComments,
    kReferencedPatientAliasSequence,
    kAdmissionID,
    kIssuerOfAdmissionID,
    kScheduledPatientInstitutionResidence,
    kAdmittingDate,
    kAdmittingTime,
    kDischargeDiagnosisDescription,
    kSpecialNeeds,
    kServiceEpisodeID,
    kIssuerOfServiceEpisodeID,
    kServiceEpisodeDescription,
    kCurrentPatientLocation,
    kPatientInstitutionResidence,
    kPatientState,
    kVisitComments,
    kScheduledStationAETitle,
    kScheduledProcedureStepStartDate,
    kScheduledProcedureStepStartTime,
    kScheduledProcedureStepEndDate,
    kScheduledProcedureStepEndTime,
    kScheduledPerformingPhysicianName,
    kScheduledProcedureStepDescription,
    kScheduledPerformingPhysicianIdentificationSequence,
    kScheduledStationName,
    kScheduledProcedureStepLocation,
    kPreMedication,
    kPerformedStationAETitle,
    kPerformedStationName,
    kPerformedLocation,
    kPerformedProcedureStepStartDate,
    kPerformedProcedureStepStartTime,
    kPerformedProcedureStepEndDate,
    kPerformedProcedureStepEndTime,
    kPerformedProcedureStepID,
    kPerformedProcedureStepDescription,
    kRequestAttributesSequence,
    kCommentsOnThePerformedProcedureStep,
    kAcquisitionContextSequence,
    kRequestedProcedureID,
    kPatientTransportArrangements,
    kRequestedProcedureLocation,
    kNamesOfIntendedRecipientsOfResults,
    kIntendedRecipientsOfResultsIdentificationSequence,
    kPersonIdentificationCodeSequence,
    kPersonAddress,
    kPersonTelephoneNumbers,
    kRequestedProcedureComments,
    kReasonForTheImagingServiceRequest,
    kOrderEnteredBy,
    kOrderEntererLocation,
    kOrderCallbackPhoneNumber,
    kPlacerOrderNumberImagingServiceRequest,
    kFillerOrderNumberImagingServiceRequest,
    kImagingServiceRequestComments,
    kConfidentialityConstraintOnPatientDataDescription,
    kScheduledProcedureStepStartDateTime,
    kScheduledProcedureStepModificationDateTime,
    kExpectedCompletionDateTime,
    kReferencedGeneralPurposeScheduledProcedureStepTransactionUID,
    kScheduledStationNameCodeSequence,
    kScheduledStationGeographicLocationCodeSequence,
    kPerformedStationNameCodeSequence,
    kPerformedStationGeographicLocationCodeSequence,
    kScheduledHumanPerformersSequence,
    kActualHumanPerformersSequence,
    kHumanPerformerOrganization,
    kHumanPerformerName,
    kPerformedProcedureStepStartDateTime,
    kPerformedProcedureStepEndDateTime,
    kProcedureStepCancellationDateTime,
    kVerifyingOrganization,
    kVerifyingObserverSequence,
    kVerifyingObserverName,
    kAuthorObserverSequence,
    kParticipantSequence,
    kCustodialOrganizationSequence,
    kVerifyingObserverIdentificationCodeSequence,
    kPersonName,
    kUID,
    kObservationUID,
    kReferencedObservationUIDTrial,
    kObservationDateTrial,
    kObservationTimeTrial,
    kCurrentObserverTrial,
    kVerbalSourceTrial,
    kAddressTrial,
    kTelephoneNumberTrial,
    kVerbalSourceIdentifierCodeSequenceTrial,
    kObservationSubjectUIDTrial,
    kContentSequence,
    kTemplateExtensionOrganizationUID,
    kTemplateExtensionCreatorUID,
    kGraphicAnnotationSequence,
    kContentCreatorName,
    kContentCreatorIdentificationCodeSequence,
    kFiducialUID,
    kStorageMediaFileSetUID,
    kIconImageSequence,
    kTopicTitle,
    kTopicSubject,
    kTopicAuthor,
    kTopicKeywords,
    kDigitalSignatureUID,
    kReferencedDigitalSignatureSequence,
    kReferencedSOPInstanceMACSequence,
    kMAC,
    kModifiedAttributesSequence,
    kOriginalAttributesSequence,
    kTextString,
    kReferencedFrameOfReferenceUID,
    kRelatedFrameOfReferenceUID,
    kSourceSerialNumber,
    kDoseReferenceUID,
    kReviewerName,
    kArbitrary,
    kTextComments,
    kResultsIDIssuer,
    kInterpretationRecorder,
    kInterpretationTranscriber,
    kInterpretationText,
    kInterpretationAuthor,
    kInterpretationApproverSequence,
    kPhysicianApprovingInterpretation,
    kInterpretationDiagnosisDescription,
    kResultsDistributionListSequence,
    kDistributionName,
    kDistributionAddress,
    kInterpretationIDIssuer,
    kImpressions,
    kResultsComments,
    kDigitalSignaturesSequence,
    kDataSetTrailingPadding
  ];
}
