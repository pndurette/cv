\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cvpn}
    [2019/01/17 v1.0 CV PN]

% Derived from scrartcl class
\LoadClass[10pt]{scrartcl}

% Don't number sections
\setcounter{secnumdepth}{-1}

% Geometry (paper, margins, etc.)
% https://www.overleaf.com/learn/latex/Page_size_and_margins
\RequirePackage[letterpaper,hmargin=1.25cm,vmargin=1.25cm,twocolumn,columnsep=1.25cm]{geometry}

% Packages
% titlesec: http://tug.ctan.org/tex-archive/macros/latex/contrib/titlesec/titlesec.pdf
\RequirePackage{hyperref,needspace,tabularx,xcolor,titlesec}

\pagestyle{empty}
\setlength\parindent{0pt}
% \color[HTML]{353535} % Default text color (dark grey)

% \definecolor{link}{HTML}{506060} % Hyperlinks
% \hypersetup{colorlinks,breaklinks,urlcolor=link,linkcolor=link}
% \setkomafont{disposition}{\color[HTML]{801010}}
% \setkomafont{section}{\scshape\Large\mdseries}

% Fonts
% http://www.tug.dk/FontCatalogue/notosans/
\usepackage[sfdefault]{noto}
\usepackage[T1]{fontenc}

% Format \section
\titleformat{\section}
    % {format}{sep}{before-code}
    {\huge\bfseries\itshape\uppercase}{\thesection}{1em}{}
\titlespacing*{\section}
    % {left}{before}{after}
    {0pt}{\baselineskip}{0pt}

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
    {\vspace{0pt}\Large\uppercase{##1}\\}  % What
	{> \textit{##2} -- {##3}\\}  % Where - When
	\medskip
	\renewcommand\inskip{\bigskip}}}
    {\bigskip}

%
% SITE RELIABILITY ENGINEER
% > Mercatus (Toronto) – March ‘18 to Present
