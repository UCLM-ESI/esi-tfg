% -*- coding: utf-8 -*-

% pfc.sty
%
% Copyright © 2011 David Villa Alises
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
\ProvidesClass{arco-pfc}[2011/05/16 Arco modified book class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\PassOptionsToClass{a4paper, 12pt, twoside, openright}{book}
\ProcessOptions\relax
\LoadClass{book}


\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[spanish]{babel}
\usepackage{times}


\usepackage[htt]{hyphenat}
\usepackage{atbeginend}

% Las normas tipográficas que aparecen en los comentarios corresponden al libro:
% J. Martínez de Sousa. Ortografía y ortotipografía del español actual. Trea, 2008.

%% -- MEDIDAS Y DISTANCIAS -----------------------------------------------------
\usepackage[left=35mm, right=20mm, top=25mm, bottom=25mm]{geometry}
\usepackage{setspace}
\setlength{\parskip}{2mm plus 0.2mm minus 0.2mm}

%% Párrafos
% La indentación que precede al párrafo normal debe ser de un
% cuadratín (1em) (-> 13.4.1.1)
\parindent   = 1em

% El espacio en blanco al final de una línea corta debe ser mayor que
% la indentación del párrafo. (-> 13.4.1.1)
\parfillskip = 1.5em plus 1fil


%% -- GRÁFICOS -----------------------------------------------------------------
\usepackage{graphicx}
\usepackage{epsfig}
\graphicspath{{figures/}}

%% -- COLORES ------------------------------------------------------------------
\usepackage[table]{xcolor}
\definecolor{white}{gray}{1}
\definecolor{gray97}{gray}{0.97}
\definecolor{gray95}{gray}{0.95}
\definecolor{gray75}{gray}{0.75}
\definecolor{gray45}{gray}{0.45}
\colorlet{tabheadbg}{gray!25}
\colorlet{tabrowbg} {gray!12.5}

%% --  CUADROS -----------------------------------------------------------------
\usepackage{booktabs}
\usepackage{colortbl} % coloreado de cuadros

\newcommand{\tabheadformat}{\rowcolor{tabheadbg} \parbox[c][.4cm]{0pt}{}}
\newcommand{\tabfootformat}{\tabheadformat}
\newcommand{\tabhead}[1]{{\textscale{.8}{\textbf{#1}}}}
\newcommand{\tabfoot}[1]{#1}
\newcommand{\tabcolorrow}{\rowcolor{tabrowbg}}

% cebreado para cuadros
\newcommand{\myrowcolors}[1]{\rowcolors{#1}{tabrowbg}{}}
\AfterEnd{tabular}{\rowcolors{1}{}{}}


%% -- LISTADOS DE CÓDIGO -------------------------------------------------------
\usepackage{listings}
\renewcommand{\lstlistlistingname}{Índice de listados}
\renewcommand{\lstlistingname}{Listado}

% de tocbibind, para que el índice de listados aparezca en la ToC
\renewcommand{\lstlistoflistings}{\begingroup
   \tocfile{\lstlistlistingname}{lol}
\endgroup}

\newcommand{\lstfont}{\ttfamily\fontfamily{pcr}}

\lstset{%
     frame              = Ltb,
     framerule          = 0pt,
     belowskip          = 2mm,
     framextopmargin    = 3pt,
     framexbottommargin = 3pt,
     framexleftmargin   = 0.4cm,
     framesep           = 0pt,
     rulesep            = .4pt,
     backgroundcolor    = \color{gray95},
     rulesepcolor       = \color{black},
     captionpos         = b,
     floatplacement     = htbp,
     %
     basicstyle         = \footnotesize\lstfont,
     showstringspaces   = false,
     commentstyle       = \color{gray45},
     keywordstyle       = \bfseries,
     %
     numbers            = none,
     stepnumber         = 1,
     numbersep          = 15pt,
     numberstyle        = \scriptsize,
     numberblanklines   = false,
     %
     breaklines         = true,
   }

\lstnewenvironment{listing}[1][]
   {\pagebreak[3]\singlespacing\lstset{#1}}%
   {\pagebreak[3]}


%% -- ACRÓNIMOS Y GLOSARIO -----------------------------------------------------
\usepackage[printonlyused]{acronym}

\renewcommand*{\acsfont}[1]{\textsc{\textscale{.85}{#1}}} % enunciado del acrónimo: OO
\renewcommand*{\acfsfont}[1]{#1}
\renewcommand*{\acffont}[1]{#1}

% imprime: "Object Oriented (OO)"
\newcommand{\acx}[1]{\acused{#1}\acs{#1} %
  \nolinebreak[3] %
  (\acl{#1})}

\newcommand{\Acro}[2]{\acro{#1}{#2}\acused{#1}}
\newcommand{\sigla}[1]{\textsc{\textscale{.85}{#1}}}


%% -- HIPER-ENLACES PARA PDF ---------------------------------------------------
\usepackage[bookmarks,
            hyperfootnotes = false,
            % backref,                % debug: refs desde la bibliografía
            pdfview        = {fitv},
            colorlinks     = true,
            urlcolor       = black,
            linkcolor      = black,
            citecolor      = black,
            pagecolor      = black,
            anchorcolor    = black
            ]{hyperref}

\hypersetup{
  pdftitle   = {\@title},
  pdfauthor  = {\@author},
  pdfsubject = {Proyecto Fin de Carrera},
}


%% -- BIBLIOGRAFÍA -------------------------------------------------------------
\renewcommand{\bibname}{Referencias}
\bibliographystyle{es-alpha}

% añadir listados, bibliografia, etc a la tabla de contenido
\usepackage{tocbibind}



%% -- ESTILO DE PÁGINA, ENCABEZADOS Y PIES -------------------------------------
\usepackage{fancyhdr}
\pagestyle{fancy}

% para las páginas de título
\fancypagestyle{plain}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0pt}
  \fancyfoot[C]{\thepage}
}

\fancyhf{}
\headheight=13pt
\fancyhead[EL,OR]{\thepage}
\fancyhead[ER,OL]{\leftmark}
\renewcommand{\headrulewidth}{0.3pt}
\renewcommand{\chaptermark}[1]{%
  \markboth{\thechapter.\ \textsc{#1}}{}%
}

\renewcommand{\headrulewidth}{0.4pt}

\newlength{\myoffset}
\myoffset=32pt
\fancyhfoffset[EL,OR]{\myoffset}

\addtolength{\footskip}{8pt}


%% -- FORMATO DE CAPÍTULOS Y SECCIONES -----------------------------------------
\usepackage[rigidchapters, clearempty]{titlesec}
% - rigidchapters: Todos los títulos de capítulo tienen la misma altura
% - clearempty: Elimina encabezados y piés de páginas (izquierdas) vacías.

\newcommand{\chapterformat}[1]{%
  \fontsize{22}{22}\selectfont\sffamily #1%
  }

\newsavebox{\numbox}
\newlength{\numberwidth}
\newcommand{\chapternumberbg}{\fontsize{130}{90}\selectfont\bfseries\thechapter}
\newcommand{\chapternumberfg}{\fontsize{90}{90}\selectfont\bfseries\thechapter}

% doc: \titlespacing*{ command }{ left }{ beforesep }{ aftersep }[ right ]

\newcommand{\frontchapters}{
  \titleformat{\chapter}[display]%
  {}
  {\thechapter}
  {0cm}
  {\chapterformat}

  \pagestyle{fancy}
  \renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{##1}}{}}
  \titlespacing{\chapter}{-1cm}{2cm}{2cm}
}

\newcommand{\mainchapters}{
\titleformat{\chapter}[frame]
  {\normalfont}
  {\filright
   \footnotesize
   \enspace \large \chaptertitlename~\thechapter\enspace}
  {20pt}
  {\filcenter\chapterformat}

  \pagestyle{fancy}
  \renewcommand{\chaptermark}[1]{\markboth{\thechapter.\ \textsc{##1}}{}}
  \titlespacing{\chapter}{0cm}{1cm}{3.8cm}
}

\newcommand{\backchapters}{
  \titleformat{\chapter}[display]%
  {\chapterformat}
  {\thechapter}
  {0pt}
  {}

  \titlespacing{\chapter}{-1cm}{2cm}{3cm}
}

% espaciado entre secciones, subseciones, etc
\titlespacing{\section}{0pt}{5mm}{0mm}
\titlespacing{\subsection}{0pt}{4mm}{-1mm}
\titlespacing{\subsubsection}{0pt}{4mm}{-1mm}


%% -- Otros paquetes
\usepackage{relsize}  % tamaños relativos para el texto


%% -- VARIABLES DEL PAQUETE ----------------------------------------------------
\newcommand{\@authortitle}{}
\renewcommand{\author}[2]{%
  \renewcommand{\@author}{#1}
  \renewcommand{\@authortitle}{#2}}

\newcommand{\@advisor}{}
\newcommand{\@advisortitle}{}
\newcommand{\advisor}[2]{%
  \renewcommand{\@advisor}{#1}
  \renewcommand{\@advisortitle}{#2}}

\newcommand{\@address}{}
\newcommand{\address}[1]{\renewcommand{\@address}{#1}}
\newcommand{\@city}{}
\newcommand{\city}[1]{\renewcommand{\@city}{#1}}
\newcommand{\@country}{}
\newcommand{\country}[1]{\renewcommand{\@country}{#1}}
\newcommand{\@phone}{}
\newcommand{\phone}[1]{\renewcommand{\@phone}{#1}}
\newcommand{\@email}{}
\newcommand{\email}[1]{\renewcommand{\@email}{#1}}
\newcommand{\@homepage}{}
\newcommand{\homepage}[1]{\renewcommand{\@homepage}{#1}}


\newcommand{\@logo}{}
\newcommand{\logo}[1]{\renewcommand{\@logo}{#1}}

\newcommand{\@publishmonth}{}
\newcommand{\@publishyear}{\year}
\newcommand{\publishdate}[2]{%
  \renewcommand{\@publishyear}{#1}
  \renewcommand{\@publishmonth}{#2}}

\newcommand{\@license}{%
  \begin{minipage}{1.1\textwidth}
    \begin{singlespace}
      Permission is granted to copy, distribute and/or modify this
      document under the terms of the GNU Free Documentation License,
      Version 1.3 or any later version published by the Free Software
      Foundation; with no Invariant Sections, no Front-Cover Texts,
      and no Back-Cover Texts.  A copy of the license is included in
      the section entitled \hyperlink{chap:GFDL}{"GNU Free
        Documentation License"}.

      \smallskip
      Se permite la copia, distribución y/o modificación de este
      documento bajo los términos de la Licencia de Documentación
      Libre GNU, versión 1.3 o cualquier versión posterior publicada
      por la \emph{Free Software Foundation}; sin secciones
      invariantes. Una copia de esta licencia esta incluida en el
      apéndice titulado \hyperlink{chap:GFDL}{«GNU Free Documentation
        License»}.

    \smallskip
    Muchos de los nombres usados por las compañías para diferenciar
    sus productos y servicios son reclamados como marcas
    registradas. Allí donde estos nombres aparezcan en este documento,
    y cuando el autor haya sido informado de esas marcas registradas,
    los nombres estarán escritos en mayúsculas o como nombres propios.
  \end{singlespace}
  \end{minipage}
}
\newcommand{\license}[1]{\renewcommand{\@license}{#1}}



%% -- PÁGINAS ESPECIALES

% - portadilla
% Sólo aparece el título de la obra a la misma altura,
% fuente y estilo que en la portada pero en un tamaña 2/3 el de
% ésta. Opcionalmente puede aparecer el autor.
\newcommand{\pretitle}{%
  \cleardoublepage
  \thispagestyle{empty}%
  \begin{center}%
    \vspace*{\stretch{3.2}}%
    {\large \textsc{\@title} \par}
    \vspace*{\stretch{6.8}}%
  \end{center}%
  \vfill\null
  \cleardoublepage
}


\newcommand{\frontpage}{%
  \thispagestyle{empty}%
  \begin{center}
    \includegraphics[width=3.7cm]{figures/emblema_informatica.pdf}\\
    \vspace{25mm}
    {\Large \textbf{UNIVERSIDAD DE CASTILLA-LA MANCHA}} \\
    \bigskip
    {\Large \textbf{ESCUELA SUPERIOR DE INFORMÁTICA}} \\
    \vspace{25mm}
    {\Large \textbf{INGENIERÍA}} \\
    \bigskip
    {\Large \textbf{EN INFORMÁTICA}} \\
    \vspace{26mm}
    {\Large \textbf{PROYECTO FIN DE CARRERA}} \\
    \vspace{14mm}
    {\Large \@title}\\
    \vspace{12mm}
    {\large \@author}\\
    \vfill
    \hfill
    {\large \textbf{\@publishmonth, \@publishyear}}
  \end{center}
}

\newcommand{\copyrightpage}{%
  \newpage
  \thispagestyle{empty}
  \begin{singlespace}
    \null \vfill \noindent
    \textbf{\@author} \par
    \smallskip \noindent
    \@city\\ \@country \par
    \medskip \noindent
    \parbox{4em}{\emph{E-mail:}}   \@email \\
    \parbox{4em}{\emph{Telefono:}} \@phone \\
    \parbox{4em}{\emph{Web site:}} \url{\@homepage} \\
    \bigskip \noindent
    \copyright\ \number\@publishyear\ \ \@author \par
    \smallskip \noindent
    \begin{minipage}{0.8\textwidth} \raggedright \footnotesize
      \@license
    \end{minipage}
  \end{singlespace}
  \newpage
}


\newcommand{\jury}{%
  \thispagestyle{empty}
  \noindent\underline{\textbf{{\Large TRIBUNAL:}}}
  \vspace{0.9cm}

  \textbf{{\large Presidente:}} \\

  \textbf{{\large Vocal 1:}} \\

  \textbf{{\large Vocal 2:}} \\

  \textbf{{\large Secretario:}} \\

  \vspace{1.8cm}
  \noindent\underline{\textbf{{\Large FECHA DE DEFENSA:}}}

  \vspace{2.9cm}
  \noindent\underline{\textbf{{\Large CALIFICACIÓN:}}}

  \vspace{3.6cm}
  \textbf{PRESIDENTE \hfil VOCAL 1 \hfil VOCAL 2 \hfil SECRETARIO}

  \vspace{3.1cm}
  \textbf{Fdo.: \hfil Fdo.: \hfil Fdo.: \hfil Fdo.:}
}


\newcommand{\appendixtitle} {
  \cleardoublepage
  \thispagestyle{empty}%
  \vspace*{5cm}%
  \begin{center}%
    \sffamily\scshape\Large\scalebox{3}{ANEXOS}%
  \end{center}%
}%


%% -- símbolos
\usepackage{pifont}
\usepackage{tipa}


%% -- letras capitales
\usepackage{lettrine}
\newcommand{\drop}[2]{%
  \lettrine[lines=2,findent=2pt,nindent=0pt, loversize=0.25]% lhang=0.33
  {\textcolor[gray]{0.4}{#1}}{#2}%
  }


%% -- Inicialización después de \begin{document}
\newcommand{\pfcInit}{%
  % separación entre filas en los cuadros
  \setlength{\extrarowheight}{1pt}
}

%% -- Algunos comando útiles
\newcommand{\quoteauthor}[1]{\par\hfill#1\hspace{1em}\mbox{}}


%\makeatother