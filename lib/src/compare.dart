// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Original author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

import 'package:core/core.dart';

// ignore_for_file: only_throw_errors
// ignore_for_file: public_member_api_docs

class Entry {
  int order;
  Element a;
  Element b;

  Entry(this.order, this.a, this.b);
}

class DSComparison {
  final List<Element> same = <Element>[];
  final List<Entry> diff = <Entry>[];

  DSComparison(Dataset ds0, Dataset ds1) {
    final elements0 = ds0.elements;
    final elements1 = ds1.elements;
    final length0 = elements0.length;
    final length1 = elements1.length;
    var index0 = 0;
    var index1 = 1;
    while ((index0 < length0) && (index1 < length1)) {
      final e0 = elements0.elementAt(index0);
      final e1 = elements0.elementAt(index1);
      final tag0 = e0.tag;
      final tag1 = e1.tag;
      if (tag0 == tag1) {
        compareElements(e0, e1);
        index0++;
        index1++;
        continue;
      } else if (tag0.code < tag1.code) {
        diff.add( Entry(-1, e0, null));
        index0++;
        continue;
      } else {
        diff.add( Entry(1, null, e0));
        index1++;
        continue;
      }
    }
  }

  void compareDatasets(Dataset ds0, Dataset ds1) {
    final elements0 = ds0.elements;
    final length0 = elements0.length;
    final elements1 = ds1.elements;
    final length1 = elements1.length;
    var index0 = 0;
    var index1 = 1;
    while ((index0 < length0) && (index1 < length1)) {
      final e0 = elements0[index0];
      final e1 = elements0[index1];
      final tag0 = e0.tag;
      final tag1 = e1.tag;
      if (tag0.code == tag1.code) {
        compareElements(e0, e1);
        index0++;
        index1++;
        continue;
      } else if (tag0.code < tag1.code) {
        diff.add( Entry(-1, e0, null));
        index0++;
        continue;
      } else {
        diff.add( Entry(1, null, e0));
        index1++;
        continue;
      }
    }
  }

  void compareElements(Element e0, Element e1) {
    print('Elements:\n\te0: $e0\n\te1: $e1');
    if (e0.tag != e1.tag) throw 'Incomparable Tags: $e0, $e1';
    if (e0.vrIndex != e1.vrIndex) throw 'VRs are not equivalent: $e0, $e1';
    return (e0 is SQ) ? compareSequences(e0, e1) : compareValues(e0, e1);
  }

  void compareSequences(SQ sq0, SQ sq1) {
    print('sq0: $sq0\nsq1: $sq1');
    if (sq0.items.length == sq1.items.length) {
      if (sq0.isEmpty) return same.add(sq0);
      for (var i = 0; i < sq0.items.length; i++) {
        compareItems(sq0.items.elementAt(i), sq1.items.elementAt(i));
      }
    } else if (sq0.items.length < sq1.items.length) {

    }
  }

  void compareItems(TagItem item0, TagItem item1) {
    print('item0: $item0\nitem1: $item1');
    final list0 = item0.elements;
    final list1 = item1.elements;
    print('map0: $list0\nlist1: $list1');

    if (list0.length == list1.length) {
      print('map.length:\n\t${list0.length}\n\t${list1.length}');
      if (list0.isEmpty) {
        print('zero length items: $item0, $item1');
      }
      for (var i = 0; i < list0.length; i++) {
        print('\tlist0[$i]: ${list0.elementAt(i)}');
        print('\tlist1[$i]: ${list1.elementAt(i)}');
        compareElements(list0.elementAt(i), list1.elementAt(i));
      }
    } else {
      print('Item: unequal lengths:\n\t$item0\n\t$item1');
    }

  }

  void compareValues(Element e0, Element e1) {
    print('e0: $e0\ne1: $e1');
    final v0 = e0.values;
    final v1 = e1.values;
    if (v0.length == v1.length) {
      for (var i = 0; i < v0.length; i++) {
        if (v0.elementAt(i) != v1.elementAt(i)) {
          diff.add( Entry(0, e0, e1));
          return;
        }
      }
      same.add(e0);
    } else if (v0.length < v1.length) {
      print('v0: $v0\nv1: $v1');
      diff.add( Entry(-1, e0, e1));
    } else {
      diff.add( Entry(1, e0, e1));
      print('v0: $v0\nv1: $v1');
    }
  }

}





