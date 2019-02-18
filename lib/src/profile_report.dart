// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.
//
import 'package:core/core.dart';

import 'subject.dart';

// ignore_for_file: public_member_api_docs

class ProfileReport {
  final String name;
  final Uri url;
  final TrialSubject subject;
  final List<int> requiredKeysConflicts = <int>[];
  final List<int> groupRetainDeleteConflicts = <int>[];
  final List<int> keyRetainDeleteConflicts = <int>[];
  final List<int> retainedGroups = <int>[];
  final List<int> deletedGroups = <int>[];
  final List<Element> dummied= <Element>[];
  final List<Element> zeroed = <Element>[];
  final List<Element> deleted = <Element>[];
  final List<Element> retained = <Element>[];
  final List<Element> cleaned = <Element>[];
  final List<Element> replacedUids = <Element>[];
  final List<Element> zeroedOrDummied = <Element>[];
  final List<Element> deletedOrZeroed = <Element>[];
  final List<Element> deletedElements = <Element>[];
  final List<Element> deletedOrDummied = <Element>[];
  final List<Element> deletedOrZeroedOrDummied = <Element>[];
  final List<Element> deletedOrZeroedOrReplacedUid = <Element>[];
  final List<Element> blankedElements = <Element>[];
  final List<Element> replacedElements = <Element>[];
  final List<Element> addedElements = <Element>[];

  bool deletedAllPrivateElements = false;
  bool deletedSafePrivateElements = false;

  ProfileReport(this.name, String url, this.subject) : url =  Uri.file(url);

}
