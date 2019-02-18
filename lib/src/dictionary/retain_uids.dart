// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

import 'package:core/core.dart';

// ignore_for_file: type_annotate_public_apis

// *** This is a generated class ***
// ----------------------------------------------------------

// ignore_for_file: public_member_api_docs

// Retail UIDs Option (a DICOM de-identification option)
class RetainUidsOption {
  final String keyword;
  final int tag;
  final VR vr;
  final String action;

  const RetainUidsOption(this.keyword, this.tag, this.vr, this.action);

  static RetainUidsOption lookup(int tag) => map[tag];

  static const kAffectedSOPInstanceUID =
      RetainUidsOption('AffectedSOPInstanceUID', 0x00001000, VR.kUI, 'K');
  static const kRequestedSOPInstanceUID =
      RetainUidsOption('RequestedSOPInstanceUID', 0x00001001, VR.kUI, 'K');
  static const kMediaStorageSOPInstanceUID =
      RetainUidsOption('MediaStorageSOPInstanceUID', 0x00020003, VR.kUI, 'K');
  static const kReferencedSOPInstanceUIDinFile = RetainUidsOption(
      'ReferencedSOPInstanceUIDinFile', 0x00041511, VR.kUI, 'K');
  static const kInstanceCreatorUID =
      RetainUidsOption('InstanceCreatorUID', 0x00080014, VR.kUI, 'K');
  static const kSOPInstanceUID =
      RetainUidsOption('SOPInstanceUID', 0x00080018, VR.kUI, 'K');
  static const kFailedSOPInstanceUIDList =
      RetainUidsOption('FailedSOPInstanceUIDList', 0x00080058, VR.kUI, 'K');
  static const kContextGroupExtensionCreatorUID = RetainUidsOption(
      'ContextGroupExtensionCreatorUID', 0x0008010d, VR.kUI, 'K');
  static const kReferencedStudySequence =
      RetainUidsOption('ReferencedStudySequence', 0x00081110, VR.kSQ, 'K');
  static const kReferencedPerformedProcedureStepSequence = RetainUidsOption(
      'ReferencedPerformedProcedureStepSequence', 0x00081111, VR.kSQ, 'K');
  static const kReferencedPatientSequence =
      RetainUidsOption('ReferencedPatientSequence', 0x00081120, VR.kSQ, 'X');
  static const kReferencedImageSequence =
      RetainUidsOption('ReferencedImageSequence', 0x00081140, VR.kSQ, 'K');
  static const kReferencedSOPInstanceUID =
      RetainUidsOption('ReferencedSOPInstanceUID', 0x00081155, VR.kUI, 'K');
  static const kTransactionUID =
      RetainUidsOption('TransactionUID', 0x00081195, VR.kUI, 'K');
  static const kSourceImageSequence =
      RetainUidsOption('SourceImageSequence', 0x00082112, VR.kSQ, 'K');
  static const kIrradiationEventUID =
      RetainUidsOption('IrradiationEventUID', 0x00083010, VR.kUI, 'K');
  static const kCreatorVersionUID =
      RetainUidsOption('CreatorVersionUID', 0x00089123, VR.kUI, 'K');
  static const kDeviceUID =
      RetainUidsOption('DeviceUID', 0x00181002, VR.kUI, 'K');
  static const kStudyInstanceUID =
      RetainUidsOption('StudyInstanceUID', 0x0020000d, VR.kUI, 'K');
  static const kSeriesInstanceUID =
      RetainUidsOption('SeriesInstanceUID', 0x0020000e, VR.kUI, 'K');
  static const kFrameofReferenceUID =
      RetainUidsOption('FrameofReferenceUID', 0x00200052, VR.kUI, 'K');
  static const kSynchronizationFrameofReferenceUID = RetainUidsOption(
      'SynchronizationFrameofReferenceUID', 0x00200200, VR.kUI, 'K');
  static const kConcatenationUID =
      RetainUidsOption('ConcatenationUID', 0x00209161, VR.kUI, 'K');
  static const kDimensionOrganizationUID =
      RetainUidsOption('DimensionOrganizationUID', 0x00209164, VR.kUI, 'K');
  static const kPaletteColorLookupTableUID =
      RetainUidsOption('PaletteColorLookupTableUID', 0x00281199, VR.kUI, 'K');
  static const kLargePaletteColorLookupTableUID = RetainUidsOption(
      'LargePaletteColorLookupTableUID', 0x00281214, VR.kUI, 'K');
  static const kReferencedGeneralPurposeScheduledProcedureStepTransactionUID =
      RetainUidsOption(
          'ReferencedGeneralPurposeScheduledProcedureStepTransactionUID',
          0x00404023,
          VR.kUI,
          'K');
  static const kTemplateExtensionOrganizationUID = RetainUidsOption(
      'TemplateExtensionOrganizationUID', 0x0040db0c, VR.kUI, 'K');
  static const kTemplateExtensionCreatorUID =
      RetainUidsOption('TemplateExtensionCreatorUID', 0x0040db0d, VR.kUI, 'K');
  static const kFiducialUID =
      RetainUidsOption('FiducialUID', 0x0070031a, VR.kUI, 'K');
  static const kStorageMediaFileSetUID =
      RetainUidsOption('StorageMediaFile_setUID', 0x00880140, VR.kUI, 'K');
  static const kReferencedFrameofReferenceUID = RetainUidsOption(
      'ReferencedFrameofReferenceUID', 0x30060024, VR.kUI, 'K');
  static const kRelatedFrameofReferenceUID =
      RetainUidsOption('RelatedFrameofReferenceUID', 0x300600c2, VR.kUI, 'K');
  static const kDoseReferenceUID =
      RetainUidsOption('DoseReferenceUID', 0x300a0013, VR.kUI, 'K');

  static const List<int> retain = [
    0x00001000,
    0x00001001,
    0x00020003,
    0x00041511,
    0x00080014,
    0x00080018,
    0x00080058,
    0x0008010d,
    0x00081110,
    0x00081111,
    0x00081140,
    0x00081155,
    0x00081195,
    0x00082112,
    0x00083010,
    0x00089123,
    0x00181002,
    0x0020000d,
    0x0020000e,
    0x00200052,
    0x00200200,
    0x00209161,
    0x00209164,
    0x00281199,
    0x00281214,
    0x00404023,
    0x0040db0c,
    0x0040db0d,
    0x0070031a,
    0x00880140,
    0x30060024,
    0x300600c2,
    0x300a0013
  ];

  static const List<int> remove = [0x00081120];

  static const Map<int, RetainUidsOption> map = {
    0x00001000: kAffectedSOPInstanceUID,
    0x00001001: kRequestedSOPInstanceUID,
    0x00020003: kMediaStorageSOPInstanceUID,
    0x00041511: kReferencedSOPInstanceUIDinFile,
    0x00080014: kInstanceCreatorUID,
    0x00080018: kSOPInstanceUID,
    0x00080058: kFailedSOPInstanceUIDList,
    0x0008010d: kContextGroupExtensionCreatorUID,
    0x00081110: kReferencedStudySequence,
    0x00081111: kReferencedPerformedProcedureStepSequence,
    0x00081120: kReferencedPatientSequence,
    0x00081140: kReferencedImageSequence,
    0x00081155: kReferencedSOPInstanceUID,
    0x00081195: kTransactionUID,
    0x00082112: kSourceImageSequence,
    0x00083010: kIrradiationEventUID,
    0x00089123: kCreatorVersionUID,
    0x00181002: kDeviceUID,
    0x0020000d: kStudyInstanceUID,
    0x0020000e: kSeriesInstanceUID,
    0x00200052: kFrameofReferenceUID,
    0x00200200: kSynchronizationFrameofReferenceUID,
    0x00209161: kConcatenationUID,
    0x00209164: kDimensionOrganizationUID,
    0x00281199: kPaletteColorLookupTableUID,
    0x00281214: kLargePaletteColorLookupTableUID,
    0x00404023: kReferencedGeneralPurposeScheduledProcedureStepTransactionUID,
    0x0040db0c: kTemplateExtensionOrganizationUID,
    0x0040db0d: kTemplateExtensionCreatorUID,
    0x0070031a: kFiducialUID,
    0x00880140: kStorageMediaFileSetUID,
    0x30060024: kReferencedFrameofReferenceUID,
    0x300600c2: kRelatedFrameofReferenceUID,
    0x300a0013: kDoseReferenceUID
  };

  static const List<int> tags = [
    0x00001000,
    0x00001001,
    0x00020003,
    0x00041511,
    0x00080014,
    0x00080018,
    0x00080058,
    0x0008010d,
    0x00081110,
    0x00081111,
    0x00081120,
    0x00081140,
    0x00081155,
    0x00081195,
    0x00082112,
    0x00083010,
    0x00089123,
    0x00181002,
    0x0020000d,
    0x0020000e,
    0x00200052,
    0x00200200,
    0x00209161,
    0x00209164,
    0x00281199,
    0x00281214,
    0x00404023,
    0x0040db0c,
    0x0040db0d,
    0x0070031a,
    0x00880140,
    0x30060024,
    0x300600c2,
    0x300a0013
  ];
}
