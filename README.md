csv2tsv
=======

Author: Matthew Might

Site:   http://matt.might.net/

`csv2tsv` is a simple lex program for converting CSV files to TSV
files while properly accounting for quoted fields.


Purpose
-------

The purpose is to make it easier to manipulate CSV data with tools like
Perl and awk.

`csv2tsv` is sensitive to doubly-quoted fields commonly found in CSV
files but not in TSV files.  For instance, CSV files may contain quoted 
fields with nested commas:

    "first","last","email@domain.com",500

Setting the field separator to `,` in tools like awk and Perl does not
always have te desired effect, since it will leave the quotes on the 
data.

Moreover, if a field contains internal commas inside the quote as in:

    "last, first","email@domain.com",500

tools like awk and Perl will see the fields, in order, as:

    "last
     first"
    "email@domain.com"
    500

which is rarely (if ever) the desired effect.

`csv2tsv` will convert this file into:

    last, first<TAB>email@domain.com<TAB>500

where `<TAB>` is the tab character.


Installation
------------

 1. To compile, run `make`.

 2. To install `csv2tsv` to `$HOME/bin`, run `make install`.



