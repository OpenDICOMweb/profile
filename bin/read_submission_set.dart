// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Original author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.
//
import 'dart:convert' as cvt;
import 'dart:io';

import 'package:core/server.dart';
import 'package:profile/profiler.dart';

void main() {
  const path = 'C:/odw/sdk/profile/submission_set.json';

  final file =  File(path);
  final source = file.readAsStringSync();
  final Map<String, List<Map<String, String>>> submissionSet =
      cvt.json.decode(source);

  final sets = submissionSet['submissionSets'];
  print('${sets.runtimeType} length: ${sets.length}');

//  countSubmissionSet(sets);
  final subjects = parseSubmissionSet(sets);
  print('${subjects.json}');

   File('C:/odw/sdk/profile/lib/data/submission_set.json')
    .writeAsStringSync(subjects.json);
}

SubjectDB parseSubmissionSet(List<Map<String, String>> sets) {
  final subjects = <TrialSubject>[];
  var i = 0;
  for (Map set in sets) {
    i++;
    final subject = makeSubject(i, set);
    subjects.add(subject);
  }
  return  SubjectDB(subjects);
}

TrialSubject makeSubject(int index, Map<String, Object> data) {
  final name = data['Patient Name'];
  final id = data['Patient ID'];
  final enrollmentDate = Date.parse('Enrollment Date');
  final accession = data['Accession Number'];
  final studyDate = data['Study Date'];
  final Map<String, Object> pList = data['parameters'];
  final subjectMap = pList[0];
  final parameters = makeParameters(index, subjectMap);
  return  TrialSubject(
      name, id, '$enrollmentDate', accession, studyDate, parameters);
}

Parameters makeParameters(int index, Map<String, String> map) {
  final caseNumber = index;
  final enrollmentDate = map['Enrollment Date'];
  final trialNumber = map['Trial Number'];
  final trialName = map['Trial Name'];
  final siteNumber = map['Site Number'];
  final siteName = map['Site Name'];
  final timepointID = map['Timepoint ID'];
  final timepointDescription = map['Timepoint Description'];
  final submissionType = map['Submission Type'];
  final additionalTrialInput = map['Additional Trial Input'];
  final anonymizationProfile = map['Anonymization Profile'];
  final validationProfile = map['Validation Profile'];
  final user = map['User'];

  return  Parameters(
      caseNumber,
      enrollmentDate,
      trialNumber,
      trialName,
      siteNumber,
      siteName,
      timepointID,
      timepointDescription,
      submissionType,
      additionalTrialInput,
      anonymizationProfile,
      validationProfile,
      user);
}

void countSubmissionSet(List<Map<String, List>> sets) {
  final toplevel = <String, int>{};
  final parameters = <String, int>{};

  for (var set in sets) {
    set.forEach((key, value) {
      if (key == 'parameters') {
        for (String s in value[0].keys) {
          if (parameters[s] == null) {
            parameters[s] = 1;
          } else {
            var count = parameters[s];
            count++;
            parameters[s] = count;
          }
        }
      } else {
        if (toplevel[key] == null) {
          toplevel[key] = 1;
        } else {
          var count = toplevel[key];
          count++;
          toplevel[key] = count;
        }
      }
    });
  }
  print('toplevel: $toplevel');
  print('parameters: $parameters');
}
