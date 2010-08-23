% Initial template taken from
% http://stackoverflow.com/questions/581916/how-do-you-extend-article-document-class-in-latex

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{arco-report}[2009/12/04 v0.1 ARCO modified report class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions

\LoadClass{report}
\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}
\RequirePackage{graphicx}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[spanish]{babel}
\RequirePackage{times}
\RequirePackage[colorlinks=true,
  linkcolor=blue,
  citecolor=blue,
  urlcolor=blue]{hyperref}
\RequirePackage{color}
\RequirePackage{amsmath}
\RequirePackage{tocbibind}
\RequirePackage{enumerate}
\RequirePackage{sectsty}
\RequirePackage{checkend}
\RequirePackage{rotating}
\RequirePackage[inline,marginclue,draft]{fixme}

\gdef\@docid{}
\def\docid#1{\gdef\@docid{#1}}

\allsectionsfont{\sffamily}
\sectionfont{\mdseries\itshape}

\reversemarginpar
\marginparwidth=3cm

% \renewcommand\FXMargin[2]{%
%   \marginpar[\vspace{.4cm}\footnotesize\raggedleft\emph{#2}]{%
%     \vspace{.4cm}\footnotesize\raggedright\emph{#2}}}

% PANTONE 7427. R:60 G:8 B:15
\definecolor{uclmred}{rgb}{.60,.08,.15}

% Cool Gray 5. R:72 G:70 B:68
\definecolor{uclmgray}{rgb}{.72,.70,.68}

\newcommand{\maketitlepage}{%
  \null\pagestyle{empty}%
  \setlength{\unitlength}{1in}
  \begin{picture}(0,0)
    \put(-0.7,0.03){\includegraphics[width=4cm]{/usr/share/arco-tools/figures/uclm-A4.pdf}}
    \put(-0.55,-0.9){\textcolor{white}{\includegraphics[width=3.6cm]{/usr/share/arco-tools/figures/arco.pdf}}}
    %\put(-0.75,-1.14){\makebox(0,0)[rb]{%
    \put(-0.75,-9){\makebox(0,0)[rb]{%
        \scriptsize\begin{sideways}\@docid\end{sideways}}}
    \put(0.95,0.45){\makebox(0,0)[l]{\large\textsf{\textbf{%
            \textcolor{uclmred}{%
              Universidad de Castilla-La Mancha}}}}}
    \put(0.95,0.2){\makebox(0,0)[l]{\textsf{%
          Grupo de Arquitectura y Redes de Computadores}}}
    \put(6.2,-3){\makebox(0,0)[r]{%
        \begin{minipage}[r]{15cm}
          \begin{flushright}
            \Huge\textsf{\textbf{\@title}}
          \end{flushright}
        \end{minipage}}}
    \put(6.2,-5){\makebox(0,0)[r]{\Large \lineskip .75em
        \begin{tabular}[t]{r}%
          \@author
        \end{tabular}}}
    \put(6.2,-9){\makebox(0,0)[r]{\Large \@date}}
  \end{picture}
  \vfil\null%
  \cleardoublepage%
  \end{titlepage}%
}

\renewcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small%
  \let\footnoterule\relax%
  \let \footnote \thanks%
  \maketitlepage%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}


\endinput
