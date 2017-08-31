// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Original author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

import 'package:system/system.dart';

import 'package:tag/tag.dart';

import 'basic_profile.dart';

void main() {
  List<int> dummy = <int>[];
  List<int> zero = <int>[];
  List<int> remove = <int>[];
  List<int> keep = <int>[];
  List<int> clean = <int>[];
  List<int> replaceUid = <int>[];
  List<int> zeroOrDummy = <int>[];
  List<int> removeOrZero = <int>[];
  List<int> removeOrDummy = <int>[];
  List<int> removeOrZeroOrDummy = <int>[];
  List<int> removeOrZeroOrReplaceUid = <int>[];

  for (BasicProfile v in BasicProfile.map.values) {
    switch (v.type) {
      case "D":
        dummy.add(v.tag.code);
        break;
      case "Z":
        zero.add(v.tag.code);
        break;
      case "X":
        remove.add(v.tag.code);
        break;
      case "K":
        keep.add(v.tag.code);
        break;
      case "C":
        clean.add(v.tag.code);
        break;
      case "U":
        replaceUid.add(v.tag.code);
        break;
      case "ZD":
        zeroOrDummy.add(v.tag.code);
        break;
      case "XZ":
        removeOrZero.add(v.tag.code);
        break;
      case "XD":
        removeOrDummy.add(v.tag.code);
        break;
      case "XZD":
        removeOrZeroOrDummy.add(v.tag.code);
        break;
      case "XZU":
        removeOrZeroOrReplaceUid.add(v.tag.code);
        break;
      default:
        throw 'Invalid Type: ${v.type}: $v';
    }
  }

  String out = makeHeader('Basic');
  out +=  makeList('dummy', dummy);

  out +=  makeList('zero', zero);

  out +=  makeList('remove', remove);

  out +=  makeList('keep', keep);

  out +=  makeList('clean', clean);

  out +=  makeList('replaceUid', replaceUid);

  out +=  makeList('zeroOrDummy', zeroOrDummy);

  out +=  makeList('removeOrZero', removeOrZero);

  out +=  makeList('removeOrDummy', removeOrDummy);

  out +=  makeList('removeOrZeroOrDummy', removeOrZeroOrDummy);

  out +=  makeList('removeOrZeroOrReplaceUid', removeOrZeroOrReplaceUid);

 out += '\n}\n';
  print(out);
}

String makeHeader(String id) {
  var header = '''// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

class $id {

 
''';

return header;

}
String makeList(String id, List<int> pList) {
  if (pList.length == 0)  return '''\n
  static const List<int> $id = const<int>[];\n\n''';

  var out = '''
  static const List<int> $id = const<int>[  
    // No reformat  
    ''';


//  print('pList length: ${pList.length}');
  List<String> codes = <String>[];
  for (int n in pList) {
    codes.add(hex32(n));
  }
  List<String> lines = [];
  for(int i = 0; i < codes.length; i += 6) {
    List<String> line = [];
    for (int j = 0; j < 6; j++) {
      int index = j + i;
      if (index >= codes.length) break;
      line.add(codes[i + j]);
    }
    lines.add(line.join(', '));
    if (i == codes.length) break;
  }
  out += lines.join(',\n    ');
  out += '  \n  ];\n\n';
  return out;
}
