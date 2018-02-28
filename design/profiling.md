# Profiling Languagae

## TODO

* All strings contain UTF-8 code units.

## Issues

* Should we allow either single or double quotes for strings.

## Introduction

### Profile, Trial, Site, Study

    Profile

    Trial

    Site

    Study

    profiler = Site(Trial (Profile p)))

## General

* All Date Element values must conform to DICOM standard.

## Best Practices

* All Studies should have the following Data Elements:

    * Burned In Annotation (0028,0301)
    * Private Characteristics

* All De-Identified studies _should_ contain the following Data Elements:

    * Clinical Trial Attribute
    * De-Identification Method

* All De-Identified studies _might_ contain the following Data Elements:

    * Original Attribute Sequence
    * Encrypted Attribute Sequence


## Parameters (Is this the best name? is variable better?)

All Parameters are defined in a JSON Object (Map), where each parameter
is defined by an Identifier/Expression pair.

Each Identifier is a string (enclosed in double quotes) that starts with
an alphabetic character, followed by zero or more alphanumeric
characters, or the underscore ('_') character.

Each Expression is either a single value typically a string or a list of
strings; however, a value might be any one of string, number, object,
array, true, false, or null.

An example parameter definition object is:

Figure 1:Example Parameter Definition

    {
      "TrialId": "01234",
      "TrialName": "ACR Hematoma Trial",
      "SubjectId": "S98765",
      "SubjectName": "$TrialID.$SubjectId"
    }

## Rules

Rules are also defined using JSON objects. Each Rule is an
Element/Function pair,

Each Element is string containing a DICOM keyword from PS3.6 Table 1-1.

Each Value is either a single Function expression, or a list of Function
expressions.

A Function expression consists of a Function Identifier followed by a
comma separated list of arguments enclosed in parentheses. For example:

    modifyDate(element, year, month, day)

is a simple Function expression that returns

## Standard ACR Trial Parameters

## Types

The types of values that may be stored in Elements are base values that
correspond to numbers or strings.  There are several types of numbers each of which corresponds to a VR:

    int16, int32, float32, float64, uint8, uint16, uint32

There are also several types of strings that correspond to VRs:

    integer, decimal, string(short, long), text(short, medium, long), date, time, dateTime, age, uid, ...

Finally there is the Array type.

## Expressions

There are several different types of expressions:

literal

string

array

function call

### Literal Expressions

#### Numbers

Literal numbers are expressed in the standard way.

#### Literal Strings

Strings are arrays of characters enclosed by double quotes. Literal
strings may contain escaped characters, but may not contain '$'.

#### Arrays

An array of literal strings

An array of numbers

### String Expressions

All strings in parameter values support interpolation, which means they
may contain variables or expressions, which are replaced with their
value which must be a string.

The $ (dollar sign) character is used to denote a variable or an
expression. If the $ if followed by an Identifier, the $ character and
the identifier are replaced with the value of the variable that
corresponds to the Identifier. For example, the string:

    "Trial #$TrialID is the $TrialName"

Evaluates to:

    "Trial #01234 is the ACR Hematoma Trial"






definition

Parameters can be defined in a Profile, Trial, or Site definition. Site
variables have priority over Trial identifiers, which have priority over
Profile identifiers.


#### Interpolated strings

#### Concatenated strings

### Array Expressions

    array = '[' #e ']'

Where '#e" is a comma-separated list of one or more expressions.

### Function Calls

    value = id '(' #e ')'

Where value contains is a literal number, a literal string, an array of
numbers, or an array of strings.

## Rules

Rules are defined using a JSON object. Each Rule is an
Identifier/Expression pair, where the Identifier is a DICOM Data Element
Keyword and the expression evaluates a ground value.

is either a JSON value, a
Function expression or an array of one or more Function expressions.

An expression is either a literal value such as string or number, or a a
function call, such as:

    f1(arg1,  oArg: oArg)

which returns a value or an array of values.

String values my be concatenated by using a plus sign (+) between a
sequence of strings. For example:

    f1(arg1) + var1 + f2(oKey: oArg)

An array of values can be constructed using a array of expressions:

    [ e0, e1, ...]

where each expression ```e``` evaluates to a base value (ground type), i.e. a
number, or a string.



or

    f1(arg1), var1, f2(oKey: oArg)

If the functions and variables denote string

 Each function of variable in the sequence may be separated by
one or more spaces. The values of

Each argument must satisfy the type defined in the function definition.

###  Definitions

The Function defined in this document have the following format:

    name(type arg,... {type oArg: default,...})

Each function has a name and then some number of arguments enclosed in
parentheses.

Each argument has a type and a name.

There are two types of arguments _required_ and _optional_.

Required arguments are defined first and in order and must be in the same
order when the function is called.

Optional arguments are defined by a type, a name and possibly a default
value. When the function is called if an optional is not present the
default value is used. If an optional argument does not have a default
value defined the default value is ```null```.

For example:

    content(Element source, {

All of the JSON types may be used. The JSON number type has three
subtypes that are used in this definition:

int: uint: float: or number:



### Dataset Functions that Act on Groups of Elements

#### Keep Group

    keepGroup18()
    keepGroup20()
    keepGroup28()

#### Remove Group

    removeGroupCurves()
    removeGroup50()
    removeOverlays()
    removeGroup60()

TODO: should be allow the synonyms?

#### Remove All Private Groups

    removePrivate()

#### Keep Private Groups

    keepPrivateGroups(Array<String> creators)

#### Remove Private Groups

    removePrivateGroups(Array<String> creators)

#### Keep Safe Private

    keepSafePrivateElements()

### Dataset Functions that Act on Individual Elements

The functions in this section change the contents of the Dataset; they
do not change the values of Data Elements contained in the Dataset.

#### age()

Issue: are there any other Elements that this should act on?

The ```age``` function removes the Patient Birth Data Element
(0010,00xx), and converts its value to the corresponding age relative to
the current date and adds a PatientAge (0010,1010) Element to the Dataset with
that value.

The ```target``` _must_ be the PatientAge Element.



#### round(int groupSize, {Element source})

The ```round``` function is like the ```age``` function except that the
```age``` value is rounded into a group of groupSize.

The center of the first group is always at zero. For example, if the
patient's age is 57, then:

    PatientAge: round(10)

will equal 60.

Issue: what are valid ```target```s?




#### always(Expression e)

The ```always``` function evaluates the expression, and if the
```target``` is present in the Dataset replaces its value with the value
of the expression; otherwise, a ```target``` Element with that value is
added to the Dataset.

#### Keep

    keep(Tag tag)

Ensures that the ```target``` Element is kept in the Dataset and not
modified.

### Private

    private(String creator, Object<vr, values>)

The ```private``` function add a set of private tags to a Dataset.  The ```creator``` is a String that identifies the private group.

#### Remove

    remove(Tag tag)

Removes the ```target``` Element from the Dataset.


### General Functions that Act on Elements

#### add(newValue)

The ```add``` function adds replaces the current value of the
```target``` with the value in the ```newValue``` argument.

If ```target``` is not present in the Dataset, it is added to the
Dataset with ```newValue``` as its value.

```newValue``` must be compatible with the VR of the ```target```.



#### Contents

    contents({Element source,
              RegExp regexp: '',
              String replacement: "",
              String default: ""})

The ```contents``` function returns the value of the ```source```
Element. If the ```source``` is not present it returns the ```default```
value.

TODO: finish.

#### encrypt({Element source, String key: "")

#### hash({Element source, uint maxChars, uint maxWords})

Issue: does this only work on strings?

#### process(Sequence sq)

Runs the deidentifier on the sequence.

Shouldn't this be the default action.

#### require({Element source})

If the ```target``` does not exist, it is added to the Dataset with the
```source```'s value. If the ```source``` does not exist the value is
empty.

If the ```target``` exists, this function does nothing.



### General Functions that Produce String Values

#### Append

    append(String exp0)

or

    append([ #e ])

The ```append``` function appends the value of its argument to the
```target```'s value. The ```target``` _must_ be a multi-valued
function, i.e. its VM _must_ be greater than 1.


#### blank(int n)

Issue: blank is not really necessary since it can be denoted by a string
of space characters,e.g." ".

The ```blank``` function returns a string containing ```n``` space
characters. ```n``` must be a non-negative integer. If ```n = 0``` the
empty string ("") is returned.

The ```blank``` function can only be used with Elements with VRs that
are strings.


#### hash({Element source})

Issue: how are the various hash functions different?

The ```hash``` function computes the hash of the ```source```'s value.

If source is not present the ```target``` becomes the source.

If the source has not value this function does nothing

The current hash algorithm is SHA256.

Note: this also performs the function of @hashptid.

#### Integer

    Integer(Element Source, String keyType, uint width)



#### truncate({Element source, int n: 0})

The ```truncate``` function truncates the ```source```'s values.

If ```n``` is zero, the value is ```""```.

If ```n``` is positive the value is the first ```n``` characters of the
```source```.

If ```n``` is negative the value is the last ```n``` characters of the
```source```.






### Dates and Times

The values of the Date and Time functions are either strings or arrays
of strings.

#### today(char separator = "")

The ```today``` function returns the current date as a string. It has
one argument, which specifies a separator character. The value returned
by the ```today``` function has the following format:

    yyyySmmSdd

where ```yyyy``` is the current year, ```mm``` is the current month, and
```dd``` is the current day. ```S``` is a separator character that
defaults to the empty string ("").

For example, if today is January 31, 1993, then:

    date("-")

would return the following string:

    "1993-01-31"

#### date({Element element, int year, int month, int day, separator: "", default:""})

All arguments are optional:

* if ```element``` is omitted the ```target``` element becomes the
  source element.
* if any of ```year```, ```month```, or ```day``` are missing the
  corresponding value in the source element is used.
* If the source value is not present in the dataset or has no value, the
  default is used as the source.
* If the ```target``` is not present in the Dataset it is added to the
  Dataset.

Issue: is the '*' functionality really
needed?

The ```date``` function returns the date specified by its arguments as a
string in the following format:

    yyyy_mm_dd

where ```year```, ```month```, ```day``` are integers corresponding to
the year, month, and date respectively, and ```separator``` is an
optional argument that specifies the separator character ('_'), if any.



The value of the ```date``` function can be used with any Data Elements
that have VR that are string (SH, LO) or text (ST,LT, UT). It may also
be used with Data Elements that have a VR of DA, in which case any
```separator`` value is ignored.


#### dateAdd(Element element, Int days)

Issue: is element necessary?

The ```dateAdd``` function has one argument that is an integer. It
specifies the number of days to be added to each of the date values
contained in ```element```, which must have a value representation of
DA. ```dataAdd``` returns a string containing the resulting dates
separatedthe current date plus ```days``` as a string. The value
returned by the ```today``` function has the following format:

    yyyySmmSdd

where ```yyyy``` is the current year, ```mm``` is the current month, and
```dd``` is the current day. ```S``` is a separator character that
defaults to the empty string ("").

#### now(char separator = "")

The ```now``` function returns the current 24-hour time as a string. It
has one argument, which specifies a separator character. The value
returned by the ```now``` function has the following format:

    HH_MM_SS

where ```HH``` is the current hour, ```MM``` is the current minute, and
```SS``` is the current second. ```_``` denotes a separator character
that defaults to the empty string (""), which is the DICOM separator.

**Fix**:
For example, if today is January 31, 1993, then:

    date("-")

would return the following string:

    "1993-01-31"

### Functions that Act on UIDs

#### hash({UI source, String root: "2.25.", String suffix: ""})

The hash function creates a hash of the ```source``` Element, which must
have a VR of UI.

If ```source``` is not present, then ```target``` must have a VR of UI

If ```target``` has a VR of UI the ```suffix``` is
ignored. In general it is best not to supply the root argument.

The current hash algorithm is SHA256.


### Functions that Act on the Elements with VR of PN

#### initials(Element source)

Is this really needed?

### Functions that Act on the PatientID (0010,0010)

#### lookup(Table tableType, action)

Issue: What other tables might be defined?

Returns the String associated with the Patient ID in the Trial.patientLookupTable.

What about actions: remove, keep, empty, abort; otherwise quarantine.

### Conditional Functions

#### If Exists

    ifExists(Element source, String trueExp, String falseExp)

If the ```source``` exists the the value of ```trueExp``` is stored in ```target```; otherwise, the value of ```falseExp``` is stored in ```target```.

#### If Empty

    ifEmpty(Element source, String trueExp, String falseExp)

If ```source``` is not present in the Dataset, or has no value or has a
blank value (a value that consists of only space characters), then the
then the value of ```trueExp``` is stored in ```target```; otherwise,
the value of ```falseExp``` is stored in ```target```.

#### If Equals

    ifEquals(Element source, String s, String trueExp, String falseExp)

If the ```source``` value is exactly equal to ```s```, then the then the
value of ```trueExp``` is stored in ```target```; otherwise, the value
of ```falseExp``` is stored in ```target```.


#### If Contains

    ifContains(Element source, String s, String trueExp, String falseExp)

If the ```source``` value contains ```s```, then the
then the value of ```trueExp``` is stored in ```target```; otherwise,
the value of ```falseExp``` is stored in ```target```.


#### If Matches

    ifEquals(Element source, Pattern pattern, String trueExp, String falseExp)

If ```source``` value matches the ```pattern```, then the then the value
of ```trueExp``` is stored in ```target```; otherwise, the value of
```falseExp``` is stored in ```target```.

```pattern``` may be a String or a Regular Expression. The Reqular
Expression uses the JavaScript syntax.


#### Is Root Dataset

    isRootDataset(trueExp, falseExp)

If the current Datset is the Root Dataset for the Instance then true;
otherwise, false.

Note: new name for Select()

### Miscellaneous

#### Abort

TODO: What should this do?

#### Quarantine

    quarantine()

Sends the study to the Trials Quarantine URL

TODO: add details

## Error Handling

TODO:
