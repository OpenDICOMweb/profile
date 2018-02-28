<strong>Open DICOM<em>web</em> Project</strong>
# Profile Definition

Profiles are defined by a JSON Object. The JSON Object is composed of
identifier/expression pairs, where the identifier is delimited by double
quotes.

## Syntax

The Profile language is defined by a grammar, which is written in using
ABNF, which is defined in [RFC5234]. This grammar uses many of the core
syntax rules defined in [Appendix B1], which are reproduced for the
readers convenience in Appendix A of this document.

In addition, the following basic syntax rules are used throughout this
grammar. Similar to [RFC5234] basic rules are in uppercase. These
typically resolve to terminal values in one evaluation step.

        BACKSPACE = %x08           ; backspace
        VTAB      = %x0B           ; vertical tab
        FORMFEED  = %x0C           ; form feed
        NEWLINE   = LF / CR LF     ; depends on the operating system
        OWS       = *WSP           ; optional whitespace
        DQ        = DQUOTE         ; short form of double quote
        GROUP     = "0x" 4HEXDIG   ; a DICOM group
        TAG       = "0x" 8HEXDIG   ; a DICOM Data Element Tag
        {         = "{"            ; syntactic sugar
        }         = "}"            ; ...

### ABNF List Extension:  #Rule

A # syntax rule is an extension to the ABNF rules of [RFC5234]. It is
used to improve readability. The "#" rule is similar to "*" and is used
to define comma-delimited lists of syntatic expressions or ```sexp```.

The full form is:

    <a>*<b>sexp

where \<a\> and \<b\> are optional decimal values, indicating at least
\<a\> and at most \<b\> occurrences of the sexp. Each sexp, except
the last, is separated from the next sexp with a comma (','). If zero
or one sexp are present then no commas are generated.

Default values are ```a = 0``` and ```b = infinity``` so that
```#<sexp>``` allows any number, including zero; ```1*<sexp>```
requires at least one; ```3*3<sexp>``` allows exactly 3; and
```1*2<sexp>``` allows one or two.

> Note: this is different from the list extension rule defined in
> [RFC7030], which requires at least one sexp.

## Expressions

There are two types of expressions: simple and general.

Simple expressions have the following syntax:

    sexp =  number/ identifier / string / array

General expressions also includes environments and Profile Rules
(```prules```). They have the following syntax:

        exp =  sexp / environment / private-group / prules

When evaluated, an expression computes a literal value, typically a
string.

## Numbers

While JSON only allows a single type of number, the Profiler provides
additional number types that correspond to different DICOM Value
Representations (VR).

### Integers

The general type of integers is ```integer```. Integers are sub-devided
into signed and unsigned integers.

Unsigned integers are always non-negative and have no sign.
Unsigned integers have the prefix ```uint``` and trailing digits that
denote the maximum number of bits in a value of that type. There are 3
specific types of ```uint```:

        uint8, uint16, uint32

Signed integers have an optional sign. They have the prefix ```int```
and trailing digits that denote the maximum number of bits in a value of
that type. There are 2 specific types of ```int```:

        int16, int32

### Decimal Numbers

The general type of decimal numbers is ```decimal```. There are two
specific subtypes of decimal numbers:

        float32, float64

### Number Syntax

_Numbers_ have the following syntax:

    uint     =  1*DIGIT
    uint8    =  uint                    ; 8 bit unsigned integer
    uint16   =  uint                    ; 16 bit unsigned integer
    uint32   =  uint                    ; 32 bit unsigned integer

    SIGN     = "-" / "+"
    integer  =  [SIGN] uint
    int16    =  integer                 ; 16 bit signed integer
    int32    =  integer                 ; 32 bit signed integer

    EXPMARK  = "E" / "e"
    exponent =  EXPMARK [SIGN] uint  ;
    decimal  =  [SIGN] uint ["."]
    decimal  =/ [SIGN] *DIGIT "." uint [exponent]
    decimal  =/ [SIGN] uint ["." *DIGIT] exponent

    float32  =  decimal                 ; 32 bit floating point number
    float64  =  decimal                 ; 32 bit floating point number

The types with trailing digits specify the maximum number of bits in
their representation. If there are no trailing digits the type is general.

Before storing decimal values the Profiler will convert VRs of DS
into the following canonical string format:

    sign uint "." uint "E" sign uint

The ```SIGN```, ".", "E" (canonical exponent marker) and ```uint``` shall be
present. ```uint```s must have at least one digit, which may be
zero.

## Identifier

An _Identifier_ is a string that has at least one (initial) character.
The initial character may be an alphabetic or '\_' character. Subsequent
characters may be alphabetic, numeric or '\_'.

Identifiers are case insensitive. So, "abc", "aBc", and "ABC" represent
the same identifier.

Identifiers have the following syntax:

    initial = ALPHA / "_"
    subsequent = initial / DIGIT
    identifier = initial *subsequent

### String

In general, the Profiler supports UTF-8 strings. However, all DICOM VRs
do not support UTF-8 strings, so the Profiler will ensure that only
valid strings are stored in elements.

The Profiler supports embedding expressions in strings, aka
_Interpolated Strings_. When the string is evaluated each embedded
expression is evaluated and the resulting values are converted (coerced)
into strings and replace the embedded expression the enclosing string.

An unescaped $ character in a string signifies the beginning of an
interpolated expression. The $ sign may be followed by either:

* a single identifier: ```$id```
* a simple expression delimited by curly braces: ```${ sexp }```

The form ```$id``` is equivalent to ```${id}```.  An interpolated string
```"s1${e}s2"``` is equivalent to the concatenation of the strings
```"s1"```, ```e.toString()``` and ```"s2"```. Where ```e.toString()```
is the result of evaluating ```e``` and converting it into a string.

A string is said to be raw or fully evaluated when it no longer contains
any escape sequences or interpolation expressions.

>  _Note_: The expression inside the interpolation could itself include
>  strings, which could again be interpolated recursively; however, the
>  Profiler does not support recursive interpolation.

Strings can be composed of any UTF-8 visible code point except ```"```,
```$```, and ```\```, or ```NEWLINE```. These characters must be escaped
using the ```\``` character. There are also character escapes
defined for certain control characters.

The following character escape sequences are defined:

    \" = DQ
    \$ = "$"
    \\ = "\"
    \b = BACKSPACE
    \f = FORMFEED
    \n = NEWLINE
    \r = CR
    \t = TAB
    \v = VTAB

There are also code point escapes, which allow code point values to be
embedded in strings. These are expressed using the following escape
sequences.

    \x 2HEXDIG
    \u ( 4HEXDIG / { 1*6HEXDIG } )

The syntax for Strings is:

    ; UTF-8 except ", $, \ and control characters
    utf8 = %x32-33 / %x35 / %x37-91 / %x93-7E / %x0100-FFFF

    ; Character and code point escape sequences
    esc-char = "\" (DQ / "\" / "/" / "b" / "f" / "n" / "r" / "t" / "$")
    esc-cp   = "\" ( ("x" 2HEXDIG) / ("u" 4HEXDIG) / ("u" { 1*6HEXDIG } ) )
    escape   = "\" (esc-char / esc-cp)

    ; UTF-8 code points
    codepoint = UTF8 / escape

    ; String interpolation expressions
    iexp = "$" ( identifier / { exp } )

    ; String (interpolated)
    string = DQ (*codepoint / iexp) DQ


### Arrays

Arrays have the following syntax:

    array = "[" #exp "]"

where #exp denotes a comma separated list of zero or more expressions.

### Private Groups

Private Groups have the following syntax:

    private = { #group-def }
    group-def = creator ":" { #element }
    creator = DQ identifier DQ
    element = ptag ":" "[" vr, values "]"
    ptag = "0x" 4HEX
    vr = 2[A-Z]                ; where vr corresponds to a DICOM vr
    values = "[" #value "]"    ; an Array of one or more vales
    value = string / number

### Environment

An environment is similar to a JSON object that contains a set of
variable definitions, which are also known as identifier/string pairs.
The variable name is an ```identifier```, and in JSON it must be
delimited by double quotes. A quote delimited identifier is called
called a ```qidentifier```.

Each variable identifier in an environment must be unique. The variables
defined in an environment are used in evaluating Profile Rules.

Environments have the following syntax:

    env = { #var-def}
    var-def= OWS qidentifier OWS ":" OWS string OWS
    qidentifier = DQ identifier DQ

> Note: DQ denotes a literal double quote character ```"```, and
> ```OWS``` is optional whitespace.

### Rules

Each Profile defines a set of Rules using a syntax that is similar to a
JSON object. Each Rule has 1) a _target_ Data Element, which is denoted
by its DICOM keyword, and 2) a value expression that generates a value
for the target element. The target and value expression are often
referred to as a target/value pair. Each target in a Profile must be
unique and must refer to a DICOM Data Element keywords defined in PS3.6,
Table 1-1.

> TODO: Should we allow tags as well as keywords to be the target?

The set of Rules for a Profile are defined using the following syntax:

    rules = { #rule-pair }
    rule-pair = OWS target OWS ":" 1*(OWS rule)
    target = DQ keyword DQ       ; DICOM Data Element keyword
    rule = identifier / string / function / string-list / number-list
    function = identifier "(" #arg ")"
    arg = sexp
    string-list = "[" #string "]"
    number-list = "[" #number "]"

The rules in a Profile are evaluated in the tag order of the
```target``` elements. Each rule is fully evaluated before the of
following rule is evaluated.

Each Rule is evaluated in left to rigt order as follows:

 1. Variables are resolved against the current environment and are
    replaced by their values. If the value of a variable is a non-raw
    string, then the string is evaluated against the environment until
    it is fully resolved and the value is the fully resolved string. If
    the string cannot be fully resolved the Profiler will throw an
    error.

 2. Non-raw strings are evaluated against the current environment until
    they they are fully resolved.

 3. Expressions in Lists are evaluated in left to right order until they
    are fully resolved.

 4. Function arguments are evaluated in left to right order until they
    are resolved. The evaluation order for optional arguments is the
    order in which they are defined by their function.

 5. If the function defines an argument that is a ```source``` element,
    and it is not present, then the value of the ```target``` element,
    if any, is used as the value of the _source_. If the ```target```
    element does not exist or has no value. Its value is the ```""```for
    string VRs, and ```null``` for all other VRs.

 6. Functions are evaluated once their arguments are all evaluated.

 7. If the resulting value is a sequence of strings possibly separated
    by optional whitespace (OWS). The strings are concatenated together
    and the resulting string becomes the value of the rule.

 8. If the resulting values are separated by commas, the value of the
    rule is the list of values.

 9. Finally, the resulting value is stored in the ```target``` element
    if it exists. If it does not exist the ```target``` may be created
    if the first function specifies that non-present elements shall be
    created.

Once all the rules have been evaluated and applied to their
```target```s, The application of the Profile is complete.

## Profile Definition



    {
      "Name": <identifier>,
      "Version": <version>,
      "ValidationDateTime": <date-time>,
      "Path": <url>,
      "Quarantine": <urlL>,
      "SourceLines": [*<string>],
      "DeIdOptions": [],
      "Comments": {
         "lineNo": "Comment line"
      },
      "GlobalRules": {
        "keepGroup18": bool,
        "keepGroup20": bool,
        "keepGroup28": bool,
        "keepCurves": bool,
        "keepOverlays": bool,
        "removeCurves": bool,
        "removeOverlays": bool,
        "removeSafePrivate":
      },
      "Parameters": <parameters>,
      "Rules": {
        #(target : rule)
      },
      "Errors": {
        "lineNo": "Error message"
      }
    }

## Appendica A

The grammar defined in this document uses the following core rules from
[RFC5234].

    ALPHA  = %x41-5A / %x61-7A
    BIT    = "0" / "1"
    CHAR   = %x01-7F
    CR     = %x0D            ; carriage return
    CRLF   = CR LF           ; Internet standard newline
    CTL    = %x00-1F / %x7F  ; control characters
    DIGIT  = %x30-39
    DQUOTE = %x22            ; The double quote character
    HTAB   = %x09            ; horizontal tab
    LF     = %x0A            ; linefeed
    LWSP   = *(WSP / CRLF WSP)
    OCTET  = %x00-FF         ; 8 bits of data
    SP     = %x20
    VCHAR  = %x21-7E         ; visible (printing) characters
    WSP    = SP / HTAB       ; white space

[RFC5234]: https://tools.ietf.org/html/rfc5234
[Appendix B1]: https://tools.ietf.org/html/rfc5234#appendix-B.1
[RFC7030]: https://tools.ietf.org/html/rfc7030



