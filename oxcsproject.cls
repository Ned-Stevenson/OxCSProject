% OxCSProject

% Originally by Keith A. Gillow (gillow@maths.ox.ac.uk), 1997
% Modified by Sam Evans (sam@samuelevansresearch.org), 2007
% Modified by John McManigle (john@oxfordechoes.com), 2015
% Adapted by Ned Stevenson (edward.stevenson@cs.ox.ac.uk), 2024
%
% This version Copyright (c) 2024 Ned Stevenson
%
% Broad permissions are granted to use, modify, and distribute this software
% as specified in the MIT License included in this distribution's LICENSE file.


% -------------------------- identification ---------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{oxcsproject}[2024/09/25 Oxford Computer Science project]
% -------------------------- initial code -----------------------

\LoadClass[a4paper, 12pt]{article}

% NS - Declares a new boolean called draft we can use to say if we're rendering a draft (includes
% things like the todo list and builds faster) or not. Initially false. Similar with the final flag
\newif\ifdraft
  \newif\iffinal

    % NS - If we receive the draft option, then set the relevant flag. Same for final option.
    \DeclareOption{draft}{\drafttrue}
    \DeclareOption{final}{\finaltrue}
    \DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
    \ProcessOptions\relax

    \setlength{\parskip}{0pt plus 1pt}
    \setlength{\parfillskip}{0pt plus .7\textwidth}

    % JEM: Lengths for single spacing (ie separate abstract, captions), front matter (abstract,
    % acknowledgements, table of contents, etc), and main body text.
    \newlength{\singlebaselineskip}
    \newlength{\frontmatterbaselineskip}
    \newlength{\textbaselineskip}

    \setlength{\singlebaselineskip}{\baselineskip}
    \setlength{\frontmatterbaselineskip}{17pt plus1pt minus1pt}
    \setlength{\textbaselineskip}{22pt plus2pt}

    % DECLARATIONS These macros are used to declare arguments needed for the construction of the
    % title page and other preamble.

    % The year and term the project is submitted in
    \def\degreedate#1{\gdef\@degreedate{#1}}
    % The name of the degree
    \def\degree#1{\gdef\@degree{#1}}
    % Your candidate number
    \def\candidateno#1{\gdef\@candidateno{#1}}
    % Your word count
    \def\wordcount#1{\gdef\@wordcount{#1}}

    % CRESTS 

    \def\crest{{\includegraphics{figures/beltcrest.pdf}}}

    % Define text area of page and margin offsets 

    \usepackage[hmargin={3.1cm, 3.1cm}, vmargin={3.1cm,3.1cm}]{geometry}

    % NS - If we're using the todonotes, then give them some extra margin space
    \iffinal
    \else
      \setlength{\marginparwidth}{2.7cm}
    \fi

    \usepackage{microtype}
    \usepackage{nicefrac}
    \usepackage{xfrac}
    \usepackage{amsmath}
    \usepackage{amssymb}
    \usepackage{textcomp}

    \usepackage{setspace}
    \doublespacing
    % Easily sets the line spacing for double spaced by default. Can be overriden as needed

    \usepackage{graphicx}
    % A critical package for including figures in our writeup
    \graphicspath{{./figures/}}

    \usepackage{longtable}
    % Allows tables to span multiple pages (this package must be called before hyperref)

    \usepackage[font=small,labelfont=bf]{caption}
    % Nicer captions

    \usepackage{multicol,multirow,array}
    % Used to make multiple columns for the indices and for creating columns that span multiple
    % rows in tables

    \usepackage{rotating}
    % To allow tables in landscape mode

    \usepackage{booktabs}
    % For better looking tables

    \usepackage{pdfpages}
    % Allows multi-page pdfs to be inserted as graphics

    % \usepackage{enumerate} Allows different numbering styles for Lists to use:
    % \begin{enumerate}[x] \item text \end{enumerate} where x is: A uppercase letters (as produced
    % by \Alph) a lowercase letters (as produced by \alph) I uppercase roman numerals (as produced
    % by \Roman) i lowercase roman numerals (as produced by \roman) 1 arabic numbers (as produced
    % by \arabic)

    % JEM the following package allows changing spacing in lists (for acknowledgements)
    \usepackage{enumitem}

    % JEM the following allows table columns aligned by decimal point
    \usepackage{dcolumn}
    \newcolumntype{d}[3]{D{.}{\cdot}{#1} }

    \usepackage{appendix}
    % For helping format appendicies
    \usepackage{notoccite}
    % To format the bibliography 

    % NS - Links are disabled for draft builds. Don't put the boxes around them in the final
    % version
    \usepackage[colorlinks=false,pdfpagelabels,\iffinal{hidelinks}\fi]{hyperref}
  % for linking between references, figures, TOC, etc in the pdf document

  % Lets us put in convenient todo labels. Don't show on the final result
  \usepackage[colorinlistoftodos, \iffinal{disable}\fi]{todonotes}

\usepackage{xcolor}
% Lets us define named colours. Used below in the code listing setup

\usepackage{listings}
% Lets us easily show code in our appendix. The following is defining the styling for that

\definecolor{codegreen}{rgb}{0, 0.6, 0}
\definecolor{codegray}{rgb}{0.5, 0.5, 0.5}
\definecolor{codepurple}{rgb}{0.58, 0, 0.82}

% NS - Number style is the style of the line numbers, not numbers within the code. 
\lstdefinestyle{codeStyle}{
  commentstyle=\color{codegreen},
  keywordstyle=\color{magenta},
  numberstyle=\tiny\color{codegray},
  stringstyle=\color{codepurple},
  basicstyle=\ttfamily\footnotesize,
  breakatwhitespace=false,
  breaklines=true,
  captionpos=b,
  keepspaces=true,
  numbers=left,
  numbersep=5pt,
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  tabsize=2,
  frame=leftline,
}

\lstset{style=codeStyle}

% Environments 

% This macro define an environment for front matter that is always single column even in a
% double-column document.

\newenvironment{preamblepage}{\singlespacing}{\newpage\thispagestyle{empty}\doublespacing}

% define title page layout

\renewcommand{\maketitle}{
  \begin{preamblepage}\null
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
    \begin{center}
      \vspace*{-3ex}
      { \LARGE {\bfseries {\@title}} \par}
      {\large \vspace*{25mm} {\crest \par} \vspace*{20mm}}
      {{\Large Candidate no.\ \@candidateno} \par}
      {\large \vspace*{1ex}
      {Word count: {\@wordcount} \par}
      \vspace*{5ex}
      {\it {\@degree} \par}
      \vspace*{2ex}
      {\@degreedate} \par}
      \ifdraft
        \vspace*{5ex}
        \Large{\bf DRAFT}
      \fi
    \end{center}
    \vfill\null
  \end{preamblepage}}

% ACKNOWLEDGEMENTS The acknowledgements environment puts a large, bold, centered "Acknowledgements"
% label at the top of the page. The acknowledgements themselves appear in a quote environment, i.e.
% tabbed in at both sides, and on its own page.

\newenvironment{acknowledgements}
{   \begin{preamblepage}\section*{Acknowledgements}
    \thispagestyle{empty}
    \pagestyle{empty}
    }
    {\end{preamblepage}}

% ABSTRACT The abstract environment puts a large, bold, centered "Abstract" label at the top of the
% page. The abstract itself appears in a quote environment, i.e. tabbed in at both sides, and on
% its own page.

\renewenvironment{abstract}
{   \begin{preamblepage}\section*{Abstract}
    \thispagestyle{empty}
    \pagestyle{empty}
    }
    {\end{preamblepage}}

% ROMANPAGES The romanpages environment set the page numbering to lowercase roman one for the
% contents and figures lists. It also resets page-numbering for the remainder of the dissertation
% (arabic, starting at 1). Edited by JEM

\newenvironment{romanpages}
{\setcounter{page}{1}\renewcommand{\thepage}{\roman{page}}}
{\setcounter{page}{1}\renewcommand{\thepage}{\arabic{page}}}

% Figure placement on page This is to help prevent too many figures on their own pages. I got it
% from: http://dcwww.camd.dtu.dk/~schiotz/comp/LatexTips/LatexTips.html#captfont

\renewcommand{\topfraction}{0.85}
\renewcommand{\textfraction}{0.1}
\renewcommand{\floatpagefraction}{0.75}

\usepackage[nottoc]{tocbibind}
% Used for inserting the Bibliography, List of Figures, indices, etc into the table of contents.

% JEM: Allow flexible spacing after figures, to reduce other stretching
\setlength{\textfloatsep}{20pt plus15pt minus4pt}

% JEM: All of this is so that headers in these sections aren't uppercase
\let\@ldtoc\tableofcontents
\renewcommand*\tableofcontents{{
      \renewcommand*\MakeUppercase[1]{##1}\@ldtoc}}

\let\@ldbib\bibliography
\renewcommand*\bibliography[1]{{
      \renewcommand*\MakeUppercase[1]{##1}\@ldbib{#1}}}

% JEM: for crazy multi character set quotes and Unicode and all
\usepackage{lmodern}
\usepackage[LGR,TS1,T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[english]{babel}
\usepackage{csquotes}
\hyphenpenalty=500
\def\longs{{\fontencoding{TS1}\selectfont s}}

% JEM: combine all of the commands you run before appendices start

\newcommand{\startappendices}{
  \appendix
  \appendixpage
  \addappheadtotoc
  % Excludes appendix subheadings from the table of contents
  \addtocontents{toc}{\protect\setcounter{tocdepth}{1}}
}
