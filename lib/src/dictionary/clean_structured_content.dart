// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

// *** This is a generated class ***
// ----------------------------------------------------------

import 'package:core/core.dart';

import 'package:profile/src/dictionary/basic_profile.dart';

/// Clean Structured Content Option to the Basic De-Identification Profile.
class CleanStructuredContentOption extends BasicProfile {
  final String keyword;
//  final int tag;
  final VR vr;
//  final String action;

  const CleanStructuredContentOption(
      this.keyword, Tag tag, this.vr, String name,
      [Function action])
      : super(tag, name, action);

  static CleanStructuredContentOption lookup(int tag) => map[tag];

  static const CleanStructuredContentOption kAcquisitionContextSequence = const
  CleanStructuredContentOption(
      'AcquisitionContextSequence',
      PTag.kAcquisitionContextSequence,
      VR.kSQ,
      'C');

  static const CleanStructuredContentOption kContentSequence = const
  CleanStructuredContentOption(
      'ContentSequence', PTag.kContentSequence, VR.kSQ, 'C');

  static const List<int> retain = const [];

  static const List<int> remove = const [0x00400555, 0x0040a730];

  static const Map<int, CleanStructuredContentOption> map = const {
    0x00400555: kAcquisitionContextSequence,
    0x0040a730: kContentSequence
  };

  static const List<int> tags = const [0x00400555, 0x0040a730];
}
