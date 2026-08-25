%
% CUEDthesis v1.1 (Fiel al original - Adaptado para Tectonic/XeTeX)
% By Harish Bhanderi <harish.bhanderi@cantab.net
% Version 1.0 released 15/07/2002
% Version 1.1 released 14/07/2010
%-------------------------- identification ---------------------
\ProvidesClass{CUEDthesisPSnPDF}[2010/07/14 v1.1 CUED thesis class]

%-------------------------- initial code -----------------------
\newif\ifCU@bookmode
\CU@bookmodetrue

\DeclareOption{report}{\CU@bookmodefalse}
\DeclareOption{book}{\CU@bookmodetrue}
\ProcessOptions\relax%

\ifCU@bookmode
    \DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}%
    \ProcessOptions\relax%
    \LoadClass[a4paper]{book}%
\else
    \DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}%
    \ProcessOptions\relax%
    \LoadClass[a4paper]{report}%
\fi

\usepackage{setspace}
\usepackage{tocbibind}
\usepackage{amssymb}
\usepackage{graphicx}
\usepackage{fancyhdr}
\usepackage{eucal}
\usepackage[spanish, es-tabla]{babel}
\usepackage[usenames, dvipsnames]{color}
\usepackage[perpage]{footmisc}
\usepackage[square, sort, numbers]{natbib}
\usepackage{ifthen}
\usepackage{ifpdf}
\usepackage{ifxetex}

% Bibliography
\renewcommand{\bibname}{Referencias}

% Nomenclature
\usepackage{nomencl}
\makenomenclature
\renewcommand\nomgroup[1]{%
  \ifthenelse{\equal{#1}{A}}{%
   \item[\textbf{Roman Symbols}] }{%
    \ifthenelse{\equal{#1}{G}}{%
     \item[\textbf{Greek Symbols}]}{%
      \ifthenelse{\equal{#1}{R}}{%
        \item[\textbf{Superscripts}]}{%
          \ifthenelse{\equal{#1}{S}}{%
           \item[\textbf{Subscripts}]}{{%
        \ifthenelse{\equal{#1}{X}}{%
         \item[\textbf{Other Symbols}]}{{%
        \ifthenelse{\equal{#1}{Z}}{%
         \item[\textbf{Acronyms}]}%
                          {{}}}}}}}}}}

% Configuración de hyperref (adaptada sin romper controladores modernos)
\usepackage[
    plainpages = false,
    pdfpagelabels,
    bookmarks = true,
    bookmarksopen = true,
    bookmarksnumbered = true,
    breaklinks = true,
    linktocpage,
    pagebackref,
    colorlinks = true,
    linkcolor = blue,
    urlcolor  = blue,
    citecolor = red,
    anchorcolor = green
]{hyperref}

\DeclareGraphicsExtensions{.png, .jpg, .pdf, .eps}
\graphicspath{{ThesisFigs/PNG/}{ThesisFigs/PDF/}{ThesisFigs/EPS/}{ThesisFigs/}}

%========================================================================
% LAYOUT Y MÁRGENES NATIVOS EXACTOS DEL ORIGINAL
%========================================================================
\setlength{\paperheight}{297mm}
\setlength{\paperwidth}{210mm}

\setlength{\hoffset}{0.00cm}
\setlength{\voffset}{0.00cm}

\setlength{\evensidemargin}{1.96cm}
\setlength{\topmargin}{1mm}
\setlength{\headheight}{1.36cm}
\setlength{\headsep}{1.00cm}
\setlength{\textheight}{20.84cm}
\setlength{\textwidth}{14.5cm}
\setlength{\marginparsep}{1mm}
\setlength{\marginparwidth}{3cm}
\setlength{\footskip}{2.36cm}
%========================================================================

\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\thechapter. #1}{}}
\renewcommand{\sectionmark}[1]{}
\fancyhf{}
\fancyhead[RO]{\bfseries\rightmark}
\fancyhead[LE]{\bfseries\leftmark}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
\addtolength{\headheight}{0.5pt}
\fancypagestyle{plain}{
  \fancyhead{}
  \renewcommand{\headrulewidth}{0pt}
}

\newcommand{\submittedtext}{{}}

% DECLARATIONS
\def\degreedate#1{\gdef\@degreedate{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\collegeordept#1{\gdef\@collegeordept{#1}}
\def\university#1{\gdef\@university{#1}}
\def\crest#1{\gdef\@crest{#1}}

\newenvironment{alwayssingle}{%
       \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
       \else\newpage\fi}
       {\if@restonecol\twocolumn\else\newpage\fi}

% Layout Portada
\renewcommand{\maketitle}{%
\begin{alwayssingle}
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
  \begin{center}
    { \Huge {\bfseries {\@title}} \par}
{\large \vspace*{35mm} {{\@crest} \par} \vspace*{25mm}}
    {{\Large \@author} \par}
{\large \vspace*{1ex}
    {{\@collegeordept} \par}
\vspace*{1ex}
    {{\@university} \par}
\vspace*{25mm}
    {{\submittedtext} \par}
\vspace*{1ex}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@degreedate}}
  \end{center}
  \null\vfill
\end{alwayssingle}}

% Entornos
\newenvironment{dedication}
{\begin{alwayssingle}
  \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\LARGE }
  \end{center}
  \vspace{0.5cm}
  \begin{quote} \begin{center}}
{\end{center} \end{quote} \end{alwayssingle}}

\newenvironment{acknowledgements}
{\pagestyle{empty}
\begin{alwayssingle}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Agradecimientos}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}

\newenvironment{acknowledgementslong}
{\pagestyle{empty}
\begin{alwayssingle}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Agradecimientos}
\end{center}
\vspace{0.5cm}\begin{quote}}
{\end{quote}\end{alwayssingle}}

\newenvironment{abstracts} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries Abstract}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}

\newenvironment{resumen} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries Resumen}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}

\newenvironment{abstractslong} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries Abstract}
  \end{center}
  \vspace{0.5cm} 
  \begin{quote}}
{\end{quote}\end{alwayssingle}}

\newenvironment{abstractseparate} {\begin{alwayssingle} \pagestyle{empty}
  \vspace*{-1in}
 \begin{center}
    { \Large {\bfseries {\@title}} \par}
    {{\large \vspace*{1ex} \@author} \par}
{\large \vspace*{1ex}
    {{\@collegeordept} \par}
    {{\@university} \par}
\vspace*{1ex}
    {{\it \submittedtext} \par}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@degreedate}}
  \end{center}}
{\end{alwayssingle}}

\newenvironment{romanpages}
{\setcounter{page}{1}
  \renewcommand{\thepage}{\roman{page}}}
{\newpage\renewcommand{\thepage}{\arabic{page}}}

%========================================================================
% MODIFICACIONES NATIVAS PARA APÉNDICES Y FORMATO DE TOC
%========================================================================
\makeatletter

% 1. Formato general del TOC para capítulos normales (sin el punto tras el número)
\renewcommand{\numberline}[1]{#1\hspace{.8em}}

% 2. Comando para activar el modo de Apéndices
\newcommand{\activarApendicesManuales}{%
  % Desactiva la 'A.' en la Tabla de Contenidos ajustando \l@chapter
  \renewcommand*\l@chapter[2]{%
    \ifnum \c@tocdepth >\m@ne
      \addpenalty{-\@highpenalty}%
      \vskip 1.0em \@plus\p@
      \setlength\@tempdima{1.5em}%
      \begingroup
        \parindent \z@ \rightskip \@pnumwidth
        \parfillskip -\@pnumwidth
        \leavevmode \bfseries
        \advance\leftskip\@tempdima
        \hskip -\leftskip
        ##1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss ##2}\par
        \penalty\@highpenalty
      \end{group}%
    \fi
  }%
  % En el cuerpo del documento: no imprime la "A" gigante automática arriba
  \def\@makechapterhead##1{%
    \vspace*{50\p@}%
    {\parindent \z@ \raggedright \normalfont
      \interlinepenalty\@M
      \Huge \bfseries ##1\par\nobreak
      \vskip 40\p@
    }}%
  % Formato de contadores de Tablas/Figuras (Tabla A.1, Figura A.1)
  \setcounter{table}{0}%
  \setcounter{figure}{0}%
  \setcounter{equation}{0}%
  \gdef\thetable{\thechapter.\arabic{table}}%
  \gdef\thefigure{\thechapter.\arabic{figure}}%
  \gdef\theequation{\thechapter.\arabic{equation}}%
}

% Forzar que babel ejecute nuestro parche SIEMPRE que se llame a \appendix
\AtBeginDocument{%
  \g@addto@macro\appendix{\activarApendicesManuales}%
}

\makeatother
