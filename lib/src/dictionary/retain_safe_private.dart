// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

import 'package:core/core.dart';

// ignore_for_file: type_annotate_public_apis
// ignore_for_file: public_member_api_docs

// *** This is a generated class ***
// ----------------------------------------------------------

// TODO: finish.
// Retain Safe Private Option (a DICOM de-identification aption).
class RetainSafePrivateOption {
  final String keyword;
  final int tag;
  final VR vr;
  final String action;

  const RetainSafePrivateOption(this.keyword, this.tag, this.vr, this.action);

  static RetainSafePrivateOption lookup(int tag) => map[tag];

  static const List<int> retain = [];

  static const List<int> remove = [];

  static const Map<int, RetainSafePrivateOption> map = {};

  static const List<int> tags = [];
}
