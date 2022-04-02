" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.
 
"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.
 
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
 
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
 
" Enable syntax highlighting
syntax on
 
 
"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.
 
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden
 
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall
 
" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd
 
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
 
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
 
 
"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
 
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
 
" Always display the status line, even if only one window is displayed
set laststatus=2
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
 
" Enable use of the mouse for all modes
set mouse=a
 
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
 
" Display line numbers on the left
set number
 
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
 
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
 
 
"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.
 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
"set shiftwidth=4
"set softtabstop=4
"set expandtab
 
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
set shiftwidth=2
set tabstop=2
 
 
"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>


"------------------------------------------------------------

" Own additions:

" <F9> and <F10> will switch backgrounds between dark and light
nnoremap <F9> :set background=dark<Enter>
nnoremap <F10> :set background=light<Enter>

"color blue
"color darkblue
"color desert
"color default
"color peachpuff
color industry

" For Transparency
"color koehler
"color transparent


" Wrapping guideline
set colorcolumn=80

" <F8> to toggle Relative Line numbers
nnoremap <F8> :set rnu!<Enter>

" Changed default split dehavior
set splitbelow
set splitright

" Add Completing curly brace. 
" Found other completions to just be more annoying
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Makes normal mode movement game like, h is insert.
" Only in normal mode
"nnoremap i k
"nnoremap k j
"nnoremap h i
"nnoremap j h

" Remap :make to F5
noremap <F5> :make<Enter>

" <F3> and <F4> to change tabs
nnoremap <F3> :tabNext<Enter>
nnoremap <F4> :tabnext<Enter>

" Changed working directory to current file automatically
set autochdir

" In normal mode, Enter adds line above cursor, 
" Shift-Enter adds line below
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Keep Cursor centered on screen as often as possible
"set scrolloff=999
" While the previous mapping works, at the end of the file,
" the effect is undesireable. 
" The next mappings are better in my opinion, only work
" with my normal mode movement remappings above
"nnoremap i kzz
"nnoremap k jzz
" These work with regular normal mode mappings. 
nnoremap j jzz
nnoremap k kzz

" Center screen after moving by block ( (, ), [, ], {, } )
nnoremap ]] ]]zz
nnoremap [[ [[zz
nnoremap { {zz
nnoremap } }zz
nnoremap ( (zz
nnoremap ) )zz

" Center screen after G
nnoremap G Gzz

" Highlight similar words on double-click
nnoremap <2-LeftMouse> *#
inoremap <2-LeftMouse> <c-o>*#

" Remove highlighting
nnoremap <F7> :nohl<Enter>

" :make use mingw32-make.exe
"set makeprg=mingw32-make

" Turn on backup files
set backup

" Change directory where vim backups and swp files are saved
"set backupdir=~/vimtmp//,.
"set directory=~/vimtmp//,.
set backupdir=~/tmp//
set directory=~/tmp//
set undodir=~/tmp//


" Control + p to paste from last register
nnoremap <C-p> "0p

" NetRW (Explore) Changes
" Keep the current directory and the browsing directory synced. 
" 	This helps you avoid the move files error.
let g:netrw_keepdir = 0
" Change the size of the Netrw window when it creates a split. 30%
let g:netrw_winsize = 30
" (\) Leader dd: Will open Netrw in the directory of the current file.
nnoremap <leader>dd :Lexplore %:p:h<CR>
" (\) Leader da: Will open Netrw in the current working directory.
nnoremap <Leader>da :Lexplore<CR>

" Auto Complete
set complete+=kspell

" Word Processor Stuff
func! WordProcessor()
  " movement changes
  " normally these are jg and kg
  map i gkzz
  map k gjzz
  " formatting text
  setlocal formatoptions=1
  setlocal noexpandtab
  setlocal wrap
  setlocal linebreak
  " spelling and thesaurus
  setlocal spell spelllang=en_us
  set thesaurus+=/home/Robert/.vim/thesaurus/mthesaur.txt
  " complete+=s makes autocompletion search the thesaurus
  set complete+=s
  " Set screen size
  set columns=120
endfu
com! WP call WordProcessor()

" Org Mode Stuff
"
" Use these commands to install the org mode plugin:
" git clone https://github.com/axvr/org.vim ~/.vim/pack/plugins/start/org
" vim +'helptags ~/.vim/pack/plugins/start/org/doc/' +q
" 
let g:org_clean_folds = 1
