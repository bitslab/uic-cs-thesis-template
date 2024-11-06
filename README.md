Sample UIC Computer Science LaTeX Thesis Template
===


Purpose
---
This is intended to be a useful starting point for writing a PhD thesis at
UIC.  Its meant to replace the mix of outdated latex files, PDFs and websites
that used to, collectively, define what was needed.


Outline
---
This template is broken up so you should only need to change a couple of
files, but mostly not muck withe the layout / formatting / etc parts.

-   `thesis.tex`: Edit this to fill in the title of your thesis, you name,
    information about any degrees you currently hold, and your committee.
    You'll also have to add references to the chapters and sections that'll
    make up the body of the thesis.
-   `sections/other/__commands.tex`: A place to add any custom commands
    you'll use in your thesis.  *Don't* use commands for abbreviations though,
    those go in the next section.
-   `sections/other/__preamble.tex`: You likely won't need to make changes
    to this, but this contains all the stuff that goes before the
    document section of your paper, so its where you'd add references to
    any additional packages you need.
-   `sections/other/__abbrs.tex`: Define all the acronyms you'll use in the
    paper in this file, using the format defined in the "glossaries" package.
    Abbreviations added here, and used in the body of your thesis, will
    automatically be formatted correctly to create the "Abbreviations"
    section of your thesis.
-   `sections/other/{_1_dedication.tex, _3_contribution_of_authors.tex, _4_summary.tex}`:
    These files map on to the sections of the thesis you'd expect, with the
    template handing the formatting and placement of each page.  All you
    need to do is add the relevant text.
-   `sections/other/_2_acknowledgement.tex`: This section is just like the
    above, for the most part.  Just add text describing who you'd like
    to acknowledge, and how.  Just don't forget to add the `\initials{XXX}`
    line to the bottom of the file.
-   `tables/*`, `figures/*`: Just a suggestions on how / where to store your
    tex table and figure files.


Building
---
You'll need `latexmk`, `makeglossaries` and `pdflatex` on your system,
along with a pretty standard set of latex packages.  Once thats the case,
building the PDF should just be a `make clean && make`.


Other Resources
---
-   [LaTeX macros for typesetting UIC theses](https://www.math.uic.edu/graduate/current/uicthesi)
    Outdated, but very helpful prior template that this builds from.  Its
    not structured in a way that you can easily start writing content, and
    its fallen behind many of the CS department's current requirements,
    but it was *extremely* helpful.
-   [UIC Thesis Page](https://grad.uic.edu/thesis)
    The department's thesis page.  It has the final word on the formatting
    and submission requirements.  It includes a link to the manual, which
    is hard to follow, but comprehensive.
-   [iThenticate Manual](http://grad.uic.edu/sites/default/files/pdfs/Introduction_to_Screening_Your_Thesis_or_Dissertation_using_iThenticate-final_a.pdf)
    Oddly, some of the requirements for the (in almost all cases) required
    "Contribution of Authors" section is only found in the iThenticate
    Manual (as far as I could find).


Author
---
Pete Snyder / https://www.peteresnyder.com
