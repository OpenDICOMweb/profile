// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.
//

// ignore_for_file: public_member_api_docs

abstract class Profile {
  bool get removeAllPrivate => false; // TODO: is this the right default?
  bool get retainSafePrivate => true; // TODO: is this the right default?
  bool get removeAllCurves => true;
  bool get removeAllOverlays => true;
  List<int> get requiredKeys;
  List<int> get groupsToRetain;
  List<int> get groupsToDelete;
  List<int> get keysToDummy;
  List<int> get keysToZero;
  List<int> get keysToDelete;

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
