# markdown.tcl
#
# tclllib markdown support

package provide httpd::markdown 1.0

if {[catch {package require Markdown}]} {
    # tcllib's Markdown package must be available
    return
}

# register the md suffix as a doctool application
set Doctools(suffix) .md
Mtype_Add $Doctools(suffix) text/x-markdown

# Doc_text/x-markdown --
#
# use Markdown to format up and return an html document
#
# Arguments:
#	path	The file pathname.
#	suffix	The URL suffix.
#	sock	The socket connection.
#
# Results:
#	None
#
# Side Effects:
#	Sets up the interpreter context and runs s over the page

proc Doc_text/x-markdown {path suffix sock} {
    set in [open $path]
    set md [read $in]
    close $in
    set data [encoding convertto utf-8 [::Markdown::convert $md]]

    Httpd_ReturnData $sock "text/html;charset=utf-8" $data
    return
}

