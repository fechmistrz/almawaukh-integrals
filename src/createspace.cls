\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{createspace}[2022/01/20 Create Space class]
\LoadClass[twoside, 9pt]{extbook}

% to handle ą, ć, ę, etc.
\RequirePackage[utf8]{inputenc}
\RequirePackage[LGR, T1]{fontenc}
\RequirePackage{polski}

% to make the text as compact as possible
\RequirePackage{Alegreya}
\RequirePackage[final]{microtype}
\RequirePackage[compact]{titlesec}
\RequirePackage{paralist}

% popular page size in Amazon's KDP
\RequirePackage[
    paperwidth=6.14in,
    paperheight=9.21in,
    left=0.82in,
    right=0.695in,
    top=0.6in,
    bottom=0.71in,
    twoside,
    headsep=0.15in,
    includehead,
    includefoot
]{geometry}

\RequirePackage{fancyhdr}
\fancypagestyle{plain}{
    \fancyhf{}
    \fancyfoot[C]{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}
\pagestyle{fancy}
\fancyhead{}
\fancyfoot{}
\fancyhead[LE]{\thepage}
\fancyhead[RE]{\nouppercase{\leftmark}}
\fancyhead[LO]{\nouppercase{\rightmark}}
\fancyhead[RO]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.0pt}

% https://tex.stackexchange.com/questions/22012/hyperref-and-imakeidx-do-not-work-together
\RequirePackage{imakeidx}

% \DeclareMathOperator:
\RequirePackage{amsmath}
% \mathbb:
\RequirePackage{amssymb}
% \theoremstyle, \newtheorem:
\RequirePackage{amsthm}
% [H] for figure environment:
\RequirePackage{float}
% \subcaption for minipage inside figure:
\RequirePackage{subcaption} % captions to subfigures
% clickable links
% add [backref] for links from bib entries to citations
% add [pdfusetitle] for metadata
\RequirePackage[pdfusetitle]{hyperref}
\hypersetup{
    colorlinks,
    linkcolor={red!50!black},
    citecolor={blue!50!black},
    urlcolor={blue!80!black}
}

\theoremstyle{plain}
\newcounter{counter}
\numberwithin{counter}{section}
\newtheorem{conjecture}[counter]{Hipoteza}
\newtheorem{integral}[counter]{Całka}
\newtheorem{corollary}[counter]{Wniosek}
\newtheorem{definition}[counter]{Definicja}
\newtheorem{example}[counter]{Przyk\l{}ad}
\newtheorem{lemma}[counter]{Lemat}
\newtheorem{proposition}[counter]{Fakt}
\newtheorem{theorem}{Twierdzenie}
\newtheorem{warning}[counter]{Uwaga}
\newtheorem{tobedone}[counter]{Wymaga przeredagowania}

% https://www.reddit.com/r/LaTeX/comments/athzn1/replacing_leq_and_geq_with_leqslant_and_geqslant/
\let\savedleq=\leq %
\let\savedgeq=\geq %
\let\le=\leqslant %
\let\ge=\geqslant %