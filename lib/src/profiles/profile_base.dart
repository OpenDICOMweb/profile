// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> - 
// See the AUTHORS file for other contributors.

import 'package:core/element.dart';

typedef Element _Updater(Element element);

abstract class Profile {
  bool get removeAllPrivate;
  bool get retainSafePrivate;
  List<int> get requiredKeys;
  List<int> get groupsToRetain;
  List<int> get groupsToRemove;
  List<int> get keysToDummy;
  List<int> get keysToZero;
  List<int> get keysToRemove;

  List<int> get keysToRetain;
  List<int> get keysToClean;
  List<int> get keysToReplaceUid;
  List<int> get keysToZeroOrDummy;
  List<int> get keysToRemoveOrZero;
  List<int> get keysToRemoveOrDummy;
  List<int> get keysToRemoveOrZeroOrDummy;
  List<int> get keysToRemoveOrZeroOrReplaceUid;
//  Map<int, _Updater> get keysToReplace;
//  Map<int, _Updater> get keysToAdd;
}

/*
class DeIdentify implements ProfileBase {
  final bool removeAllPrivate;
  final bool retainSafePrivate;
  final List<int> requiredKeys;
  final List<int> groupsToRetain;
  final List<int> groupsToRemove;
  final List<int> keysToRetain;
  final List<int> keysToRemove;
  final List<int> keysToNoValues;
  final List<int> keysToBlank;
  final List<int> keysToHash;
  final Map<int, _Updater> keysToReplace;
  final Map<int, _Updater> keysToAdd;
}
*/
