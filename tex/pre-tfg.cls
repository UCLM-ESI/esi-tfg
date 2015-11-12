% -*- coding: utf-8 -*-

% pre-tfg.cls
%
% Copyright © 2013 David Villa Alises
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pre-tfg}[2011/05/16 Anteproyecto del Trabajo Fin de Grado]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\PassOptionsToClass{a4paper, 12pt, oneside, openright}{article}
\ProcessOptions\relax
\LoadClass{article}

\makeatletter

\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[spanish]{babel}
\usepackage{times}

\usepackage[left=30mm, right=20mm, top=20mm, bottom=20mm]{geometry}

\usepackage[%
  colorlinks=true,
  linkcolor=black,
  citecolor=blue,
  urlcolor=blue]{hyperref}

\usepackage[pdftex]{graphicx}
\graphicspath{{figures/}{/usr/share/arco/figures/}}


%--- help
\usepackage{xifthen}
\newboolean{showhelp}
\newcommand{\showhelp}{\setboolean{showhelp}{true}}

\newcommand{\helpfootnote}[1]{
  \ifthenelse{\boolean{showhelp}}{\footnote{#1}}{}
}

%---

\usepackage{setspace}
\usepackage{atbeginend}

%--- section style ---
\usepackage{titlesec}

\titleformat{\section}
{\large\bfseries\sffamily}{\thesection.}{.3cm}{}

\titlespacing{\section}{0pt}{0pt}{-0.2cm}
\titlespacing{\subsection}{0pt}{0pt}{-0.2cm}

%--- page style ---
\newcommand{\UCLMhead}{
  \setlength{\unitlength}{1cm}
  \begin{picture}(0,0)
    \put(-1.3,-2.00){
      \includegraphics[height=2.8cm]{uclm_logo.pdf}}
  \end{picture}
}

\newcommand{\ESIhead}{
  \setlength{\unitlength}{1cm}
  \begin{picture}(0,0)
    \put(-4,-1.5){
      \includegraphics[height=1.6cm]{esi.pdf}}
  \end{picture}
}

\newpagestyle{firstpage}[\small\sffamily]{
  \sethead{\UCLMhead{}} %
          {} %
          {\ESIhead{}}
}

\newpagestyle{main}[\small\sffamily]{
  \sethead{}{}{}
  \setfoot{}{\thepage{}}{}
}

%--- lists ---
\usepackage{enumitem}
\setlist[itemize,1]{label=-, itemsep=-2mm, partopsep=-6mm}


%--- table settings ---
\usepackage{relsize}
\usepackage[table]{xcolor}

\colorlet{tabheadbg}{gray!25}
\colorlet{tabrowbg} {gray!12.5}

\newcommand{\tabheadformat}{\parbox[c][.4cm]{0pt}{}}
\newcommand{\tabhead}[1]{{\textscale{.8}{\textbf{#1}}}}
\newcommand{\zebrarows}[1]{\rowcolors{#1}{}{tabrowbg}}

% separación entre filas en los cuadros
\AfterBegin{document}{\setlength{\extrarowheight}{3pt}}

\usepackage{caption}
\captionsetup{belowskip=12pt,aboveskip=6pt}

%---

\parindent = 0pt
\setstretch{1.5}
\renewcommand\contentsname{Índice de contenido}


%--- document metadata ---
\usepackage{etoolbox}

\newcommand{\@putAuthor}{
  Autor: \@author\par}

\newcommand{\@intensification}{}
\newcommand{\intensification}[1]{%
  \renewcommand{\@intensification}{#1}}

\newcommand{\@advisorFirst}{}
\newcommand{\advisorFirst}[1]{%
  \renewcommand{\@advisorFirst}{#1}}
\newcommand{\@putAdvisorFirst}{Director: \@advisorFirst\par}

\newcommand{\@advisorSecond}{}
\newcommand{\advisorSecond}[1]{%
  \renewcommand{\@advisorSecond}{#1}}
\newcommand{\@putAdvisorSecond}{
  \ifdefempty{\@advisorSecond}{}{
  Director:\helpfootnote{Sólo en el caso de que haya un segundo director.} \@advisorSecond\par}}

\newcommand{\@advisorDepartment}{}
\newcommand{\advisorDepartment}[1]{\renewcommand{\@advisorDepartment}{#1}}

\newcommand{\@docmonth}{}
\newcommand{\@docyear}{}
\newcommand{\docdate}[2]{%
  \renewcommand{\@docyear}{#1}
  \renewcommand{\@docmonth}{#2}}


\def\add_frontpage_content{
  \begin{center}
    \thispagestyle{firstpage}
    \Large \bfseries
    \setstretch{1.3}

    \vspace*{\stretch{7}}
    \includegraphics[width=3cm]{informatica_gray.pdf}

    \vspace*{\stretch{5}}
    UNIVERSIDAD DE CASTILLA-LA MANCHA

    ESCUELA SUPERIOR DE INFORMÁTICA

    \@advisorDepartment\helpfootnote{DEPARTAMENTO DE TECNOLOGÍAS Y SISTEMAS DE INFORMACIÓN o DEPARTAMENTO DE
      INGENIERÍA ELÉCTRICA, ELECTRÓNICA, AUTOMÁTICA Y COMUNICACIONES o DEPARTAMENTO DE MATEMÁTICAS o cualquier otro
      de la UCLM al que pertenezca el director.}

    \vspace*{\stretch{7}}

    ANTEPROYECTO DEL TRABAJO FIN DE GRADO

    GRADO EN INGENIERÍA INFORMÁTICA

    {\normalsize TECNOLOGÍA ESPECÍFICA DE \MakeUppercase{\@intensification}
      \helpfootnote{INGENIERÍA DEL SOFTWARE o INGENIERÍA DE COMPUTADORES o COMPUTACIÓN o
        TECNOLOGÍAS DE LA INFORMACIÓN (esta última está también asociada a los TFG del
        \textbf{curso} de \textbf{adaptación})}}

    \vspace*{\stretch{4}}

    {\LARGE \@title}
  \end{center}

  \vspace*{\stretch{5}}

  {\large
    \@putAuthor
    \@putAdvisorFirst
    \@putAdvisorSecond
  }

  \vspace*{\stretch{4}}

  \vfill
  \hfill
  {\large \@docmonth, \@docyear}
}

\renewcommand\maketitle{%
  \begin{titlepage}
    \null\pagestyle{empty}
    \add_frontpage_content
    \vfil\null
  \end{titlepage}
  \parskip = 3mm
}

\makeatother
