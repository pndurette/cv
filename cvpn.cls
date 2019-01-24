\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cvpn}
    [2019/01/17 v1.0 CV PN]

%% Derived from article class
\LoadClass[10pt]{article}

%% General document settings
\setcounter{secnumdepth}{-1} % don't number sections
\pagestyle{empty} % no pagination
\setlength\parindent{0pt} % no paragraph indent

%% Geometry (paper, margins, etc.)
%% https://www.overleaf.com/learn/latex/Page_size_and_margins
\RequirePackage[letterpaper,hmargin=1.25cm,vmargin=1.25cm]{geometry}

%% Column settings
\RequirePackage{multicol}
\setlength{\columnsep}{1.25cm}

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

%% Links
%% http://muug.ca/mirror/ctan/macros/latex/contrib/hyperref/doc/manual.pdf
\RequirePackage{hyperref}
\hypersetup{colorlinks,breaklinks,urlcolor=cvdarkgray,linkcolor=cvdarkgray}

%% Misc Packages
%% http://ctan.math.ca/tex-archive/macros/latex/contrib/progressbar/progressbar.pdf
%% http://muug.ca/mirror/ctan/macros/latex/contrib/background/background.pdf
%% http://ctan.forsale.plus/macros/latex/contrib/datetime2/datetime2.pdf
\RequirePackage{progressbar,background,datetime2}

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

%% Macro \cvheader
%% Inserts the header. Everything is calculed to the pt.
%% i.e Name + Email/City/Phone/Langs/Web
\newcommand{\cvheader}[0]{
    \textcolor{cvdarkgray}{
        \fontsize{36}{50}\selectfont\firaoldstyle\bfseries\uppercase
        {
            \hspace*{100pt}Pierre Nicolas\\[10pt]
            \hspace*{60pt}Durette
        }
    }

    \vspace{-27pt}{
    \textcolor{cvdarkgray}{
        \fontsize{14}{30}\selectfont\firaoldstyle\bfseries\uppercase
        {
        \hspace*{215pt}\href{mailto:pndurette@gmail.com}{pndurette@gmail.com} -- 647-871-3274\\
        \hspace*{317pt}Toronto -- English, French\\
        \hspace*{267pt}\href{http://pierre-nick.com}{pierre-nick.com}
        }
    }}
    \medskip
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

%% Env \skillslist & macro \skill
%% Displays a 'progress bar' of a skill
%% \begin(skillslist)
%%   \skill{<some tech>}{<percent between 0-1}
%% \end(skillslist)
\newenvironment{skillslist}{
    \newcommand{\skill}[2] {
        \progressbar[
            filledcolor=cvdarkgray,
            heightr=1.3,
            width=100pt,
            roundnessa=0pt,
            ticksheight=0pt
            ]{##2} \enspace {##1}\\[2pt]
    }
}

%% macro \cvtag{some text}
%% Displays a 'tag' in the middle-left margin
\newcommand{\cvtag}[1]{
    \backgroundsetup{
        contents={v\Today \, \textit{(#1)} \LaTeX},
        color=black,
        angle=90,
        scale=0.8,
        position=current page.east,
        vshift=30pt
    }
}


%% Stuff breaks if file does't end with
%% two line returns for some reason
