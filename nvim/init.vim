let g:python_host_prog = '/Users/alexanderdibattista/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/alexanderdibattista/.pyenv/versions/neovim3/bin/python'
"
" Syntax highlighting {{{
set t_Co=256
set background=dark
colorscheme onedark
" }}}
set encoding=UTF-8

syntax on
" if exists('+termguicolors')
  " let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  " let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  " set termguicolors
" endif

" autocmd FileType python colorscheme railcasts

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Local directories {{{
set backupdir=~/.config/nvim/backups
set directory=~/.config/nvim/swaps
set undodir=~/.config/nvim/undo
" }}}

let mapleader="," " Map leader

set clipboard=unnamedplus
set cursorline " Highlight current line
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set encoding=utf-8 nobomb " BOM often causes trouble
set expandtab " Expand tabs to spaces
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
set hidden " when a buffer is brought to foreground, remember undo history and marks
set ignorecase " Ignore case of searches
set list!
set mouse=a " Enable the mouse
set noerrorbells " Disable error bells
" set nofoldenable
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set nostartofline " Don't reset cursor to start of line when moving around
set nowrap " Do not wrap lines
set nu " Enable line numbers
set ofu=syntaxcomplete#Complete " Set omni-completion method
set report=0 " Show all changes
set ruler
set showtabline=2 " Always show tab bar
set softtabstop=2 " Tab key results in 2 spaces
set shiftwidth=2 " The # of spaces for indenting
set splitbelow " New window goes below
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set switchbuf=""
set termguicolors " Enable true color support
set title " Show the filename in the window title bar
set undofile " Persistent Undo
set viminfo=%,'9999,s512 " Restore buffer list, marks are remembered for 9999 files, registers up to 512Kb are remembered
set visualbell
set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
set wildignore+=.DS_Storeset wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
set winminheight=0 " Allow splits to be reduced to a single line

let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>"} " autoclose escape key

let g:python_highlight_all = 1

let g:deoplete#sources#ternjs#tern_bin = '/usr/local/bin/ternjs'
" Add extra filetypes
let g:deoplete#sources#ternjs#filetypes = [
                \ 'ts',
                \ 'tsx',
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue']
let g:deoplete#max_list = 200
let g:deoplete#sources#rust#racer_binary='/Users/alexanderdibattista/.cargo/bin/racer'


" remove whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" let g:UltiSnipsExpandTrigger="<C-j>"
" Trigger configuration.
let g:UltiSnipsExpandTrigger='<leader>e'
let g:UltiSnipsJumpForwardTrigger='<leader>r'
let g:UltiSnipsJumpBackwardTrigger='<leader>w'
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

map <C-\> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeIgnore = ['^\~$[[dir]]', '^\.o$[[file]]', '^\.pyc$[[file]]', '^\.DS_Store$[[file]]']

" vim ident guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" Toggle show tabs and trailing spaces (,c) {{{
set lcs=tab:›\ ,trail:·,eol:¬,nbsp:_
set fcs=fold:-
nnoremap <silent> <leader>c :set nolist!<CR>
" }}}
" ale
let g:ale_completion_enabled = 1
let g:ale_virtualenv_dir_names = ['venv', '.env', 'env', 've', 'virtualenv', '.pyenv']
let b:ale_linter_aliases = {'tsx': 'typescript'}
let g:ale_linters = {
      \  'javascript': ['eslint'],
      \  'typescript': ['tsserver', 'eslint'],
      \  'python': ['pycodestyle']}
let g:ale_fixers = {}
let g:ale_fixers = {
      \  'javascript': ['prettier', 'eslint'],
      \  'typescript': ['prettier', 'eslint'],
      \  'json': ['prettier'],
      \  'css': ['stylelint', 'prettier'],
      \  'python': ['black']}

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_set_highlights = 0
let g:ale_sign_error = '⇝'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1

" TODO: create a switch for python 2
let g:ale_python_pycodestyle_executable = "/Users/alexanderdibattista/.pyenv/versions/neovim3/bin/pycodestyle"
let g:ale_python_black_executable = "/Users/alexanderdibattista/.pyenv/versions/neovim3/bin/black"

" Black Python linter
let g:black_fast = 1
let g:black_linelength = 79
let g:black_virtualenv = "/Users/alexanderdibattista/.pyenv/versions/neovim3/bin/black"
autocmd BufWritePre *.py execute ':Black'

" Airline.vim {{{
augroup airline_config
  autocmd!
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  let g:airline_powerline_fonts = 1
  let g:airline_section_b = '%{gina#component#repo#name()}:%{gina#component#repo#branch()}'
  let g:airline_skip_empty_sections = 1
  let g:airline_symbols.linenr = '␤'

  let g:airline#extensions#ale#enabled = 1
  let g:airline#extensions#tabline#buffer_nr_format = '%s '
  let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamecollapse = 0
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#formatter = 'jsformatter'
augroup END
" }}}

" Sudo write (,W) {{{
  noremap <leader>W :w !sudo tee %<CR>
" }}}

" Insert newline {{{
  map <leader><Enter> o<ESC>
" }}}

" add WIP to git {{{
  map <Leader>gw :!git add .; git commit -m 'WIP'; git push<cr>
" }}}

"Relative numbers {{{
  set relativenumber " Use relative line numbers. Current line is still in status bar.
  au BufReadPost,BufNewFile * set relativenumber
" }}}

" Strip trailing whitespace (,ss) {{{
function! StripWhitespace () " {{{
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction " }}}
noremap <leader>ss :call StripWhitespace ()<CR>
" }}}

" fzf {{{
augroup fzf_config
  set rtp+=/usr/local/bin/fzf

  let g:fzf_layout = { 'up': '~40%' }
  let g:fzf_history_dir = '~/.config/nvim/fzf-history'
  let g:fzf_buffers_jump = 1 " Jump to existing buffer if available

  nnoremap <C-p> :Files<CR>
  nnoremap <C-g> :GFiles<CR>
  nnoremap <C-b> :Buffers<CR>
  nnoremap <C-t> :Tags<CR>
  nnoremap <C-m> :Marks<CR>
  nnoremap <leader>l :Lines<CR>

  " Mapping selecting mappings
  nmap <leader><tab> <plug>(fzf-maps-n)
  xmap <leader><tab> <plug>(fzf-maps-x)
  omap <leader><tab> <plug>(fzf-maps-o)

  " Insert mode completion
  imap <c-x><c-k> <plug>(fzf-complete-word)
  imap <c-x><c-f> <plug>(fzf-complete-path)
  imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  imap <c-x><c-l> <plug>(fzf-complete-line)
augroup END
" }}}

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

nmap <F8> :TagbarToggle<CR>

" NERD Commenter {{{
augroup nerd_commenter
  autocmd!

  let NERDSpaceDelims=1
  let NERDCompactSexyComs=1
  let g:NERDCustomDelimiters = { 'racket': { 'left': ';', 'leftAlt': '#|', 'rightAlt': '|#' } }
augroup END
" }}}

" Buffers {{{
augroup buffer_control
  autocmd!

  " Buffer navigation (,,) (gb) (gB) (,ls) {{{
  map <Leader>, <C-^>
  map <Leader>ls :buffers<CR>
  map gb :bnext<CR>
  map gB :bprev<CR>
  " }}}

  " Jump to buffer number (<N>gb) {{{
  let c = 1
  while c <= 99
    execute "nnoremap " . c . "gb :" . c . "b\<CR>"
    let c += 1
  endwhile
  " }}}

  " Close Quickfix window (,qq) {{{
  map <leader>qq :cclose<CR>
  " }}}

  " Rename buffer (:Rename) {{{
  function! s:RenameBuffer(name)
    silent! execute 'saveas! ' . a:name
    let l:old_buffer = bufnr("#")
    let l:old_filename = expand("#:t")
    let l:new_buffer = bufnr("%")
    let l:new_filename = expand("%:t")
    silent! execute '!rm ' . shellescape(expand("#"), 1)
    silent! execute 'bd' l:old_buffer
    echom 'Renamed `' . l:old_filename . '` to `' . l:new_filename . '`'
  endfunction
  command! -nargs=1 Rename call s:RenameBuffer(<f-args>)
  " }}}
augroup END
" }}}

" Silver Searcher {{{
augroup ag_config
  autocmd!

  if executable("ag")
    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m

    " Have the silver searcher ignore all the same things as wilgignore
    let b:ag_command = 'ag %s -i --nocolor --nogroup'

    for i in split(&wildignore, ",")
      let i = substitute(i, '\*/\(.*\)/\*', '\1', 'g')
      let b:ag_command = b:ag_command . ' --ignore "' . substitute(i, '\*/\(.*\)/\*', '\1', 'g') . '"'
    endfor

    let b:ag_command = b:ag_command . ' --hidden -g ""'
  endif
augroup END
" }}}

" fzf {{{
augroup fzf_config
  set rtp+=/usr/local/opt/fzf

  let g:fzf_layout = { 'up': '~40%' }
  let g:fzf_history_dir = '~/.config/nvim/fzf-history'
  let g:fzf_buffers_jump = 1 " Jump to existing buffer if available

  nnoremap <C-p> :Files<CR>
  nnoremap <C-g> :GFiles?<CR>
  nnoremap <C-b> :Buffers<CR>
  nnoremap <C-t> :Tags<CR>
  nnoremap <C-m> :Marks<CR>
  nnoremap <leader>l :Lines<CR>

  " Mapping selecting mappings
  nmap <leader><tab> <plug>(fzf-maps-n)
  xmap <leader><tab> <plug>(fzf-maps-x)
  omap <leader><tab> <plug>(fzf-maps-o)

  " Insert mode completion
  imap <c-x><c-k> <plug>(fzf-complete-word)
  imap <c-x><c-f> <plug>(fzf-complete-path)
  imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  imap <c-x><c-l> <plug>(fzf-complete-line)
augroup END
" }}}

" vim-markdown-composer {{{
let g:markdown_composer_syntax_theme = 'Sunburst'
" }}}

" Elixir Tagbar Configuration
" let g:tagbar_type_elixir = {
    " \ 'ctagstype' : 'elixir',
    " \ 'kinds' : [
        " \ 'f:functions',
        " \ 'functions:functions',
        " \ 'c:callbacks',
        " \ 'd:delegates',
        " \ 'e:exceptions',
        " \ 'i:implementations',
        " \ 'a:macros',
        " \ 'o:operators',
        " \ 'm:modules',
        " \ 'p:protocols',
        " \ 'r:records',
        " \ 't:tests'
    " \ ]
    " \ }

" jsx-pretty.vim {{{
augroup jsx_pretty_config
  autocmd!
  let g:vim_jsx_pretty_colorful_config = 1
augroup END
" }}}

" EasyAlign.vim {{{
augroup easy_align_config
  autocmd!
  " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
  vmap <Enter> <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
  nmap <Leader>a <Plug>(EasyAlign)
augroup END
" }}}

" vim-markdown[{{{
let g:vim_markdown_folding_disabled = 1

augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

let g:lexical#spelllang = ['en_us','en_ca',]
"}}}

" vim-repeat.vim {{{
augroup repeat_config
  autocmd!
  nmap z <Plug>(RepeatUndo)
  nmap gz <Plug>(RepeatUndoLine)
  nmap Z <Plug>(RepeatRedo)
augroup END
" }}}

" JavaScript {{{
augroup filetype_javascript
  autocmd!
  let g:jsx_ext_required = 0
  let g:javascript_plugin_jsdoc = 1
augroup END
" }}}

" JSON {{{
augroup filetype_json
  autocmd!
  au BufRead,BufNewFile *.json set ft=json syntax=javascript
augroup END
" }}}
" Set clipboard provider to pbcopy for MacOS
let g:clipboard = {
      \ 'name': 'pbcopy',
      \ 'copy': {
      \    '+': 'pbcopy',
      \    '*': 'pbcopy',
      \  },
      \ 'paste': {
      \    '+': 'pbpaste',
      \    '*': 'pbpaste',
      \ },
      \ 'cache_enabled': 0,
\ }
call plug#begin('~/.config/nvim/plugged')
  " Utilities
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'reedes/vim-wordy'
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'Shougo/vimproc.vim',     { 'do' : 'make' }
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-endwise'
  Plug 'rstacruz/vim-closer'
  Plug 'godlygeek/tabular'
  Plug 'Townk/vim-autoclose'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/denite.nvim'
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'majutsushi/tagbar'
  Plug 'tpope/vim-obsession'
  Plug 'w0rp/ale'
  Plug 'roxma/nvim-yarp'
  Plug 'sheerun/vim-polyglot'
  Plug 'terryma/vim-multiple-cursors'

  " Themes
  Plug 'vim-airline/vim-airline'
  Plug 'ryanoasis/vim-devicons'

  " Search
  Plug 'junegunn/fzf',           { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Elixir Support
  Plug 'elixir-lang/vim-elixir'
  Plug 'avdgaag/vim-phoenix'
  Plug 'mmorearty/elixir-ctags'
  Plug 'mattreduce/vim-mix'
  Plug 'BjRo/vim-extest'
  Plug 'frost/vim-eh-docs'
  Plug 'slashmili/alchemist.vim'

  Plug 'jadercorrea/elixir_generator.vim'
  Plug 'elixir-editors/vim-elixir'
  Plug 'mhinz/vim-mix-format'

  " JavaScript
  Plug 'leafgarland/typescript-vim'
  Plug 'mxw/vim-jsx'
  Plug 'pangloss/vim-javascript'
  Plug 'rking/ag.vim'
  Plug 'othree/yajs'
  Plug 'flowtype/vim-flow'
  Plug 'jparise/vim-graphql'
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  Plug 'zchee/deoplete-jedi'
  Plug 'posva/vim-vue'
  Plug 'maxmellon/vim-jsx-pretty', { 'for': [ 'javascript', 'javascript.jsx', 'typescript' ] }

  " Python
  Plug 'lambdalisue/vim-pyenv'
  Plug 'lepture/vim-jinja'
  Plug 'plytophogy/vim-virtualenv'
  Plug 'vim-python/python-syntax'
  Plug 'ambv/black'

  " GO
  Plug 'zchee/deoplete-go'

  " RUST
  Plug 'sebastianmarkow/deoplete-rust'

  " CSS
  Plug 'JulesWang/css.vim'
  Plug 'ap/vim-css-color'

  " JSON
  Plug 'elzr/vim-json'

  " SQL
  Plug 'exu/pgsql.vim'

  " GIT
  Plug 'lambdalisue/gina.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'jreybert/vimagit'

  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  " Fish
  Plug 'vim-scripts/fish.vim',   { 'for': 'fish' }
  Plug 'dag/vim-fish'

  " HTML
  Plug 'mattn/emmet-vim'

  " Solidity
  Plug 'tomlion/vim-solidity'

  " Markdown
  Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
  Plug 'plasticboy/vim-markdown'
  Plug 'rhysd/vim-grammarous'
  Plug 'reedes/vim-colors-pencil'
  Plug 'reedes/vim-lexical'

  " TMUX
  Plug 'prabirshrestha/async.vim'
  Plug 'prabirshrestha/asyncomplete.vim'
call plug#end()


let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])

