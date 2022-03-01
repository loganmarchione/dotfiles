"General
set showmode            " show mode
set wildmenu            " visual autocomplete for command menu
set linebreak           " when wrapping lines, don't break words
set showcmd             " show command in bottom bar
set title               " change the terminal's title
set cursorline          " highlight current line
syntax on               " enable syntax processing
filetype on             " enable file type detection
set number              " show line numbers
set ruler               " show ruler
set background=dark     " set a dark background
set scrolloff=5         " show at least 5 lines above/below while scrolling
colorscheme nord        " https://github.com/arcticicestudio/nord-vim

"Searching
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase, case-sensitive otherwise
set hlsearch            " highlight search terms
set incsearch           " show search matches as you type
set showmatch           " highlight matching brackets [{()}]

"Tabs and indenting
set autoindent          " auto indenting
set smartindent         " smart indenting
set expandtab           " spaces instead of tabs
set tabstop=2           " 2 spaces for tabs
set shiftwidth=2        " 2 spaces for indentation

"Bells
set noerrorbells        " turn off audio bell
set visualbell          " leave on a visual bell
