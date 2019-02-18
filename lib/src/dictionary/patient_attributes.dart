// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

import 'package:core/core.dart';

// ignore_for_file: public_member_api_docs

class PatientIdentificationModule {
  PatientIdentificationModule();

  static const Map<int, EType> deList = {
    kPatientName: EType.k2,

    kPatientID: EType.k2,

    // include Table 10-18 Issuer of Patient ID Macro,

    kPatientBirthDate: EType.k2,
    // kPatientBirthDateInAlternativeCalendar: EType.k3,

    kPatientSex: EType.k2,
    kReferencedPatientPhotoSequence: EType.k3,
    kQualityControlSubject: EType.k3,
    kReferencedPatientSequence: EType.k3,
    kPatientBirthTime: EType.k3,
    kOtherPatientIDs: EType.k3,
    kOtherPatientIDsSequence: EType.k3,
    kOtherPatientNames: EType.k3,
    kEthnicGroup: EType.k3,
    kPatientComments: EType.k3,
    kPatientSpeciesDescription: EType.k1c,
    kPatientSpeciesCodeSequence: EType.k1c,
    kPatientBreedDescription: EType.k2c,
    kPatientBreedCodeSequence: EType.k2c,
    kBreedRegistrationSequence: EType.k2c,
    kResponsiblePerson: EType.k2c,
    kResponsiblePersonRole: EType.k1c,
    kResponsibleOrganization: EType.k2c,
    kPatientIdentityRemoved: EType.k3,
    kDeidentificationMethod: EType.k1c,
    kDeidentificationMethodCodeSequence: EType.k1c
  };
}

class PatientRelationShips {
  PatientRelationShips();

  // RefererncedStudySequence - table 10-11
  //         SOP Instance Reference Macro Attributes
  // ReferencedVisitSequence - table 10-11
  // ReferencedPatientAliasSequence - table 10-11
}

class ClinicalTrialSubjectModule {
  ClinicalTrialSubjectModule();

  static const Map<int, EType> map = {
    kClinicalTrialSponsorName: EType.k1,
    kClinicalTrialProtocolID: EType.k1,
    kClinicalTrialProtocolName: EType.k2,
    kClinicalTrialSiteID: EType.k2,
    kClinicalTrialSiteName: EType.k2,
    kClinicalTrialSubjectID: EType.k1c,
    kClinicalTrialSubjectReadingID: EType.k1c,
    kClinicalTrialProtocolEthicsCommitteeName: EType.k1c,
    kClinicalTrialProtocolEthicsCommitteeApprovalNumber: EType.k1c
  };
}

class ClinicalTrialStudyModule {
  ClinicalTrialStudyModule();

  static const Map<int, EType> map = {
    kClinicalTrialTimePointID: EType.k2,
    kClinicalTrialTimePointDescription: EType.k3,
    kConsentForClinicalTrialUseSequence: EType.k3,
  };

  static const Map<int, EType> clinicalTrialUseSequence = {
    kDistributionType: EType.k1c,
    kClinicalTrialProtocolID: EType.k1c,
    kConsentForDistributionFlag: EType.k1
  };
}

class ClinicalTrialSeriesModule {
  ClinicalTrialSeriesModule();

  static const Map<int, EType> map = {
    kClinicalTrialCoordinatingCenterName: EType.k2,
    kClinicalTrialSeriesID: EType.k3,
    kClinicalTrialSeriesDescription: EType.k3,
  };

  static const Map<int, EType> clinicalTrialUseSequence = {
    kDistributionType: EType.k1c,
    kClinicalTrialProtocolID: EType.k1c,
    kConsentForDistributionFlag: EType.k1
  };
}
