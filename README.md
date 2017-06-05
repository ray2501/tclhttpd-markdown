tclhttpd-markdown
=====

Add [tclllib markdown](https://core.tcl.tk/tcllib/doc/trunk/embedded/www/tcllib/files/modules/markdown/markdown.html) support to Tclhttpd.

Only test on Tclhttpd 3.5.1.


Follow below steps to install:

1. Add markdown.tcl file

    Put markdown.tcl to Tclhttpd lib folder

2. Add markdown type conversions to bin/httpdthread.tcl

    package require httpd::markdown ;# markdown type conversions

3. Modify lib/pkgIndex.tcl, add http::markdown info

    package ifneeded httpd::markdown 1.0 \[list source \[file join [list $dir] markdown.tcl\]\]

