%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template. 
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage[none]{hyphenat} % Prevent hyphenation
\usepackage{fontspec} % Allows use of cool fonts

\pagestyle{empty} % Suppress page numbers
\linespread{0.9}
%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

\def \addressSep {$\diamond$} % Set default address separator to a diamond

% One, two or three address lines can be specified 
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
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

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

% \printname is used to print the name as a page header
\def \printname {
  \begingroup
    \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
    \nameskip\break
  \endgroup
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADER/HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  \printname % Print the name specified with \name
  \@ifundefined{@addressone}{}{ % Print the first address if specified
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{ % Print the second address if specified
    \printaddress{\@addresstwo}}
  \@ifundefined{@addressthree}{}{ % Print the third address if specified
    \printaddress{\@addressthree}}
\sectionskip
\sectionlineskip
\hrule % Horizontal line
}


% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\huge} % Size of the name at the top of the document
\def\addressskip{\vspace{-0.15em}} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\medskip} % The space above the horizontal line for each section 
\def\nameskip{\smallskip} % The space after your name at the top
\def\sectionskip{\smallskip} % The space after the heading section


%----------------------------------------------------------------------------------------
%	COMPANY/EMPLOYER ADDRESS COMMANDS
%----------------------------------------------------------------------------------------

\newcommand{\companyname}[1]{\raggedright \fontsize{13pt}{14pt}\selectfont {#1 \\} \normalfont}

\newcommand{\companyaddress}[1]{\raggedright \fontsize{11pt}{13pt}\selectfont {#1 \\}\mbox{}\\\mbox{}\\ \normalfont}

\newcommand{\currentdate}[1]{\raggedleft \fontsize{11pt}{13pt}{#1 \\} \normalfont}


%----------------------------------------------------------------------------------------
%	LETTER CONTENT COMMANDS
%----------------------------------------------------------------------------------------

% Letter content command
\newcommand{\lettercontent}[1]{\raggedright \fontsize{11pt}{13pt}\selectfont {#1 \\}\mbox{}\\ \normalfont}

\newcommand{\closing}[1]{\raggedright \fontsize{11pt}{13pt}\selectfont {#1 \\}\mbox{}\\ \normalfont}

% For list of all possible pre-installed fonts for the signature, refer to this pdf published by Overleaf:
% (https://www.overleaf.com/latex/examples/fontspec-all-the-fonts/hjrpnxhrrtxc)
\newcommand{\signature}[1]{\raggedright {\fontspec{Elegante} \huge #1} \normalfont}