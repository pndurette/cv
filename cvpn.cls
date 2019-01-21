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

% General document settings
\pagestyle{empty} % no pagination
\setlength\parindent{0pt} % no paragraph indent
% \color[HTML]{353535} % Default text color (dark grey)

% \definecolor{link}{HTML}{506060} % Hyperlinks
% \hypersetup{colorlinks,breaklinks,urlcolor=link,linkcolor=link}
% \setkomafont{disposition}{\color[HTML]{801010}}
% \setkomafont{section}{\scshape\Large\mdseries}

% Fonts
% http://www.tug.dk/FontCatalogue/notosans/
\usepackage[sfdefault]{noto}
\usepackage[T1]{fontenc}

%% Format \section
%% e.g. "Work Experience"
\titleformat{\section}
    % {format}{sep}{before-code}
    {\huge\bfseries\itshape\uppercase}{\thesection}{0pt}{}
\titlespacing*{\section}{0pt}{*0}{*0}

%% Format \subsection
%% e.g. "DevOps Engineer"
\titleformat{\subsection}
    {\Large\bfseries\uppercase}{\thesubsection}{0pt}{}
\titlespacing*{\subsection}{0pt}{*0}{*0}

%% Macro \wherewhen{'where'}{'when'}
%% e.g. "> Mercatus (Toronto) – March ‘18 to Present"
\newcommand{\wherewhen}[2]{
    % Where - When
    > {\textit{#1}} -- {{#2}\\}
}

%% Redefine \item for when (defined) \eventlist
%% \item{Item Name}
%%      {Item place}
%%      {Item Time}
%% {
%% Item Description
%% }
%% eg.
%% SITE RELIABILITY ENGINEER
%% > Mercatus (Toronto) – March ‘18 to Present
%% Blah
\newenvironment{eventlist}{
    \renewcommand\item[4]{
        \subsection{##1} % What
        \wherewhen{##2}{##3} % Where - When
        {##4}
	\bigskip
    }
}

%
% SITE RELIABILITY ENGINEER
% > Mercatus (Toronto) – March ‘18 to Present
