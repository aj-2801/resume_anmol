%=============================================================================
%
%  RESUME CLASS (resume.cls)
%  Based on: Jake Gutierrez (github.com/sb2nov/resume) | License: MIT
%  Enhanced with grad-student helpers, icons, and formatting shortcuts
%
%  Usage: \documentclass{resume}
%
%=============================================================================
%
%  QUICK REFERENCE — AVAILABLE COMMANDS
%  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%  HEADING & CONTACT:
%    \phoneicon{number}              Phone icon + number
%    \emaillink{addr}                Envelope icon + clickable email
%    \linkedinlink{user}             LinkedIn icon + link
%    \githublink{user}               GitHub icon + link
%    \websitelink{url}               Globe icon + link
%    \scholarlink{id}                Google Scholar icon + link
%    \orcidlink{id}                  ORCID icon + link
%    \sep                            Spaced vertical bar separator
%
%  SECTION STRUCTURE:
%    \resumeSubheading{Title}{Location}{Subtitle}{Dates}
%    \resumeSubSubheading{Role}{Dates}        (2nd role, same org)
%    \resumeProjectHeading{Title | Tech}{Dates}
%    \researchHeading{Title}{Location}{Advisor}{Dates}
%    \teachingentry{Term}{Course}{Instructor}{Institution}
%    \award{Year(s)}{Award Name}{Institution}
%    \publication{You}{,CoAuthors,Title,}{Journal}{,Details.}{DOI-url}
%    \conference{You}{,CoAuthors,Title,}{Venue}{,Loc,Date.}{Session}{DOI}
%
%  BULLET POINTS:
%    \resumeItem{text}               Standard bullet
%    \resumeSubItem{text}            Sub-bullet
%    \bk{phrase}                     Bold keyword (short \textbf)
%
%  TEXT & LINKS:
%    \skill{name}                    Bold skill name
%    \tech{name}                     Italic tech name
%    \accenttext{text}               Colored bold text
%    \hlink{url}{text}               Underlined hyperlink
%    \doi{10.xxxx/...}               Clickable DOI URL
%
%  LIST WRAPPERS:
%    \resumeSubHeadingListStart / End
%    \resumeItemListStart / End
%
%  FOOTER:
%    \resumeFooter{Your Name}        Centered name + page number
%
%=============================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2026/07/21 Resume Class]

% Load base class
\LoadClass[letterpaper,11pt]{article}


%=============================================================================
%  PACKAGES
%=============================================================================

\RequirePackage{latexsym}
\RequirePackage[empty]{fullpage}
\RequirePackage{titlesec}
\RequirePackage{marvosym}
\RequirePackage[usenames,dvipsnames]{color}
\RequirePackage{verbatim}
\RequirePackage{enumitem}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{fancyhdr}
\RequirePackage[english]{babel}
\RequirePackage{tabularx}
\RequirePackage{fontawesome5}          % Icons: \faGithub \faLinkedin \faEnvelope etc.
\RequirePackage{xcolor}                % Extended color support
\RequirePackage{academicons}           % Academic icons: \aiGoogleScholar \aiOrcid etc.
\RequirePackage{lmodern}               % Modern font with bold small caps support
\input{glyphtounicode}


%=============================================================================
%  FONT OPTIONS (uncomment ONE line to change typeface)
%=============================================================================

% Sans-serif
% \RequirePackage[sfdefault]{FiraSans}
% \RequirePackage[sfdefault]{roboto}
% \RequirePackage[sfdefault]{noto-sans}
% \RequirePackage[default]{sourcesanspro}
% \RequirePackage[sfdefault]{inter}
% \RequirePackage[sfdefault]{cabin}
% \RequirePackage[sfdefault]{raleway}

% Serif
% \RequirePackage{CormorantGaramond}
% \RequirePackage{charter}
% \RequirePackage{palatino}
% \RequirePackage{times}
% \RequirePackage{ebgaramond}
% \RequirePackage{libertine}

% Monospace-inspired
% \RequirePackage{inconsolata}


%=============================================================================
%  PAGE LAYOUT
%=============================================================================

\pagestyle{fancy}
\fancyhf{}
\fancyfoot{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\addtolength{\oddsidemargin}{-0.5in}
\addtolength{\evensidemargin}{-0.5in}
\addtolength{\textwidth}{1in}
\addtolength{\topmargin}{-.5in}
\addtolength{\textheight}{1.0in}
\setlength{\footskip}{16pt}        % Room for optional footer; silences fancyhdr warning

\urlstyle{same}
\raggedbottom
\raggedright
\setlength{\tabcolsep}{0in}

\titleformat{\section}{
  \vspace{-4pt}\scshape\raggedright\large
}{}{0em}{}[\color{black}\titlerule \vspace{-5pt}]

\pdfgentounicode=1


%=============================================================================
%  ACCENT COLOR (uncomment one)
%=============================================================================

\definecolor{accentcolor}{HTML}{2b2b2b}     % Dark gray (safe for print)
% \definecolor{accentcolor}{HTML}{0077B5}    % LinkedIn blue
% \definecolor{accentcolor}{HTML}{1a73e8}    % Google blue
% \definecolor{accentcolor}{HTML}{6f42c1}    % Purple


%=============================================================================
%  LAYOUT COMMANDS
%=============================================================================

\newcommand{\resumeItem}[1]{
  \item\small{{#1 \vspace{-2pt}}}
}

\newcommand{\resumeSubheading}[4]{
  \vspace{-2pt}\item
    \begin{tabular*}{\textwidth}[t]{l@{\extracolsep{\fill}}r}
      \textbf{#1} & #2 \\
      \textit{\small#3} & \textit{\small #4} \\
    \end{tabular*}\vspace{-7pt}
}

\newcommand{\resumeSubSubheading}[2]{
    \item
    \begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
      \textit{\small#1} & \textit{\small #2} \\
    \end{tabular*}\vspace{-7pt}
}

\newcommand{\resumeProjectHeading}[2]{
    \item
    \begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
      \small#1 & #2 \\
    \end{tabular*}\vspace{-7pt}
}

\newcommand{\resumeSubItem}[1]{\resumeItem{#1}\vspace{-4pt}}
\renewcommand\labelitemii{$\vcenter{\hbox{\tiny$\bullet$}}$}

\newcommand{\resumeSubHeadingListStart}{\begin{itemize}[leftmargin=0.0in, label={}]}
\newcommand{\resumeSubHeadingListEnd}{\end{itemize}}
\newcommand{\resumeItemListStart}{\begin{itemize}[leftmargin=0.15in]}
\newcommand{\resumeItemListEnd}{\end{itemize}\vspace{-5pt}}


%=============================================================================
%  ICON & LINK SHORTCUTS
%=============================================================================

\newcommand{\emaillink}[1]{\href{mailto:#1}{\faEnvelope\ \underline{#1}}}
\newcommand{\githublink}[1]{\href{https://github.com/#1}{\faGithub\ \underline{github.com/#1}}}
\newcommand{\linkedinlink}[1]{\href{https://linkedin.com/in/#1}{\faLinkedin\ \underline{linkedin.com/in/#1}}}
\newcommand{\phoneicon}[1]{\faPhone\ #1}
\newcommand{\websitelink}[1]{\href{https://#1}{\faGlobe\ \underline{#1}}}
\newcommand{\scholarlink}[1]{\href{https://scholar.google.com/citations?user=#1}{\aiGoogleScholar\ \underline{Google Scholar}}}
\newcommand{\orcidlink}[1]{\href{https://orcid.org/#1}{\aiOrcid\ \underline{orcid.org/#1}}}


%=============================================================================
%  TEXT & STYLE SHORTCUTS
%=============================================================================

\newcommand{\skill}[1]{\textbf{#1}}
\newcommand{\tech}[1]{\textit{#1}}
\newcommand{\accenttext}[1]{{\color{accentcolor}\textbf{#1}}}
\newcommand{\hlink}[2]{\href{#1}{\underline{#2}}}
\newcommand{\bk}[1]{\textbf{#1}}
\newcommand{\sep}{\quad$|$\quad}

% Temporary/placeholder metric (underlined so it is easy to find & edit later)
% Usage: \tmp{40\%}  ->  underlined 40%
\newcommand{\tmp}[1]{\underline{#1}}

% Summary paragraph:  \summarytext{...}
\newcommand{\summarytext}[1]{\vspace{2pt}\small{#1}\vspace{-4pt}}


%=============================================================================
%  GRADUATE STUDENT HELPERS
%=============================================================================

% Publication:  \publication{You}{,CoAuthors, Title,}{Journal}{,vol (yr) pp.}{DOI}
\newcommand{\publication}[5]{
  \item\small{
    \textbf{#1}#2 #3#4
    \ifx&#5& \else\href{#5}{\underline{DOI}}\fi
    \vspace{-2pt}
  }
}

% Conference:  \conference{You}{,CoAuthors, Title,}{Venue}{,Loc, Date.}{Session}{DOI}
\newcommand{\conference}[6]{
  \item\small{
    \textbf{#1} #2 #3#4
    \ifx&#5& \else\textit{#5}.\fi
    \ifx&#6& \else\ \href{#6}{\underline{DOI}}\fi
    \vspace{-2pt}
  }
}

% Teaching row:  \teachingentry{Term}{Course}{Instructor}{Institution}
\newcommand{\teachingentry}[4]{
  \item
  \begin{tabular*}{0.97\textwidth}{l@{\extracolsep{\fill}}r}
    \small{#1 \quad \textbf{#2}, Instructor: #3} & \textit{\small #4} \\
  \end{tabular*}\vspace{-7pt}
}

% Award row:  \award{Year(s)}{Award Name}{Institution}
\newcommand{\award}[3]{
  \item
  \begin{tabular*}{0.97\textwidth}{l@{\extracolsep{\fill}}r}
    \small{#1 \quad \textbf{#2}} & \textit{\small #3} \\
  \end{tabular*}\vspace{-7pt}
}

% Research project heading:  \researchHeading{Title}{Location}{Advisor}{Dates}
\newcommand{\researchHeading}[4]{\resumeSubheading{#1}{#2}{#3}{#4}}

% DOI shortcut:  \doi{10.1016/...}
\newcommand{\doi}[1]{\href{https://doi.org/#1}{\underline{https://doi.org/#1}}}

% Page footer:  \resumeFooter{Your Name}
\newcommand{\resumeFooter}[1]{
  \fancyfoot[C]{\small\scshape #1 \(\cdot\) R\'esum\'e \thepage}
}

\endinput
