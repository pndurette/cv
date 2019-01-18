\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cvpn}
              [2019/01/17 v1.0 CV PN]

\LoadClass[12pt]{scrartcl}

\setcounter{secnumdepth}{-1}
\RequirePackage[hmargin=1.25cm,vmargin=1.25cm,twocolumn,columnsep=1.25cm]{geometry}
\RequirePackage{hyperref,needspace,tabularx,xcolor}

% \pagestyle{empty}
% \setlength\parindent{0pt}
% \color[HTML]{303030} % Default foreground color
% \definecolor{link}{HTML}{506060} % Hyperlinks
% \hypersetup{colorlinks,breaklinks,urlcolor=link,linkcolor=link}
% \setkomafont{disposition}{\color[HTML]{801010}}
% \setkomafont{section}{\scshape\Large\mdseries}

% Fonts
% http://www.tug.dk/FontCatalogue/notosans/
\usepackage[sfdefault]{noto}
\usepackage[T1]{fontenc}

% Override the \section command to capitalize
\makeatletter
\let\old@section\section
\renewcommand\section[2][]{%
    \old@section[#1]{\uppercase{#2}}}
\makeatother

% Every \item can be followed by one or more paragraphs
% of description:
%
% |[
% \item{date range}{company}{role}
%
% Description of what achieved during this application.
% ]|
\newenvironment{eventlist}{%
    \newcommand*\inskip{}
    \renewcommand\item[3]{%
	\inskip%
    {\Large\uppercase{##1}\\}  % What
	{\textit{##2} -- {##3}\\}  % Where - When
	\medskip
	\renewcommand\inskip{\bigskip}}}
    {\bigskip}

    
%
% SITE RELIABILITY ENGINEER
% > Mercatus (Toronto) – March ‘18 to Present
