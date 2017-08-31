// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Original author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

import 'dart:convert';
import 'dart:io';

import 'package:profile/profile.dart';

void main() {
  const path = 'C:/odw/sdk/profile/submission_set.json';

  File file = new File(path);
  var source = file.readAsStringSync();
  Map<String, List<Map<String, String>>> submissionSet = JSON.decode(source);

  List<Map<String, String>> sets = submissionSet["submissionSets"];
  print('${sets.runtimeType} length: ${sets.length}');

//  countSubmissionSet(sets);
  SubjectDB subjects = parseSubmissionSet(sets);
//  for (int i = 0; i < subjects.length; i++) print('[$i]: ${subjects[i].json}');
  print('${subjects.json}');

  File outFile = new File('C:/odw/sdk/profile/lib/data/submission_set.json');
  outFile.writeAsStringSync(subjects.json);
}

SubjectDB parseSubmissionSet(List<Map<String, String>> sets) {
  List<Subject> subjects = <Subject>[];
  int i = 0;
  for (Map set in sets) {
    i++;
//     print('$i set: $set');
    Subject subject = makeSubject(i, set);
//    print('Subject: $subject');
    subjects.add(subject);
  }
//  print('Subject Count: ${subjects.length}');
  return new SubjectDB(subjects);
}

Subject makeSubject(int index, Map data) {
  var name = data["Patient Name"];
  var id = data["Patient ID"];
  var accession = data["Accession Number"];
  var studyDate = data["Study Date"];
  List pList = data["parameters"];
  Map subjectMap = pList[0];
  var parameters = makeParameters(index, subjectMap);
  return new Subject(name, id, accession, studyDate, parameters);
}

Parameters makeParameters(int index, Map map) {
  int caseNumber = index;
  String enrollmentDate = map["Enrollment Date"];
  String trialNumber = map["Trial Number"];
  String trialName = map["Trial Name"];
  String siteNumber = map["Site Number"];
  String siteName = map["Site Name"];
  String timepointID = map["Timepoint ID"];
  String timepointDescription = map["Timepoint Description"];
  String submissionType = map["Submission Type"];
  String additionalTrialInput = map["Additional Trial Input"];
  String anonymizationProfile = map["Anonymization Profile"];
  String validationProfile = map["Validation Profile"];
  String user = map["User"];

  return new Parameters(
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

void countSubmissionSet(List<Map<String, String>> sets) {
  Map<String, int> toplevel = <String, int>{};
  Map<String, int> parameters = <String, int>{};

  for (Map set in sets) {
    set.forEach((key, value) {
      if (key == "parameters") {
        for (String s in value[0].keys) {
          if (parameters[s] == null) {
            parameters[s] = 1;
          } else {
            int count = parameters[s];
            count++;
            parameters[s] = count;
          }
        }
      } else {
        if (toplevel[key] == null) {
          toplevel[key] = 1;
        } else {
          int count = toplevel[key];
          count++;
          toplevel[key] = count;
        }
      }
    });
  }
  print('toplevel: $toplevel');
  print('parameters: $parameters');
}
