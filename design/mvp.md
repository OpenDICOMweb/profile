# Minimally Viable Product

A browser based app to read, validate, profile (including
de-identification) a DICOM Study and then write the profiled study to a
new location.

Before writing the tool shows the differences between the two files.
Differences, by default, desplayed as follows:

* No Change: normal color

* Error: Red - indicates missing tags or tags that should have been
  de-identified.

* Yellow: highlight changed DE or changed values of DE.
* Black: deleted DE

The current product uses the Data Element Table in PS3.6 for DICOM
validation.

## TODO

* Replace UIDs

* Patient Identity Removed (0012,0062),
* De-identification Method (0012,0063),
* De-identification Method Code Sequence (0012,0064) and
* Burned In Annotation (0028,0301). YES, NO, UNKNOWN

* The Attribute Burned In Annotation (0028,0301) shall be added to the
  Dataset with a value of "NO".

* Add De-identification Method and other Elements

* Look for clean pixel data attribute

* Add secure hash

* Create Original Attribute sequence

* Encrypted Attribute Sequencee

* Allow Original Attributes to be Encrypted

* Implement Safe Private

    * Create a method to add Safe Private
    * Create a method to remove Safe Private

* De-Identify the whole study not just SOP Instance

    *

## Enhancements

1. Use IOD Conformance Profiles to validate the DICOM

2. Allow Sequences and Private Groups to be collapsed or expanded. By
   default if there is a change they are expanded; otherwise, collapsed.

3. Add IELevel and DEType to DETable starting with the Common Modules:
   patient, clinical trial, study, equipment, series, instance.