// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> - 
// See the AUTHORS file for other contributors.

import 'package:core/element.dart';

import 'subject.dart';

class ProfileReport {
  final String name;
  final Uri url;
  final Subject subject;
  final List<int> requiredKeysConflicts = <int>[];
  final List<int> groupRetainRemoveConflicts = <int>[];
  final List<int> keyRetainRemoveConflicts = <int>[];
  final List<int> retainedGroups = <int>[];
  final List<int> removedGroups = <int>[];
  final List<Element> dummied= <Element>[];
  final List<Element> zeroed = <Element>[];
  final List<Element> removed = <Element>[];
  final List<Element> retained = <Element>[];
  final List<Element> cleaned = <Element>[];
  final List<Element> replacedUids = <Element>[];
  final List<Element> zeroedOrDummied = <Element>[];
  final List<Element> removedOrZeroed = <Element>[];
  final List<Element> removedElements = <Element>[];
  final List<Element> removedOrDummied = <Element>[];
  final List<Element> removedOrZeroedOrDummied = <Element>[];
  final List<Element> removedOrZeroedOrReplacedUid = <Element>[];
  final List<Element> blankedElements = <Element>[];
  final List<Element> replacedElements = <Element>[];
  final List<Element> addedElements = <Element>[];

  bool removedAllPrivateElements = false;
  bool removedSafePrivateElements = false;

  ProfileReport(this.name, String url, this.subject) : url = new Uri.file(url);

}