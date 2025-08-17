% UICTHESI DOCUMENT CLASS
%       for LaTeX version 2e 02/01/96
%==============================================================================
% \section{A \LaTeX\ Style File for Thesis Formatting at UIC}
%
% This is the thesis style file to be used with \LaTeX .
% To use it please enter the line \verb+\documentstyle{uicthesi}+.
% This file an adoptation of the Report Document style for
% \LaTeX\ version 2.09 Copyright (C) 1988 by Leslie Lamport and
% for use with the new Font Selection Scheme that accompanied \TeX\
% version 3.1 at UIC.
%
% First Edition:
% Paul Davis, UIC Computer Center, 31 December 1991.
%
% Changes to this file:
%  (should be described here)
%  (remember to update the filedate and fileversion as needed.)
%
% Changed Acknowledgment to allow plurals and changed Cited Literature
%   to avoid Appendix continued page headers.
% Paul Davis, UIC Computer Center, 27 February 1992.(a)
%
% Changed xnumberline to allow section,subsection,etc. headings to
%   line up.
% Paul Davis, UIC Computer Center, 3 March 1992.(b)
%
% Changed formatting for table of contents.
% Paul Davis, UIC Computer Center, 12 March 1992.(c)
%
% Fixed footnote counter
% Paul Davis, UIC Computer Center, 14 May 1992.(d)
%
% Fixed footnote counter again, now it really does count correctly.
% Paul Davis, UIC Computer Center, 4 June 1992.(e)
%
% Changes \@pnumwidth and \@tocrmarg parameters to avoid line overruns
%   in TOC, LOF, LOT.  Added a new conditional, \ifabseqnumbering,
%   to create absolute numbering of equtions as an option
% Paul Davis, UIC Computer Center, 25 June 1992.(f)
%
% Added spacing between cited literature sections (\itemsep)
%   and deleted extra page before the Vita.(g)
%
% Made minor revisions to be consistent with the Graduate College
% requirements.
% Nathan Bliss, UIC Departent of Mathematics, 30 October 2014 (h)
%
%
% This file has been updated to work under \LaTeX\ version 2e.
% Wherever possible or necessary I have substituted the appropriate
% \LaTeX\ version 2e command for the old commands that didn't work.
% As I started this project with little prior knowledge there may
% be bugs or other mistakes, so please feel free to add corrections
% and enhancements as seen fit. I used the University of California
% thesis style class ucthesis.cls and associated files as guides in
% this effort. Those are available from any CTAN archive.
%
% Thomas McKibben, UIC Dept. of Physics, January 1996.
%

% First, let us announce ourselves.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uicthesi}[1996/01/31 v1.2 University of Illinois Chicago Thesis Class]
%
% BEGIN OPTIONS
%
\newcommand\@ptsize{}
\newcommand\@draftmark{}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\renewcommand\@draftmark{1}}
\DeclareOption{final}{\renewcommand\@draftmark{0}}
\ExecuteOptions{11pt,oneside,final} % default options

%
% END OPTIONS
%

%
% CHOOSING THE TYPE SIZE
%

%  Two-side or one-side printing.
%
% \@twosidefalse               %  Default is one-sided printing.
\def\ds@twoside{\@twosidetrue  %  Defines twoside option.
           \@mparswitchtrue}   %    Marginpars go on outside of page.

% This is a tricky solution to a tough bootstrapping problem.  The
% "draft" option requires the definition of the \ssp macro.  However,
% the \ssp macro requires that the uct1?.clo file has been loaded.  This
% loading is done by the \@options command which also invokes the
% \ds@draft macro.  This was a cyclic dependency in the previous
% version.  To break this dependency, I have made \ds@draft set a marker
% which is later tested to determine whether to actually do the draft
% mode actions.
%
% Ethan Munson (October 16, 1992)

% FMi 91/03/30: made twocolum.sty a file and twocolumn an option.

% RmS 91/10/15: moved actual reading of twocolumn.sty
%               to the end of this file.
\def\ds@twocolumn{\@twocolumntrue}

% The \ProcessOptions command causes the execution of every option command
% FOO which is declared and for which the user typed the FOO option in his
% \documentclass.  For every undeclared option BAR there will be a warning
% message. (BBF 10/31/94)

\ProcessOptions


% The type size option is handled by reading uicth11.clo
% There is no alternates to the default 11 point style.

\input uicth11.clo\relax

%

%
% BEGIN FRONT MATTER
%
%

% \section{Title Page}
%
% In this section we will define the  title page. The only macros that
% were added are the \verb+\degree+ macro that will be used to print the
% degree that the student is pursuing and the\verb+\pdegrees+ macro that
% will be used to print the prior degrees earned by the author.
% \verb+\date+ is redefined so that it only prints the year.
% The title should not be uppercase.
%    \begin{macrocode}
\def\title#1{\gdef\@title{#1}}
\def\author#1{
   \gdef\@author{#1}
   \gdef\@upauthor{#1}}

\def\@date{\the\year}
\def\degree#1{\def\@degree{#1}}
\def\pdegrees#1{\def\@pdegrees{#1}}
\def\committee#1{\def\@committee{#1}}

\def\titlepage{
   \newpage
   \c@page\z@
}

\def\endtitlepage{\newpage}

\def\maketitle{%
   \begin{titlepage}
      \centering
      \thispagestyle{empty}
      \c@page=2
      \vbox to 0pt{%
         \begin{center}
            \large\transparentbold\@title
         \end{center}\vss}
      \vfill
      \begin{singlespace}
         by
         \vskip\baselineskip
         \begin{tabular}{c}
            \@upauthor\\\@pdegrees
         \end{tabular}
         \vfill
         \vbox to 0pt{\vss
            \begin{center}

               \vskip \baselineskip
               THESIS\\
               \vskip \baselineskip
               Submitted in partial fulfillment of the requirements\\
               for the degree of \@degree\\
               in the Graduate College of the\\
               University of Illinois Chicago, \@date
               \vskip 3\baselineskip
               Chicago, Illinois
            \end{center}}
         \begin{flushleft}
         Defense Committee:\\
         \@committee
        \end{flushleft}
      \end{singlespace}
   \end{titlepage}}
%    \end{macrocode}
%
% \section{Chapters and Sections}
% By default, \LaTeX\ will only number thru the Subsections.
% Paragraphs and subparagraphs are not numbered so we will change
% the value of secnumdepth to a high number like 10 (5 will do).
%    \begin{macrocode}
\c@secnumdepth=10  % or  \setcounter{secnumdepth}{10}

\def\@sect#1#2#3#4#5#6[#7]#8{
   \ifnum #2>\c@secnumdepth
      \def\@svsec{}
   \else
      \refstepcounter{#1}
      \edef\@svsec{\csname the#1\endcsname\hskip 1em }
   \fi
   \@tempskipa #5\relax
   \ifdim \@tempskipa>\z@
      \begingroup
         #6\relax
         \@hangfrom{\hskip #3\relax\@svsec}
         {\interlinepenalty \@M \underl #8 & }%
      \endgroup
      \csname #1mark\endcsname{#7}
      \if@startedappendices
      \else
         \addcontentsline
            {toc}
            {#1}
            {\ifnum #2>\c@secnumdepth
            \else
               \protect\numberline{\csname the#1\endcsname}
            \fi
         #7}
      \fi
   \else
      \def\@svsechd{#6\hskip #3\@svsec #8\csname #1mark\endcsname
          {#7}
      \if@startedappendices
      \else
         \addcontentsline
            {toc}
            {#1}
            {\ifnum #2>\c@secnumdepth
            \else
               \protect\numberline{\csname the#1\endcsname}
            \fi
            #7}}
         \fi
      \fi
   \@xsect{#5}}
%    \end{macrocode}
%


% \section{Preliminary Sections}
% If this is to be a preliminary section, this macro causes the
% name designated by \verb+\section@mark+ to be used as the section
% title and to use that title in the heading of the continued pages
% of this section.
%    \begin{macrocode}
\def\@makeprelimhead{
   \def\headmark{\vbox{
        \hbox to \textwidth{\bfseries\large\hfil\section@mark{}
         (Continued) \hfil}}}
   \pagestyle{continued}
   \thispagestyle{pageonbottom}
   \@makeschapterhead{\section@mark}
   \par}
%    \end{macrocode}
%
% \subsection{Copyright Page}
%    \begin{macrocode}
\def\copyrightpage{
   \newpage\thispagestyle{empty}
   \c@page=2
   \vspace*{2.5in}
   \begin{center}
      Copyright by\\\@author\\\@date
   \end{center}
   \vfill\eject}
%    \end{macrocode}
%
% \subsection{Dedication}
%    \begin{macrocode}
\def\dedication{
   \clearpage
   \typeout{DEDICATION}
   \chapter*{}}
%    \end{macrocode}
%
% \subsection{Acknowledgment(s)}
%    \begin{macrocode}
\def\acknowledgment{
   \clearpage
   \typeout{ACKNOWLEDGMENT.}
   \def\section@mark{ACKNOWLEDGMENT}
   \@makeprelimhead}
\let\acknowledgement\acknowledgment

\def\acknowledgments{
   \clearpage
   \typeout{ACKNOWLEDGMENTS.}
   \def\section@mark{ACKNOWLEDGMENTS}
   \@makeprelimhead}
\let\acknowledgements\acknowledgments

\def\initials#1{
   \par\vspace{0pt}
   \leftline{\hskip 5.5in #1 \hfil}}
%    \end{macrocode}
%
% \subsection{Preface}
%    \begin{macrocode}
\def\authorcontributions{
    \clearpage
    \typeout{CONTRIBUTIONS OF AUTHORS}
    \def\section@mark{CONTRIBUTIONS OF AUTHORS}
    \@makeprelimhead}
    %    \end{macrocode}
%    \end{macrocode}
%
% \subsection{Preface}
%    \begin{macrocode}
\def\preface{
   \clearpage
   \typeout{PREFACE.}
   \def\section@mark{PREFACE}
   \@makeprelimhead}
%    \end{macrocode}
%
% \subsection{Summary}
%    \begin{macrocode}
\def\summary{
   \clearpage
   \typeout{SUMMARY.}
   \def\section@mark{SUMMARY}
   \@makeprelimhead}
%    \end{macrocode}
%
% \subsection{List of Abbreviations}
%    \begin{macrocode}
\def\listofabbreviations{
   \clearpage
   \typeout{LIST OF ABBREVIATIONS.}
   \def\section@mark{LIST OF ABBREVIATIONS}
   \@makeprelimhead}
%    \end{macrocode}
%
% \subsection{Vita}
%    \begin{macrocode}
\def\vita{
   \typeout{VITA.}
   \addtocontents{toc}{\protect\addvspace{\baselineskip}}
   \addcontentsline{toc}{chapter}
      {\protect\xnumberline{\ }VITA}
   \def\section@mark{VITA}
   \pagestyle{pageontop}
   \thispagestyle{pageonbottom}
   \@makeschapterhead{\section@mark}\par}
%    \end{macrocode}
%
% \section{Table of Contents}
% Here we define \verb+\tableofcontents+, we create a page style for
% the table of contents called \verb+\toc+. First let's define the name
% for the table of contents.
%    \begin{macrocode}
\def\tocname{TABLE OF CONTENTS}
%    \end{macrocode}
%
% Increase the heading level that will be included in the table of contents.
% The default is 2. We will set it equal to \verb+\c@secnumdepth+
%    \begin{macrocode}
\c@tocdepth=\c@secnumdepth
%    \end{macrocode}
%
% We change the \verb+\tableofcontents macro+
%    \begin{macrocode}
\def\@pnumwidth{3em}
\def\@tocrmarg {4em}
\def\@dotsep{4.0}

\def\tableofcontents{
   \clearpage
   \typeout{TABLE OF CONTENTS.}
   \def\headmark{\vbox{
        \hbox to \textwidth{\bfseries\large\hfil TABLE OF CONTENTS
           (Continued) \hfil}
        \vspace{\innerheadskip}
        \hbox to \textwidth{\bfseries\normalsize
           \underbar{CHAPTER}\hfil\underbar{PAGE}}}}
   \pagestyle{continued}
   \table@of@cont
   \newpage
   }

\def\table@of@cont{%
   \begin{singlespace}
   \thispagestyle{pageonbottom}
   \@makeschapterhead{TABLE OF CONTENTS}
   \par
   \hbox to \textwidth{\bfseries\underbar{CHAPTER}
       \hfil\underbar{PAGE}}
   \@starttoc{toc}
   \end{singlespace}}
%    \end{macrocode}
%
% \section{Figures and Tables}
% \subsection{Float placement parameters}
% See LaTeX manual for their definition.
%    \begin{macrocode}
\setcounter{topnumber}{2}
\def\topfraction{.7}
\setcounter{bottomnumber}{1}
\def\bottomfraction{.3}
\setcounter{totalnumber}{3}
\def\textfraction{.2}
\def\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\def\dbltopfraction{.7}
\def\dblfloatpagefraction{.5}
%    \end{macrocode}
% The caption for a table is forced to uppercase, but that for a figure
% is left in mixed case.
%    \begin{macrocode}
\long\def\@caption#1[#2]#3{
   \par
   \addtocontents
      {\csname ext@#1\endcsname}
      {\protect\addvspace{\baselineskip}}
   \if@isatable
\addcontentsline%
{\csname ext@#1\endcsname}{#1}{\protect\xnumberline%
{\csname the#1\endcsname\hskip 2em}%
{\expandafter{\uppercase{\ignorespaces #2}}}}
   \else
      \addcontentsline
{\csname ext@#1\endcsname}{#1}{\protect\xnumberline%
{\csname the#1\endcsname\hskip 2em}%
{\ignorespaces #2}}
   \fi
   \begingroup
      \@parboxrestore
      \normalsize
   \if@isatable
      \@makecaption{\csname fnum@#1\endcsname}
      {\expandafter{\uppercase{\ignorespaces #3}}}\par
   \else
      \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
   \fi
   \endgroup}

\long\def\@makecaption#1#2{
   {\vspace{10pt}\centering
   \if@isatable
      \hbox to \hsize{\hfil #1 \hfil}
      \vspace{\baselineskip}
      \setbox\@tempboxa\hbox{#2}
      \ifdim \wd\@tempboxa >\hsize
          #2\par
      \else
          \hbox to \hsize{\hfil\box\@tempboxa\hfil}
      \fi
   \else
      \setbox\@tempboxa\hbox{#1. #2}
      \ifdim \wd\@tempboxa >\hsize   % IF longer than one line:
          #1. #2\par                 %   THEN set as ordinary paragraph.
      \else                          %   ELSE  center.
          \hbox to\hsize{\hfil\box\@tempboxa\hfil}
      \fi
   \fi}}

\def\tablerule{
   \kern-3\p@
   \hrule width \columnwidth
   \kern 2.6\p@}
%    \end{macrocode}
%
% \subsection{Figure}
%    \begin{macrocode}
\newcounter{figure}
\def\thefigure{\arabic{figure}}
\def\p@figure{Figure~}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{Figure~\thefigure}
\def\figure{\@isatablefalse\@float{figure}}
\let\endfigure\end@float
\@namedef{figure*}{\@dblfloat{figure}}
\@namedef{endfigure*}{\end@dblfloat}
%    \end{macrocode}
%
% \subsection{Table}
%    \begin{macrocode}
\newcounter{table}
\def\thetable{\Roman{table}}
\def\p@table{Table~}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{TABLE~\thetable}
\def\table{\@isatabletrue\@float{table}}
\let\endtable\end@float
\@namedef{table*}{\@dblfloat{table}}
\@namedef{endtable*}{\end@dblfloat}
%    \end{macrocode}
%
% \section{Lists of Figures and Tables}
% \subsection{List of Figures}
%    \begin{macrocode}
\def\listoffigures{
   \clearpage
   \typeout{LIST OF FIGURES.}
   \def\headmark{\vbox{
        \hbox to \textwidth{\large\bfseries\hfil LIST OF FIGURES
           (Continued) \hfil}
        \vspace{\innerheadskip}
        \hbox to \textwidth{\normalsize\bfseries
           \underbar{FIGURE}\hfil\underbar{PAGE}}}}
   \pagestyle{continued}
   \list@of@figs
   \newpage
   }

\def\list@of@figs{
   \begin{singlespace}
   \thispagestyle{pageonbottom}
   \@makeschapterhead{LIST OF FIGURES}
   \par
   \hbox to \textwidth{\normalsize\bfseries
      \underbar{FIGURE}\hfil\underbar{PAGE}}
   \@starttoc{lof}
   \end{singlespace}}

\def\l@figure{
   \@dottedtocline{1}{2.5em}{3.5em}}
%    \end{macrocode}
%
% \subsection{List of Tables}
%    \begin{macrocode}
\def\listoftables{
   \clearpage
   \typeout{LIST OF TABLES.}
   \def\headmark{\vbox{
        \hbox to \textwidth{\large\bfseries \hfil LIST OF TABLES
           (Continued) \hfil}
        \vspace{\innerheadskip}
        \hbox to \textwidth{\normalsize\bfseries
           \underbar{TABLE}\hfil\underbar{PAGE}}}}
   \pagestyle{continued}
   \list@of@tabs
   \newpage
   }

\def\list@of@tabs{
   \begin{singlespace}
   \thispagestyle{pageonbottom}
   \@makeschapterhead{LIST OF TABLES}
   \par
   \hbox to \textwidth{\normalsize\bfseries
       \underbar{TABLE}\hfil\underbar{PAGE}}
   \@starttoc{lot}
   \end{singlespace}}

\def\l@table{
   \@dottedtocline{1}{3.5em}{4.0em}}
%    \end{macrocode}

%
% END FRONT MATTER
%

%
% BEGIN LISTS
%
% \section{Lists}
% \subsection{Enumerate}
%  Enumeration is done with four counters: enumi, enumii, enumiii
%  and enumiv, where enumN controls the numbering of the Nth level
%  enumeration.  The label is generated by the commands
%  \verb+\labelenumi+ ... \verb+\labelenumiv+.
% The expansion of \verb+\p@enumN\theenumN+ defines the
%  output of a \verb+\ref+ command.
%    \begin{macrocode}

\def\labelenumi{\theenumi.}
\def\theenumi{\arabic{enumi}}

\def\labelenumii{(\theenumii)}
\def\theenumii{\alph{enumii}}
\def\p@enumii{\theenumi}

\def\labelenumiii{\theenumiii.}
\def\theenumiii{\roman{enumiii}}
\def\p@enumiii{\theenumi(\theenumii)}

\def\labelenumiv{\theenumiv.}
\def\theenumiv{\Alph{enumiv}}
\def\p@enumiv{\p@enumiii\theenumiii}
%    \end{macrocode}
%
% \subsection{Itemize}
% Itemization is controlled by four commands:
% \verb+\labelitemi+,
% \verb+\labelitemii+,
% \verb+\labelitemiii+, and
% \verb+\labelitemiv+,
% which define the labels of the various
% itemization levels.
%    \begin{macrocode}
\def\labelitemi{$\bullet$}
\def\labelitemii{\bfseries --}
\def\labelitemiii{$\ast$}
\def\labelitemiv{$\cdot$}
%    \end{macrocode}
%
% \subsection{Verse}
%   The verse environment is defined by making clever use of the
%   list environment's parameters.  The user types \verb+\\+
%   to end a line.
%   This is implemented by \verb+\let'in \\ equal \@centercr+.
%    \begin{macrocode}
\def\verse{\let\\=\@centercr
  \list{}{\itemsep\z@ \itemindent -1.5em\listparindent \itemindent
          \rightmargin\leftmargin\advance\leftmargin 1.5em}\item[]}
\let\endverse\endlist
%    \end{macrocode}
%
% \subsection{Quotation}
%   Fills lines and indents paragraph.
%    \begin{macrocode}
\def\quotation{\list{}{\listparindent 1.5em
    \itemindent\listparindent
    \rightmargin\leftmargin\parsep 0pt plus 1pt}\item[]}
\let\endquotation=\endlist
%    \end{macrocode}
%
% \subsection{Quote}
% Same as quotation except no paragraph indentation,
%    \begin{macrocode}
\def\quote{\list{}{\rightmargin\leftmargin}\item[]}
\let\endquote=\endlist
%    \end{macrocode}
%
% \subsection{Description}
%  To change the formatting of the label, you must redefine
%  \verb+\descriptionlabel+.
%    \begin{macrocode}
\def\descriptionlabel#1{\hspace\labelsep \bfseries #1}

\def\description{\list{}{\labelwidth\z@ \itemindent-\leftmargin
    \let\makelabel\descriptionlabel}}

\let\enddescription\endlist

\newdimen\descriptionmargin
\descriptionmargin=3em
%    \end{macrocode}

%
% END LISTS
%

%
% BEGIN OTHER ENVIRONMENTS
%
% \section{Other Environments}
% \subsection{Equation numbering}
% Equations are numbered as two arabic numbers, separated by a period.
% The first number, to the left of the period, is the chapter number.
% The second number is a counter that is initialized to start at 1
% at the beginning of each chapter and is incremented for each new
% equation.  As an option, the command \verb+\abseqnumberingtrue+ will
% allow absolute rather than chapter-relative numbering.
%    \begin{macrocode}
\def\p@equation{Equation~}
\def\theequation{\ifabseqnumbering\arabic{equation}
\else\thechapter.\arabic{equation}\fi}
%    \end{macrocode}
%
% \subsection{Array and Tabular}
%    \begin{macrocode}
\arraycolsep 5pt     % Half the space between columns in an array environment.
\tabcolsep 6pt       % Half the space between columns in a tabular environment.
\arrayrulewidth .4pt % Width of rules in array and tabular environment.
\doublerulesep 2pt   % Space between adjacent rules in array or tabular env.
%    \end{macrocode}
%
% \subsection{Tabbing}
%    \begin{macrocode}
\tabbingsep \labelsep   % Space used by the \' command.  (See LaTeX manual.)
%    \end{macrocode}
%
% \subsection{Minipage}
%  \verb+\@minipagerestore+
%  is called upon entry to a minipage environment to
%  set up things that are to be handled differently inside a minipage
%  environment. In the current styles, it does nothing.
%
% \verb+\skip\@mpfootins+  plays same role for footnotes in a minipage as
% \verb+\skip\footins+ does for ordinary footnotes
%    \begin{macrocode}
\skip\@mpfootins = \skip\footins
%    \end{macrocode}
%
% \subsection{Framebox}
%    \begin{macrocode}
\fboxsep = 3pt % Space left between box and text by \fbox and \framebox.
\fboxrule = .4pt % Width of rules in box made by \fbox and \framebox.
%    \end{macrocode}
%

%
% END OTHER ENVIRONMENTS
%

%
% BEGIN CHAPTERS AND SECTIONS
%
% \subsection{Chapter}
% This changes the way chapter headings are printed. The size was reduced
% and it is centered instead of left justified.
% \verb+\@makechapterhead+ is used by \verb+\chapter+ and
% \verb+\@makeschapterhead+ is used by \verb+\chapter*+.
% The \verb+\chapter+ macro calls the \verb+\@chapter+ if \verb+\chapter+
% was used and calls the \verb+\@schapter+ if \verb+\chapter*+ was used.
%    \begin{macrocode}
\newcounter{chapter}                % The counter
\def\thechapter{\arabic{chapter}}   % Printed representation of counter.

\def\chapter{
   \clearpage              % Starts new page.
   \if@startedappendices
       \pagestyle{appendixcontinued}
       \if@multappendices
          \def\headmark{\vbox{
                {\hbox to \textwidth{\rmfamily\normalsize\hfil\thepage}}
                \vspace{\innerheadskip}
                {\hbox to \textwidth
                   {\hfil{\bfseries\large Appendix
                       \thechapter{} (Continued)}\hfil}}}}
       \else
          \def\headmark{\vbox{
                {\hbox to \textwidth{\rmfamily\normalsize\hfil\thepage}}
                \vspace{\innerheadskip}
                {\hbox to \textwidth
                   {\hfil{\bfseries\large APPENDIX (Continued)}\hfil}}}}
       \fi
       \thispagestyle{pageontop}
   \else
       \thispagestyle{pageonbottom}
                           % Page number of chapter page is on bottom
                           % except for appendix chapters, where it
                           % appears on top.
   \fi
   \global\@topnum\z@      % Prevents figures from going at top of page.
   \ifabseqnumbering\relax\else\setcounter{equation}{0}\fi
   \secdef\@chapter\@schapter}

\def\@schapter#1{
   \typeout{Unnumbered Chapter.}
   \@makeschapterhead{#1}
   \@afterheading}

\def\@chapter[#1]#2{
   \ifnum \c@secnumdepth > \m@ne
       \refstepcounter{chapter}
       \typeout{\@chapapp\space\thechapter.} % Msg to term
   \fi
   \if@startedappendices
      \if@multappendices
\addcontentsline{toc}{chapter}%
{\protect\xnumberline{\ }\ \ \ \ \ Appendix \thechapter}
      \else
\addtocontents{toc}{\protect\addvspace{\baselineskip}}
\addcontentsline{toc}{chapter}%
{\protect\xnumberline{\ }APPENDIX }
      \fi
   \else
\addtocontents{toc}{\protect\addvspace{\baselineskip}}
\addcontentsline{toc}{chapter}%
{\protect\xnumberline{\thechapter\hskip 2em}\uppercase{#1}}
   \fi
   \if@startedbodyyet         % Then do nothing
   \else
       \pagestyle{pageontop}
       \pagenumbering{arabic}
       \@startedbodyyettrue
   \fi
   \@makechapterhead{#2}
   \@afterheading}
%    \end{macrocode}
%
% The section of the code for \verb+\@chapter+ between
% \verb+\if@startedbodyyet+ and \verb+\fi+ was added so that when we call
% \verb+\chapter+ for the first time in the body of the macro, the
% page number will be reset to one and to roman.
% The \verb+\numberline+ command takes as an argument the section number
% and we need to change it. As defined in the
% \verb+report.sty+ is set so that the section numbers align to the left
% instead of the right.
%    \begin{macrocode}
\def\chaptermark#1{}

%    \end{macrocode}
%
% \subsubsection{Make Chapter Heading}
% \paragraph{Numbered Chapter Heading}
%    \begin{macrocode}
\def\@makechapterhead#1{
    {\parindent 0pt \centering
     \ifnum \c@secnumdepth > \m@ne     % If > -1 then write it
       \if@startedappendices
          \if@multappendices
             \large\transparentbold \@chapapp{} \thechapter\par
          \else
             \large\transparentbold APPENDIX\par
          \fi
       \else
          \large\transparentbold \@chapapp{} \thechapter\par
       \fi
       \vspace{20pt}
     \fi
       \large\transparentbold\uppercase{#1}\par
       \nobreak
       \vspace{20pt}}}
%    \end{macrocode}
%
% \paragraph{Unnumbered Chapter Heading}
%    \begin{macrocode}
\def\@makeschapterhead#1{
    {\parindent 0pt \centering
      \large\transparentbold\uppercase{#1}\par
      \nobreak
      \vspace{20pt}}}
%    \end{macrocode}
%
% \subsubsection{Appendix Chapters}
% \verb+\@chapapp+ is initially defined to be ``CHAPTER''.
% The \verb+\appendix+ command redefines it to be ``Appendix''.
%    \begin{macrocode}
\def\@chapapp{CHAPTER}

\def\appendix{\par
  \@startedappendicestrue
  \setcounter{chapter}{0}
  \setcounter{section}{0}
  \def\@chapapp{Appendix}
  \def\thechapter{\Alph{chapter}}}
%    \end{macrocode}
%
% If there are multiple appendix chapters, they are to be preceeded by
% a page with the word ``APPENDICES'' centered horizontally
% and vertically.
%    \begin{macrocode}
\def\appendices{
   \clearpage
   \thispagestyle{pageonbottom}
   \vspace*{3in}
   \begin{center}
   {\bfseries APPENDICES}
   \end{center}
   \@multappendicestrue
   \addtocontents{toc}{\protect\addvspace{\baselineskip}}
   \addcontentsline{toc}{chapter}
      {\protect\xnumberline{\ }APPENDICES}
   \vfill\eject}
%    \end{macrocode}
%
% \subsubsection{Table of Contents entry for Chapter}
% The entry in the table of contents does not include a dotted line.
% This is a change to remedy that.
%    \begin{macrocode}
\def\numberline#1{\hbox to 0.75in{#1\hss}}
\def\xnumberline#1{\hbox to\@tempdima{#1\hss}}

\def\l@chapter#1#2{
   \if@startedappendices
      \if@multappendices
         \@dottedtocline
            {0}            % appendix chapter like a section
            {8.0em}        % indentation of the entry in toc
            {3.2em}
            {Appendix \thechapter}
            {#2}
      \else
         \@dottedtocline
            {0}            % appendix chapter like a section
            {0.75in}        % indentation of the entry in toc
            {0.75in}
            {APPENDIX}
            {#2}
      \fi
   \else
      \@dottedtocline
         {0}            % chapter is level zero used by tocdepth
         {0.4in}        % indentation of the entry in toc
         {0.35in}        % width of the chapter number
         {\transparentbold #1} % title
         {#2}           % Page number
   \fi}
%    \end{macrocode}
%
% \subsection{Section}
% \subsubsection{Section Headings}
%    \begin{macrocode}
\newcounter{section}[chapter]                  % The counter
\def\thesection {\thechapter.\arabic{section}} %Printed representation.

\def\section{
     \@startsection{section}      % name of section and also name of
                                  % the counter.
                   {1}            % level, level 0 is chapter
                                  % (for report.sty)
                   {0 pt}         % Indentation from left margin.
                                  % It can be negative -$>$ moved into
                                  % the left margin.
                   {2 pt plus 3 pt minus 4 pt}
                                  % Skip before heading is printed.
                                  % see expl. above for neg. val.
                   {5 pt plus 1 pt minus 2 pt}
                                  % After heading skip. If negative
                                  % The text will be printed next
                                  % to the heading text leaving
                                  % the space (absolute value)
                                  % indicated. Don't use
                                  % zero as it will be printed on
                                  % the same line without any space
                                  % If negative remove stretch.
                    {\normalsize\bfseries}}
%    \end{macrocode}
%
% \subsubsection{Table of Contents entry for Section}
%    \begin{macrocode}
\def\l@section{
   \@dottedtocline
      {1}               % chapter is level zero used by tocdepth
      {0.75in}           % indentation of the entry in toc=
      {0.82in}}          % Indent + Space of l@chapter
%    \end{macrocode}
%
% \subsection{Subsection}
% \subsubsection{Subsection Headings}
%    \begin{macrocode}
\newcounter{subsection}[section]                    % The counter
\def\thesubsection{\thesection.\arabic{subsection}} % printed form

\def\subsection{%
     \@startsection{subsection}   % name of section and also name of
                                  % the counter.
                   {2}            % level, level 0 is chapter
                                  % (for report.sty)
                   {0 pt}         % Indentation from left margin.
                                  % It can be negative -$>$ moved into
                                  % the left margin.
                   {2 pt plus 3 pt minus 4 pt}
                                  % Skip before heading is printed.
                                  % see expl. above for neg. val.
                   {5 pt plus 1 pt minus 2 pt}
                                  % After heading skip. If negative
                                  % The text will be printed next
                                  % to the heading text leaving
                                  % the space (absolute value)
                                  % indicated. Don't use
                                  % zero as it will be printed on
                                  % the same line without any space
                                  % If negative remove stretch.
                    {\normalsize\bfseries}}
%    \end{macrocode}
%
% \subsubsection{Table of Contents entry for Subsection}
%    \begin{macrocode}
\def\l@subsection{
   \@dottedtocline
      {2}               % chapter is level zero used by tocdepth
      {0.75in}           % indentation of the entry in toc=
      {0.82in}}          % Indent + Space of l@section
%    \end{macrocode}
%
% \subsection{Subsubection}
% \subsubsection{Subsubsection Headings}
%    \begin{macrocode}
\newcounter{subsubsection}[subsection]        % The counter
\def\thesubsubsection{\thesubsection .\arabic{subsubsection}}

\def\subsubsection{%
     \@startsection{subsubsection} % name of section and also name of
                                  % the counter.
                   {3}            % level, level 0 is chapter
                                  % (for report.sty)
                   {0 pt}         % Indentation from left margin.
                                  % It can be negative -$>$ moved into
                                  % the left margin.
                   {2 pt plus 3 pt minus 4 pt}
                                  % Skip before heading is printed.
                                  % see expl. above for neg. val.
                   {5 pt plus 1 pt minus 2 pt}
                                  % After heading skip. If negative
                                  % The text will be printed next
                                  % to the heading text leaving
                                  % the space (absolute value)
                                  % indicated. Don't use
                                  % zero as it will be printed on
                                  % the same line without any space
                                  % If negative remove stretch.
                    {\normalsize\bfseries}}
%    \end{macrocode}
%
% \subsubsection{Table of Contents entry for Subsubsection}
%    \begin{macrocode}
\def\l@subsubsection{
   \@dottedtocline
      {3}               % chapter is level zero used by tocdepth
      {0.75in}           % indentation of the entry in toc=
      {0.82in}}          % Indent + Space of l@subsection
%    \end{macrocode}
% \subsection{Paragraph}
% \subsubsection{Paragraph Headings}
%    \begin{macrocode}
\newcounter{paragraph}[subsubsection]       % The counter.
\def\theparagraph{\thesubsubsection.\arabic{paragraph}}

\def\paragraph{%
     \@startsection{paragraph}    % name of section and also name of
                                  % the counter.
                   {4}            % level, level 0 is chapter
                                  % (for report.sty)
                   {0 pt}         % Indentation from left margin.
                                  % It can be negative -$>$ moved into
                                  % the left margin.
                   {2 pt plus 3 pt minus 4 pt}
                                  % Skip before heading is printed.
                                  % see expl. above for neg. val.
                   {5 pt plus 1 pt minus 2 pt}
                                  % After heading skip. If negative
                                  % The text will be printed next
                                  % to the heading text leaving
                                  % the space (absolute value)
                                  % indicated. Don't use
                                  % zero as it will be printed on
                                  % the same line without any space
                                  % If negative remove stretch.
                    {\normalsize\bfseries}}
%    \end{macrocode}
%
% \subsubsection{Table of Contents entry for Paragraph}
%    \begin{macrocode}
\def\l@paragraph{
   \@dottedtocline
      {4}               % chapter is level zero used by tocdepth
      {0.75in}           % indentation of the entry in toc=
      {0.82in}}            % Indent + Space of l@subsubsection
%    \end{macrocode}
%
% \subsection{Subparagraph}
% \subsubsection{Subparagraph Headings}
%    \begin{macrocode}
\newcounter{subparagraph}[paragraph]        % The counter
\def\thesubparagraph{\theparagraph.\arabic{subparagraph}}

\def\subparagraph{%
     \@startsection{subparagraph} % name of section and also name of
                                  % the counter.
                   {5}            % level, level 0 is chapter
                                  % (for report.sty)
                   {0 pt}         % Indentation from left margin.
                                  % It can be negative -$>$ moved into
                                  % the left margin.
                   {2 pt plus 3 pt minus 4 pt}
                                  % Skip before heading is printed.
                                  % see expl. above for neg. val.
                   {5 pt plus 1 pt minus 2 pt}
                                  % After heading skip. If negative
                                  % The text will be printed next
                                  % to the heading text leaving
                                  % the space (absolute value)
                                  % indicated. Don't use
                                  % zero as it will be printed on
                                  % the same line without any space
                                  % If negative remove stretch.
                    {\normalsize\bfseries}}
%    \end{macrocode}
%
% \subsubsection{Table of Contents entry for Subparagraph}
%    \begin{macrocode}
\def\l@subparagraph{
   \@dottedtocline
      {5}               % chapter is level zero used by tocdepth
      {0.75in}           % indentation of the entry in toc=
      {0.82in}}          % Indent + Space of l@paragraph
%    \end{macrocode}
%

%
% END CHAPTERS AND SECTIONS
%

%
% BEGIN BIBLIOGRAPHY
%
% \subsection{Bibliography}
%    \begin{macrocode}
\def\bibforma{\@bibformatrue\bibliographystyle{forma}}
\def\bibformb{\@bibformafalse\bibliographystyle{formb}}
\def\bibformc{\@bibformafalse\bibliographystyle{formc}}

\def\bibob{(}\def\bibcb{)}
\def\roundbrackets{\def\bibob{(}\def\bibcb{)}}
\def\squarebrackets{\def\bibob{[}\def\bibcb{]}}
\def\nobrackets{\def\bibob{}\def\bibcb{}}
\def\bibdatesep{,\ }
\def\bibmultisep{;}
\def\egrp/{\egroup}

 \def\@citex[#1]#2{\if@filesw\immediate\write\@auxout{\string\citation{#2}}\fi
  \def\@citea{}\@cite{\@for\@citeb:=#2\do
    {\@citea\def\@citea{\bibmultisep\penalty\@m\ }\@ifundefined
       {b@\@citeb}{{\bfseries ?}\@warning
       {Citation `\@citeb' on page \thepage \space undefined}}%
{\csname b@\@citeb\endcsname}}}{#1}}

\def\@cite#1#2{{#1\if@tempswa \bibdatesep #2\fi}}

\let\@internalcite\@citex

\def\cite{\@ifnextchar[{\@tempswatrue\@namecite}%
    {\@tempswafalse\@namecite[]}}

\def\@namecite[#1]#2{\bibob\def\citename##1{##1\bibdatesep}%
    \@internalcite[#1]{#2}\bibcb}

%% original
\def\@lbibitem[#1]#2{\item[]\if@filesw
      { \def\protect##1{\string ##1\space}\immediate
        \write\@auxout{\string\bibcite{#2}{#1}}}\fi\ignorespaces}

%% from one of the internets:
%% \makeatletter
%% \def\@lbibitem[#1]#2{%
%% \if\relax\@extra@b@citeb\relax\else
%% \@ifundefined{br@#2\@extra@b@citeb}{}{%
%% \@namedef{br@#2}{\@nameuse{br@#2\@extra@b@citeb}}}\fi
%% \@ifundefined{b@#2\@extra@b@citeb}{\def\NAT@num{}}{\NAT@parse{#2}}%
%% \item[\hfil\hyper@natanchorstart{#2\@extra@b@citeb}\citep{#2}%
%% \hyper@natanchorend]%
%% \NAT@ifcmd#1(@)(@)\@nil{#2}}
%% \makeatother



\def\bibliography#1{
   \clearpage
   \typeout{CITED LITERATURE.}
   \addtocontents{toc}{\protect\addvspace{\baselineskip}}
   \addcontentsline{toc}{chapter}
      {\protect\xnumberline{\ }CITED LITERATURE}
   \def\section@mark{CITED LITERATURE}
   \pagestyle{pageontop}
   \thispagestyle{pageonbottom}
   \@makeschapterhead{\section@mark}\par
   \begin{singlespace}
   \if@filesw\immediate\write\@auxout{\string\bibdata{#1}}\fi
   \@input{\jobname.bbl}
   \end{singlespace}}

\def\thebibliography#1{
   \if@bibforma
      \list{\relax}
         {\setlength{\labelsep}{0em}
          \setlength{\itemsep}{12pt}
          \setlength{\itemindent}{-2em}
          \setlength{\leftmargin}{2em}}
   \else
      \list{\arabic{enumi}.}
         {\settowidth\labelwidth{#1.}\leftmargin\labelwidth
          \advance\leftmargin\labelsep
          \advance\leftmargin 0.5in
          \setlength{\itemsep}{12pt}
          \itemindent -0.5in
          \usecounter{enumi}}
   \fi
   \def\newblock{\hskip .11em plus .33em minus .07em}
   \sloppy\clubpenalty4000\widowpenalty4000
   \sfcode`\.=1000\relax
   }

\def\endthebibliography{\endlist\pagestyle{pageontop}}
%    \end{macrocode}
%
% \subsection{Indexing}
%    \begin{macrocode}
\newif\if@restonecol
\def\theindex{
   \@restonecoltrue
   \if@twocolumn\@restonecolfalse\fi
   \columnseprule \z@
   \columnsep 35pt
   \clearpage
   \begin{singlespace}
   \def\section@mark{Index}
   \twocolumn[\@makeprelimhead]
   \parindent\z@
   \parskip\z@ plus .3pt\relax
   \let\item\@idxitem}

\def\@idxitem{\par\hangindent 40pt}
\def\subitem{\par\hangindent 40pt \hspace*{20pt}}
\def\subsubitem{\par\hangindent 40pt \hspace*{30pt}}
\def\endtheindex{\if@restonecol\onecolumn\else\clearpage\fi}
\def\indexspace{\par \vskip 10pt plus 5pt minus 3pt\relax}
%    \end{macrocode}

%
% END BIBLIOGRAPHY
%

% \subsection{Footnotes}
%    \begin{macrocode}
\def\footnoterule{
   \kern-3\p@
   \hrule width \columnwidth
   \kern 2.6\p@}

\@addtoreset{footnote}{chapter}

\long\def\@makefntext#1{\parindent 1em\noindent%
\hbox to 1.8em{\hss$^{\@thefnmark}$}#1}

\def\footnotesep{\baselineskip}

\def\footnote{\@ifnextchar[{\@xfootnote}%
{\@pagefn\xdef\@thefnmark{\thefootnote}\@footnotemark\@footnotetext}}
{\stepcounter{footnote}}

\def\footnotemark{%
\@ifnextchar[{\@xfootnotemark}%
{\@pagefn\xdef\@thefnmark{\thefootnote}\@footnotemark}}

\long\def\@footnotetext#1{%
\insert\footins{\singlespace\small%
\interlinepenalty\interfootnotelinepenalty%
\splittopskip\footnotesep%
\splitmaxdepth \dp\strutbox \floatingpenalty \@MM%
\hsize\columnwidth \@parboxrestore%
\edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}%
\@makefntext{\rule{\z@}{\footnotesep}\ignorespaces#1\strut}%
\endsinglespace}}

\def\@pagefn{%
\stepcounter{fnref}%
\@ifnewpage{\setcounter{footnote}{1}}%
{\stepcounter{footnote}}}

\def\@ifnewpage#1#2{\if@filesw {\let\thepage\relax
   \def\protect{\noexpand\noexpand\noexpand}%
\xdef\@tempg{\write\@auxout{\string\fnref{\the\c@fnref}
   {\thepage}}}\@tempg
\@iflastfnsamepage{#2}{#1}\else#2
   \if@nobreak \ifvmode\nobreak\fi\fi\fi}}
%    \end{macrocode}
%
% make sure that we are writing to an aux file
% thec@page is a macro not a counter it is not missing a '\'
% If they are not writing to an aux file simply
% increase the counter throughout the documents
%    \begin{macrocode}
\def\fnref#1#2{\expandafter\gdef\csname fn@#1\endcsname{#2}}

\def\@iflastfnsamepage#1#2{%
\edef\@tempa{fn@\the\c@fnref}%
\edef\this@fnpage{\expandafter\csname\@tempa\endcsname}%
\@tempcnta=\c@fnref%
\advance\@tempcnta by -1%
\edef\@tempa{fn@\the\@tempcnta}%
\edef\last@fnpage{\expandafter\csname\@tempa\endcsname}%
\ifx\last@fnpage\this@fnpage #1%
\else #2%
\fi}

\fnref{0}{-1}

\def\@fnfinish{%
\def\fnref##1##2{%
\def\@tempa{##2}%
\edef\@tempb{\csname fn@##1\endcsname}
\if\@tempa\@tempb
\else
\if@nowarning\@warning{Some of the footnotes might have moved.
                                  Rerun to fix the output}
\@nowarningfalse\fi\fi}}
%    \end{macrocode}
%
% In order to be able to check if the footnotes have moved, and to print
% the warning, we need to redefine the \verb+\enddocument+ environment.
%    \begin{macrocode}
\let\fn@save@enddocument=\enddocument      % save a copy of enddocument
\def\enddocument{\@fnfinish\fn@save@enddocument}
%    \end{macrocode}
%
% Increase the space between last line of text and footnote rule.
%   This is a very untidy way to do it!
%    \begin{macrocode}
\skip\footins 20pt plus4pt minus4pt
%    \end{macrocode}
%
% Reset baselinestretch within footnotes and floats.
%    \begin{macrocode}

%%
%% Workaround for figures and color packages conflicts
%% Taken from https://latex.org/forum/viewtopic.php?f=45&t=4766&start=10#p33170
%%

\makeatletter
\let\my@xfloat\@xfloat
\makeatother

\makeatletter
\def\@xfloat#1[#2]{
	\my@xfloat#1[#2]%
	\def\baselinestretch{1}%
	\@normalsize \normalsize
}
\makeatother

%%
%% Previous code
%%

%\def\@xfloat#1[#2]{
%   \ifhmode \@bsphack\@floatpenalty -\@Mii
%   \else \@floatpenalty-\@Miii\fi
%   \def\@captype{#1}
%   \ifinner
%      \@parmoderr\@floatpenalty\z@
%   \else\@next\@currbox\@freelist{\@tempcnta\csname ftype@#1\endcsname
%      \multiply\@tempcnta\@xxxii\advance\@tempcnta\sixt@@n
%         \@tfor \@tempa :=#2\do
%                     {\if\@tempa h\advance\@tempcnta \@ne\fi
%                      \if\@tempa t\advance\@tempcnta \tw@\fi
%                      \if\@tempa b\advance\@tempcnta 4\relax\fi
%                      \if\@tempa p\advance\@tempcnta 8\relax\fi}
%         \global\count\@currbox\@tempcnta}\@fltovf\fi
%   \global\setbox\@currbox\vbox\bgroup
%   \def\baselinestretch{1}\small\normalsize
%   \hsize\columnwidth \@parboxrestore}

%    \end{macrocode}
