set textwidth=80
set wrap

" A few macro to write latex faster
map! ,em \emph{
map! ,bf \textbf{<ESC>ea}

map! ,ant anthropomorphism

" Beamer stuff
"
" Build a block in insert mode, cursor is at the beginning of block
map! ,bl \begin{block}{}<CR>\end{block}<ESC>ko

" Build an alertblock in insert mode, cursor is at the beginning of block
map! ,abl \begin{alertblock}<CR>\end{alertblock}<ESC>ko

" Build a frame, the cursor is positionned to the beginning of frametitle
map! ,fr \begin{frame}{}<CR>\end{frame}<ESC>k3la

" Build an itemize list, with a first item, the cursor is after the first
" item
map! ,it \begin{itemize}<CR>\item <CR>\end{itemize}<ESC>0k$a

" Build an enumerate list, with a first item, the cursor is after the first
" item
map! ,en \begin{enumerate}<CR>\item <CR>\end{enumerate}<ESC>0k$a

" Add an includegraphics, with caption and label stuff. The cursor is at the
" beginning of the name image
map! ,fig \begin{figure}<CR>\centering<CR>\includegraphics[width=0.9\linewidth]{}<CR>\caption{}<CR>\label{}<CR>\end{figure}<ESC>03k$i

" Add a chapter, section, subsection with its label. The cursor is at the
" beginning of the {chapter|section|...} name
map! ,ch \chapter{}<ESC>i
map! ,se \section{}<ESC>i 
map! ,sse \subsection{}<ESC>i
map! ,ssse \subsubsection{}<ESC>i

