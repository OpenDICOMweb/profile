# ODW Profiles

A _Profile_ is an Object that when applied to a DICOM dataset, returns either, 1) a new Dataset that conforms to the Profile, or 2) an Error Dataset that documents errors, warnings and informational messages about the original Dataset.

    profiledDS = profile(ds)

## Profile Structure

Each Profile contains the following information:

### Trial Information

### Subject Information

### Global Values

Remove Private Elements

Retain Safe Private Elements

### Group Lists

- A Retained Group List, which contains a list of Group Numbers (a 16-bit integer) that must be copied to the Profiled Dataset w/o modification. Note: _All  Elements in a Retailed Group, must be present in the Profiled Dataset._

- A Removed Group List, which contains list of Group Numbers (a 16-bit integer) that must NOT be copied to the Profiled Dataset.  Note: _All  Elements in a Removed Group, must be absent in the Profiled Dataset._

### Element Lists

- A _Retained Element List_, which contains list of Element Identifiers (either a 32-bit unsigned integer or a String) that identifies Elements that must be copied to the Profiled Dataset w/o modification. Note: _A Retained Element may be in a Retailed Group, but it is a best practice to not include them._

- A _Removed Element List_, which contains list of Element Identifiers (either 32-bit integers or a String) that must be copied to the Profiled Dataset w/o modification. Note: _If an Element Identifier appears in the RetailList, then it must not appear in the RemoveList, and vice versa._

- An _Update Map_ containing identifier/updater pairs. The _identifier_ is a DICOM identifier for an element, which if present in the original Dataset, will have a corresponding modified element in the Profiled Dataset. The _original_ element is modified as follows:

    ```
    profiled = updater(original)
    ```

    If an Identifier in the Profile Update Map does not have a corresponding element in the original Dataset, what do we do?

- A _Required Elements_ of Identifiers that must be present in the Original Dataset.
    Note: should this specify all the

## Profile Validator

The _Profile Validator_ takes a Profile and validates that it is consistent with the rules for Profiles.

1. No Removed Group is contained in the Retained Group List and vice versa.
2. No Element in the Removed Element List has a Group Number that is in
the Retained Group List.
3. No Element in the Retained Element List has a Group Number that is in
   the Removed Groups List.
4. No Element in the Removed Element is contained in the Retained Element List and vice versa.


## Profiling Algorithm

1. Create a copy of the Original Dataset. This will be the Profiled Dataset.

2. Verify that all Elements in the Required Elements List are present in the copied Dataset.

3. Add any elements that are not present in the Required Elements List with their default values.

4. Remove all Elements in the Removed Group List and the Removed Elements List.

5. For each element that remains in the Profiled Dataset:

    a. Validate that it conforms to the DICOM Standard. If it doesn't conform add it to the Non-Conforming Elements List.

    b. If the element has a corresponding Updater in the Update Map,
    apply the Updater to the element and replace the element with the
    updated element in the Profiled Dataset.

