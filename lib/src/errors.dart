// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> - 
// See the AUTHORS file for other contributors.

import 'package:system/system.dart';


class RetainedElementError<K> extends Error {
  K key;

  RetainedElementError(this.key);

  @override
  String toString() => _msg(key);

  static String _msg(dynamic key) =>
      'Attempt to delete a Retained Element with key($key)';
}

Null retainedElementError(dynamic key) {
  log.error(RetainedElementError._msg(key));
  if (throwOnError) throw new RetainedElementError(key);
  return null;
}