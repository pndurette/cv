\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cvpn}
    [2019/01/17 v1.0 CV PN]

% Derived from article class
\LoadClass[10pt]{article}

% General document settings
\setcounter{secnumdepth}{-1} % don't number sections
\pagestyle{empty} % no pagination
\setlength\parindent{0pt} % no paragraph indent

% Geometry (paper, margins, etc.)
% https://www.overleaf.com/learn/latex/Page_size_and_margins
\RequirePackage[letterpaper,hmargin=1.25cm,vmargin=1.25cm]{geometry}

% Column settings
\usepackage{multicol}
\setlength{\columnsep}{1.25cm}

% Misc Packages
\RequirePackage{hyperref,needspace,tabularx,amsmath}

% \color[HTML]{353535} % Default text color (dark grey)

% \definecolor{link}{HTML}{506060} % Hyperlinks
% \hypersetup{colorlinks,breaklinks,urlcolor=link,linkcolor=link}
% \setkomafont{disposition}{\color[HTML]{801010}}
% \setkomafont{section}{\scshape\Large\mdseries}

%% Fonts
%% http://www.tug.dk/FontCatalogue/notosans/
\usepackage[sfdefault]{noto} % default
\usepackage{FiraSans} % header
\usepackage[T1]{fontenc}

%% Colours
\RequirePackage[dvipsnames]{xcolor}
\definecolor{cvdarkgray}{HTML}{6C6E70}
\definecolor{cvmidgray}{HTML}{454545}
\definecolor{cvblue}{HTML}{008BD0}

%% Formatting
%% http://tug.ctan.org/tex-archive/macros/latex/contrib/titlesec/titlesec.pdf
\RequirePackage{titlesec}

%% Format \section
%% e.g. "Work Experience"
\titleformat{\section}
    % {format}{sep}{before-code}
    {\color{cvblue}\huge\bfseries\itshape\uppercase}{\thesection}{0pt}{}
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
    \textcolor{cvmidgray}{> {\textit{#1}} -- {{#2}}}
}

%% Macro \cvheader[6]{}..
%% e.g. Name, email, etc.
\newcommand{\cvheader}[0]{
    \textcolor{cvmidgray}{
        \fontsize{36}{50}\selectfont\firaoldstyle\bfseries\uppercase
        {
            \hspace*{120pt}Pierre Nicolas\\[10pt]
            \hspace*{80pt}Durette
        }
    }

    \textcolor{cvmidgray}{
        \fontsize{14}{30}\selectfont\firaoldstyle\bfseries\uppercase
        {
        pndurette@gmail.com -- Toronto\\
        \hspace*{82pt}647-871-3274 -- English, French\\
        \hspace*{52pt}pierre-nick.com
        }
    }
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
%% Description
\newenvironment{eventlist}{
    \renewcommand\item[4]{
        \subsection{##1} % What
        \wherewhen{##2}{##3}\\ % Where - When
        {##4}
	\bigskip
    }
}

%% Stuff breaks if file does't end with
%% two line returns for some reason
