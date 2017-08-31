// Copyright (c) 2016, Open DICOMweb Project. All rights reserved.
// Use of this source code is governed by the open source license
// that can be found in the LICENSE file.
// Author: Jim Philbin <jfphilbin@gmail.edu> -
// See the AUTHORS file for other contributors.

class SubjectDB {
  final List<Subject> db;

  SubjectDB(List<Subject> subjects) : db = new List.from(subjects, growable: false);

  Subject operator [](int i) => db[i];

  int get length => db.length;

  String get json {
    var out = '[\n';
    List<String> sList = <String>[];
    for(int i = 0; i < length; i++) sList.add(db[i].json);
    out += sList.join(',\n');
    return out += '\n]\n';
  }
}

class Subject {
  final String name;
  final String id;
  final String accession;
  final String studyDate;
  final Parameters parameters;

  Subject(this.name, this.id, this.accession, this.studyDate, this.parameters);

//  String operator [](String name)  => parameters[name];
  String get info => '''
    Patient Name: "$name"
      Patient ID: "$id"
Accession Number: "$accession"
      Study Date: "$studyDate"
      Parameters: ${parameters.info}
''';

  String get json => '''  {
  "Patient Name": "$name",
  "Patient ID": "$id",
  "Accession Number": "$accession",
  "Study Date": "$studyDate",
  "Parameters": ${parameters.json}
  }''';



  @override
  String toString() => 'name:"$name", id:"$id", date:"$studyDate", '
      'case: ${parameters.caseNumber}';
}

class Parameters {
  final int caseNumber;
  final String enrollmentDate;
  final String trialNumber;
  final String trialName;
  final String siteNumber;
  final String siteName;
  final String timepointID;
  final String timepointDescription;
  final String submissionType;
  final String additionalTrialInput;
  final String anonymizationProfile;
  final String validationProfile;
  final String user;

  Parameters(
      this.caseNumber,
      this.enrollmentDate,
      this.trialNumber,
      this.trialName,
      this.siteNumber,
      this.siteName,
      this.timepointID,
      this.timepointDescription,
      this.submissionType,
      this.additionalTrialInput,
      this.anonymizationProfile,
      this.validationProfile,
      this.user);

  String get info => '''
  
           Case Number: $caseNumber,
       Enrollment Date: "$enrollmentDate",
          Trial Number: "$trialNumber",
            Trial Name: "$trialName",
           Site Number: "$siteNumber",
             Site Name: "$siteName",
         Time Point ID: "$timepointID",
Time Point Description: "$timepointDescription",
       Submission Type: "$submissionType",
Additional Trial Input: "$additionalTrialInput",
 Anonymization Profile: "$anonymizationProfile",
    Validation Profile: "$validationProfile",
                  User: "$user"
''';

  String get json => '''    {
    "Case Number": $caseNumber,
    "Enrollment Date": "$enrollmentDate",
    "Trial Number": "$trialNumber",
    "Trial Name": "$trialName",
    "Site Number": "$siteNumber",
    "Site Name": "$siteName",
    "Time Point ID": "$timepointID",
    "Time Point Description": "$timepointDescription",
    "Submission Type": "$submissionType",
    "Additional Trial Input": "$additionalTrialInput",
    "Anonymization Profile": "$anonymizationProfile",
    "Validation Profile": "$validationProfile",
    "User": "$user"
    }''';

  @override
  String toString() => '$runtimeType: Case Number: $caseNumber';
}
