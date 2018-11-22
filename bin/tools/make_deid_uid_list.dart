// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Original author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.
//
import 'package:core/server.dart';

void main() {
  final dummy = <int>[];
  final zero = <int>[];
  final remove = <int>[];
  final keep = <int>[];
  final clean = <int>[];
  final replaceUid = <int>[];
  final zeroOrDummy = <int>[];
  final removeOrZero = <int>[];
  final removeOrDummy = <int>[];
  final removeOrZeroOrDummy = <int>[];
  final removeOrZeroOrReplaceUid = <int>[];

  for (var v in BasicProfile.map.values) {
    switch (v.name) {
      case 'D':
        dummy.add(v.tag.code);
        break;
      case 'Z':
        zero.add(v.tag.code);
        break;
      case 'X':
        remove.add(v.tag.code);
        break;
      case 'K':
        keep.add(v.tag.code);
        break;
      case 'C':
        clean.add(v.tag.code);
        break;
      case 'U':
        replaceUid.add(v.tag.code);
        break;
      case 'ZD':
        zeroOrDummy.add(v.tag.code);
        break;
      case 'XZ':
        removeOrZero.add(v.tag.code);
        break;
      case 'XD':
        removeOrDummy.add(v.tag.code);
        break;
      case 'XZD':
        removeOrZeroOrDummy.add(v.tag.code);
        break;
      case 'XZU':
        removeOrZeroOrReplaceUid.add(v.tag.code);
        break;
      default:
        throw 'Invalid Type: ${v.name}: $v';
    }
  }

  var out = makeHeader('Basic');
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
  final header = '''// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

class $id {

 
''';

return header;

}
String makeList(String id, List<int> pList) {
  if (pList.isEmpty)  return '''\n
  static const List<int> $id = const<int>[];\n\n''';

  var out = '''
  static const List<int> $id = const<int>[  
    // No reformat  
    ''';


//  print('pList length: ${pList.length}');
  final codes = <String>[];
  for (var n in pList) {
    codes.add(hex32(n));
  }
  final lines = <String>[];
  for(var i = 0; i < codes.length; i += 6) {
    final line = <String>[];
    for (var j = 0; j < 6; j++) {
      final index = j + i;
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
