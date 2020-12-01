%---------------------------------------------------------------------------------------%
% LaTeX Cover Letter Template - cls file
% Author: Lillian Chen
% Date Updated: Dec 1 2020
%---------------------------------------------------------------------------------------%

%----------------------------------------------------------------------------------------
%	PACKAGES & DOCUMENT CONFIGURATIONS
%----------------------------------------------------------------------------------------

\ProvidesClass{coverletter}[Dec 1 2020 Cover Letter v1]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type
\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage[none]{hyphenat} % Prevent hyphenation
\usepackage{fontspec} % Allows use of pre-installed fonts in Overleaf
\pagestyle{empty} % Suppress page numbers
\linespread{0.9} % Defines line spacing

%----------------------------------------------------------------------------------------
%	USER-DEFINED SKIP COMMANDS
%----------------------------------------------------------------------------------------

% Options for size of whitespace/skips: \smallskip, \medskip or \bigskip
\def\namesize{\huge} % Size of the name in the header
\def\addressskip{\vspace{-0.15em}} % The space between address/contact lines
\def\headlineskip{\medskip} % The space above the horizontal line for each section 
\def\nameskip{\smallskip} % The space after your name at the top
\def\headskip{\smallskip} % The space after the heading section

%----------------------------------------------------------------------------------------
%	HEADER COMMANDS
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}} % Defines the \name command to set the name
\def \@name {} % Sets \@name to empty by default

\def \addressSep {$\diamond$} % Sets address separator to diamond symbol

% Up to 3 address/contact lines can be specified in the header
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% defines the number of address lines printed based on how many are specified
\def \address #1{
  \@ifundefined{@addressone}{
    \def \@addressone {#1}
  }{
  \@ifundefined{@addresstwo}{
  \def \@addresstwo {#1}
  }{
  \def \@addressthree {#1}
  }}
}

% defines \printaddress for stylizing an address if defined
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

% defines \printname to print the name in all caps as a page header
\def \printname {
  \begingroup
    \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
    \nameskip\break
  \endgroup
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADER/HEADING LINES
%----------------------------------------------------------------------------------------

% prints header with the use of the \document command 

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  \printname % Print the name specified with \name
  \@ifundefined{@addressone}{}{ % Print the first address/contact if specified
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{ % Print the second address/contact if specified
    \printaddress{\@addresstwo}}
  \@ifundefined{@addressthree}{}{ % Print the third address/contact if specified
    \printaddress{\@addressthree}}
\headskip
\headlineskip
\hrule % Horizontal line after the header
}

%----------------------------------------------------------------------------------------
%	COMPANY/EMPLOYER ADDRESS COMMANDS
%----------------------------------------------------------------------------------------

% defines company name stylization, change the font sizes as necessary
\newcommand{\companyname}[1]{\raggedright \fontsize{13pt}{14pt}\selectfont {#1 \\} \normalfont}

\newcommand{\companyaddress}[1]{\raggedright \fontsize{11pt}{13pt}\selectfont {#1 \\}\mbox{}\\\mbox{}\\ \normalfont}

\newcommand{\currentdate}[1]{\raggedleft \fontsize{11pt}{13pt}{#1 \\} \normalfont}


%----------------------------------------------------------------------------------------
%	LETTER CONTENT COMMANDS
%----------------------------------------------------------------------------------------

% defines \lettercontent stylization for each new body paragraph/line in the letter
\newcommand{\lettercontent}[1]{\raggedright \fontsize{11pt}{13pt}\selectfont {#1 \\}\mbox{}\\ \normalfont}

% defines \closing stylization
\newcommand{\closing}[1]{\raggedright \fontsize{11pt}{13pt}\selectfont {#1 \\}\mbox{}\\ \normalfont}

% defines \signature stylization
% For list of all possible pre-installed fonts for the signature, refer to this pdf published by Overleaf:
% (https://www.overleaf.com/latex/examples/fontspec-all-the-fonts/hjrpnxhrrtxc)
\newcommand{\signature}[1]{\raggedright {\fontspec{Elegante} \huge #1} \normalfont}