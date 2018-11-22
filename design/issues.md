De-Identification Issues

Trial Naming

1. Is there any difference between the notion of ID (identifier) and NO
   (number)? For example, I've come across both "TrialID" and "TrialNo".
   If there is no difference then I think "ID" is that better name
   because these are strings not numbers.
2. What values are trial encryption keys allowed to have? I think they
   are strings, but what are the legal values?
3. Is there some reason why the parameter names (e.g. "TRIAL") are all
   uppercase? The would be more readable if they were all lowercase or
   just capitalized.

I encountered when converting PS3.15 Appendix E Table E.1-1, and I fixed
them as follows:

1. The slashes between the action types, e.g. X/D, must be removed.
2. The table contains Data Element names rather than keywords. This
   means that all spaces (" "), and apostrophe's ("'") must be removed
   from the names in column 1. Also, slashes ("/") and dashes("-") are
   replaced by underscores.
3. The Y/N entries have been to be converted to true/false.
4. the empty cells that contain "NA" should be fixed. 0010,0050

    - PatientsInsurancePlanCodeSequence, false, false 0010,0101

    - PatientsPrimaryLanguageCodeSequence, false, false 0010,0102

    - PatientsPrimaryLanguageModifierCodeSequence, false, false

5. Private Attributes, 0xggggeeee where gggg isodd must be removed from
the generated table