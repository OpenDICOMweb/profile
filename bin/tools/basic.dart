// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

class Basic {
  static const List<int> dummy = const <int>[
    // No reformat
    0x00401101, 0x0040a073, 0x0040a075, 0x0040a123, 0x00700001
  ];

  static const List<int> zero = const <int>[
    // No reformat
    0x00080020, 0x00080030, 0x00080050, 0x00080090, 0x00100010, 0x00100020,
    0x00100030, 0x00100040, 0x00200010, 0x00402016, 0x00402017, 0x0040a088,
    0x00700084
  ];

  static const List<int> remove = const <int>[
    // No reformat
    0x00001000, 0x00080024, 0x00080025, 0x00080034, 0x00080035, 0x00080081,
    0x00080092, 0x00080094, 0x00080096, 0x00080201, 0x00081030, 0x0008103e,
    0x00081040, 0x00081048, 0x00081049, 0x00081050, 0x00081052, 0x00081060,
    0x00081062, 0x00081080, 0x00081084, 0x00081120, 0x00082111, 0x00084000,
    0x00100021, 0x00100032, 0x00100050, 0x00100101, 0x00100102, 0x00101000,
    0x00101001, 0x00101002, 0x00101005, 0x00101010, 0x00101020, 0x00101030,
    0x00101040, 0x00101050, 0x00101060, 0x00101080, 0x00101081, 0x00101090,
    0x00102000, 0x00102110, 0x00102150, 0x00102152, 0x00102154, 0x00102160,
    0x00102180, 0x001021a0, 0x001021b0, 0x001021c0, 0x001021d0, 0x001021f0,
    0x00102297, 0x00102299, 0x00104000, 0x00181004, 0x00181005, 0x00181007,
    0x00181008, 0x00184000, 0x00189424, 0x0018a003, 0x00203401, 0x00203404,
    0x00203406, 0x00204000, 0x00209158, 0x00284000, 0x00320012, 0x00321020,
    0x00321021, 0x00321030, 0x00321032, 0x00321033, 0x00321070, 0x00324000,
    0x00380004, 0x00380010, 0x00380011, 0x0038001e, 0x00380020, 0x00380021,
    0x00380040, 0x00380050, 0x00380060, 0x00380061, 0x00380062, 0x00380300,
    0x00380400, 0x00380500, 0x00384000, 0x00400001, 0x00400002, 0x00400003,
    0x00400004, 0x00400005, 0x00400006, 0x00400007, 0x0040000b, 0x00400010,
    0x00400011, 0x00400012, 0x00400241, 0x00400242, 0x00400243, 0x00400244,
    0x00400245, 0x00400250, 0x00400251, 0x00400253, 0x00400254, 0x00400275,
    0x00400280, 0x00400555, 0x00401001, 0x00401004, 0x00401005, 0x00401010,
    0x00401011, 0x00401102, 0x00401103, 0x00401400, 0x00402001, 0x00402008,
    0x00402009, 0x00402010, 0x00402400, 0x00403001, 0x00404025, 0x00404027,
    0x00404028, 0x00404030, 0x00404034, 0x00404035, 0x00404036, 0x00404037,
    0x0040a027, 0x0040a078, 0x0040a07a, 0x0040a07c, 0x0040a730, 0x00700086,
    0x00880200, 0x00880904, 0x00880906, 0x00880910, 0x00880912, 0x04000100,
    0x04000402, 0x04000403, 0x04000404, 0x04000550, 0x04000561, 0x20300020,
    0x40000010, 0x40004000, 0x40080042, 0x40080102, 0x4008010a, 0x4008010b,
    0x4008010c, 0x40080111, 0x40080114, 0x40080115, 0x40080118, 0x40080119,
    0x4008011a, 0x40080202, 0x40080300, 0x40084000, 0xfffafffa, 0xfffcfffc
  ];

  static const List<int> keep = const <int>[];

  static const List<int> clean = const <int>[];

  static const List<int> replaceUid = const <int>[
    // No reformat
    0x00001001, 0x00020003, 0x00041511, 0x00080014, 0x00080018, 0x00080058,
    0x0008010d, 0x00081155, 0x00081195, 0x00083010, 0x00089123, 0x00181002,
    0x0020000d, 0x0020000e, 0x00200052, 0x00200200, 0x00209161, 0x00209164,
    0x00281199, 0x00281214, 0x00404023, 0x0040a124, 0x0040db0c, 0x0040db0d,
    0x0070031a, 0x00880140, 0x30060024, 0x300600c2, 0x300a0013
  ];

  static const List<int> zeroOrDummy = const <int>[];

  static const List<int> removeOrZero = const <int>[];

  static const List<int> removeOrDummy = const <int>[
    // No reformat
    0x00080021, 0x00080022, 0x00080023, 0x0008002a, 0x00080031, 0x00080032,
    0x00080033, 0x00081072, 0x00081110, 0x00102203, 0x00180010, 0x00181030,
    0x00181400, 0x0018700a, 0x00321060, 0x300e0008
  ];

  static const List<int> removeOrZeroOrDummy = const <int>[
    // No reformat
    0x00080080, 0x00080082, 0x00081010, 0x00081070, 0x00081111, 0x00181000
  ];

  static const List<int> removeOrZeroOrReplaceUid = const <int>[
    // No reformat
    0x00081140, 0x00082112
  ];
}
