// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

import 'package:core/core.dart';

// *** This is a generated class ***
// ----------------------------------------------------------

/// Clean Graphics Option to the Basic De-Identification Profile.
class CleanGraphicsOption {
  final String keyword;
  final int tag;
  final VR vr;
  final String action;

  const CleanGraphicsOption(this.keyword, this.tag, this.vr, this.action);

  static CleanGraphicsOption lookup(int tag) => map[tag];

  static const CleanGraphicsOption kGraphicAnnotationSequence =
      const CleanGraphicsOption('GraphicAnnotationSequence', 0x00700001, VR.kSQ, 'C');

  static const List<int> retain = const [];

  static const List<int> remove = const [0x00700001];

  static const Map<int, CleanGraphicsOption> map = const {
    0x00700001: kGraphicAnnotationSequence
  };

  static const List<int> tags = const [0x00700001];
}
