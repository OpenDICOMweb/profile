// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Original author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.
//
import 'package:core/core.dart';
import 'package:profile/src/dictionary/action.dart';

// ignore_for_file: public_member_api_docs

//TODO: add the ability to do this.
/// Clean Pixel Data Option to the Basic De-Identification Profile.
class CleanPixelData {
  final int tag;
  final String keyword;
  final Action action;

  CleanPixelData(this.tag, this.keyword, this.action);

  bool call(Dataset ds,
      {bool removePixelDataFlag = false,
      bool removeIconPixelDataFlag = false,
      bool removeFloatPixelDataFlag = false,
      bool removeDoubleFloatPixelDataFlag = false}) {
    final a = ds[PTag.kBurnedInAnnotation.code];
    if ((a != null) && (a.value == 'NO')) return true;
    if (removeIconPixelDataFlag) removeIconPixelData(ds);
    if (removeFloatPixelDataFlag) ds.remove(kFloatPixelData);
    if (removeDoubleFloatPixelDataFlag) ds.remove(kDoubleFloatPixelData);
    return false;
  }

  bool removeIconPixelData(Dataset ds) =>
      //TODO: implement
      false;

  static final CleanPixelData kAttributeBurnedInAnnotation =
      CleanPixelData(0x00280301, 'Attribute Burned In Annotation', Action.kA);
}

//TODO: doc
///Clean Recognizable Visual Features Options
class CleanRecognizableVisualFeaturesOptions {
  final int tag;
  final String keyword;
  final Action action;

  const CleanRecognizableVisualFeaturesOptions(
      this.tag, this.keyword, this.action);

  static const CleanRecognizableVisualFeaturesOptions
      kAttributeBurnedInAnnotation = CleanRecognizableVisualFeaturesOptions(
          0x00280301, 'Attribute Burned In Annotation', Action.kA);
}
