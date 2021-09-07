% Custom document class specification
% Roberto Masocco <robmasocco@gmail.com>
% July 26, 2021

% CLASS DEFINITION AND PARAMETERS
\NeedsTeXFormat{LaTeX2e}[2003/01/20]
\newcommand{\classname}{TorVergata_MT}
\ProvidesClass{\classname}[2021/07/26 University of Rome Tor Vergata]
\providecommand{\baseclass}{book}
\usepackage[utf8]{inputenc} % Required for inputting international characters
\usepackage[T1]{fontenc} % Output font encoding for international characters
\usepackage[sc]{mathpazo} % Use the Palatino font by default
\RequirePackage{etoolbox}
\RequirePackage{xparse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}
\ProcessOptions\relax
\LoadClass{\baseclass}

% Simple interface for the user to customize the chapter, section ... titles 
\usepackage{titlesec}
\titleformat{\chapter}[block]{\centering\bfseries\fontsize{16}{16}\selectfont}{\MakeUppercase{\chaptertitlename}\,\thechapter \vspace{0cm}\\}{0pt}{\MakeUppercase}
\titlespacing*{\chapter}{0pt}{-1.8cm}{0.5cm}
\titlespacing{\section}{0pt}{0.5cm}{0cm}
\titlespacing{\subsection}{0pt}{0.5cm}{0cm}
\titleformat{\subsection}
{\fontsize{14}{14}\selectfont\bfseries}{\thesubsection}{0.5em}{}

% Modify the chapter header in the table of contents
\usepackage{titletoc}
\newcommand{\setupname}[1][\chaptername]{\titlecontents{chapter}[0pt]{}{\bfseries#1~\thecontentslabel:\,}{\bfseries}{\bfseries\hfill\contentspage}[]}

% REQUIRED PACKAGES
\RequirePackage{babel} % Required for automatically changing names of document elements to languages besides english
\RequirePackage{scrbase} % Required for handling language-dependent names of sections/document elements
\RequirePackage{scrhack} % Loads fixes for various packages
\RequirePackage{setspace} % Required for changing line spacing
\RequirePackage{longtable} % Required for tables that span multiple pages (used in the symbols, abbreviations and physical constants pages)
\RequirePackage{siunitx} % Required for \SI commands
\RequirePackage{graphicx} % Required to include images
\graphicspath{{Figures/}{./}} % Specifies where to look for included images
\RequirePackage{booktabs} % Required for better table rules
\RequirePackage{caption} % Required for customising the captions
\captionsetup{justification=centerlast,font=small,labelfont=sc,margin=50pt}

% DEFINE CUSTOM THESIS INFORMATION COMMANDS
\NewDocumentCommand{\thesistitle} {o m}{%
	\IfValueTF{#1}{\def\shorttitle{#1}}{\def\shorttitle{#2}}%
	\def\@title{#2}%
	\def\ttitle{#2}%
}
\DeclareDocumentCommand{\Candidate}{m}{\newcommand{\candidatename}{#1}\renewcommand{\@author}{#1\,}}
\NewDocumentCommand{\FirstSupervisor}{m}{\newcommand{\fstsupname}{#1\,}}
\NewDocumentCommand{\SecondSupervisor}{m}{\newcommand{\sndsupname}{#1\,}}
\NewDocumentCommand{\Coordinator}{m}{\newcommand{\coord}{#1\,}}
\NewDocumentCommand{\AcademicYear}{m}{\newcommand{\AY}{#1\,}}
\NewDocumentCommand{\Specialist}{m}{\newcommand{\Sp}{#1\,}}
\NewDocumentCommand{\Department}{m}{\newcommand{\Dep}{#1\,}}
\NewDocumentCommand{\Cycle}{m}{\newcommand{\Cyc}{#1\,}}

% MARGINS
\RequirePackage{geometry}
\geometry{
	includehead,
	includefoot}
\raggedbottom

% HEADERS AND FOOTERS
\usepackage{fancyhdr}
\usepackage{fourier-orns}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[R]{\rightmark}
\fancyhead[L]{\leftmark}
\fancyfoot[R]{\thepage}
\renewcommand{\sectionmark}[1]{\markright{#1}}
\renewcommand{\headrulewidth}{0.3pt}
\headheight=15pt

% Pagestyle for frontmatter, mainmatter and backmatter
\appto\frontmatter{\pagestyle{plain}}                                       
\appto\mainmatter{\pagestyle{fancy}}                                     
\appto\backmatter{\pagestyle{plain}}                   
\endinput
