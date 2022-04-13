" Auto install vim-plug if not present
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug plugin directory
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Run commands from vim
" also don't use this much? Except I guess to run node %
Plug 'tpope/vim-dispatch'

" Navigate between vim or tmux panes seamlessly
" @IDK is this what I'm using to command-l between tmux and vim?
Plug 'christoomey/vim-tmux-navigator'	

" Vue file highlighting
" I guess? How many highlighting deps do I really need? Is there just one
" I can use?
Plug 'posva/vim-vue'
  
" Fuzzy finder 
" I use this a lot
Plug 'kien/ctrlp.vim'

" Support for easily toggling comments.
" I also use this, dunno if its best?
Plug 'tpope/vim-commentary'

" Proper JSON filetype detection, and support.
" this is okay, but I don't really use it much (sometimes I get a warning
" on save but idk if its coming from here, and its not very useful for
" linting)
Plug 'leshill/vim-json'

" graphql query syntax
Plug 'jparise/vim-graphql'

" JS and JSX syntax, uses pangloss/vim-javascript and mxw/vim-jsx-pretty
Plug 'chemzqm/vim-jsx-improve'
  
" tsx hl
Plug 'ianks/vim-tsx'

" tsx and jsx
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Markdown syntax
Plug 'tpope/vim-markdown'

" Vim  theme
" https://draculatheme.com/vim/
Plug 'dracula/vim', {'as': 'dracula'}

" Pairs brackets and quotes on open
" This messes me up sometimes... consider yourself on probation
" Plug 'Raimondi/delimitMate'

" use editor config
Plug 'editorconfig/editorconfig-vim'	

" ALE Linting
" Plug 'dense-analysis/ale'

call plug#end()

" YouComplete needs utf-8 encoding
" I'm not using YCM anymore, but I think this is still a relevant feature?
" I think it's necessary for displaying unicode, but not sure
set encoding=utf-8

" We have to turn this stuff back on if we want all of our features.
filetype plugin indent on " Filetype auto-detection
syntax on " Syntax highlighting

" Autoclose brackets and newline carriage return
" let g:delimitMate_expand_cr=1
" let g:delimitMate_matchpairs = "(:),[:],{:},<:>,>:<"

" Highlight md code blocks
let g:markdown_fenced_languages = ['html', 'javascript', 'bash=sh', 'json']

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab " use tabs (prolly changing to spaces soon huh?)
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.

" We have VCS -- we don't need this stuff.
set nobackup " We have vcs, we don't need backups.
set nowritebackup " We have vcs, we don't need backups.
set noswapfile " They're just annoying. Who likes them?

" don't nag me when hiding buffers
set hidden " allow me to have buffers with unsaved changes.
set autoread " when a file has changed on disk, just load it. Don't ask.

" Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.

" allow the cursor to go anywhere in visual block mode.
set virtualedit+=block

let mapleader = ","

" go forward through buffers
nnoremap <leader>h :bprev<CR>
nnoremap <C-h> :bprev<CR>
" go backward through buffers
nnoremap <leader>l :bnext<CR>
nnoremap <C-l> :bnext<CR>

" So we don't have to press shift when we want to get into command mode.
nnoremap ; :
vnoremap ; :

" Get ; back with :
nnoremap : ;
vnoremap : ;

" So we don't have to reach for escape to leave insert mode.
inoremap jf <esc>
inoremap Jf <esc>

" create new vsplit, and switch to it.
noremap <leader>v <C-w>v

" Use sane regex's when searching
nnoremap / /\v
vnoremap / /\v

" Clear match highlighting
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>

" Quick buffer switching - like cmd-tab'ing
nnoremap <leader><leader> <c-^>

" Remap ctrlp to ctrl-t 
let g:ctrlp_map = '<c-t>'

" Let ctrlp have up to 20 results.
let g:ctrlp_max_height = 20

" set working dir to only vim dir
let g:ctrlp_working_path_mode=''

" custom ctrlp ignore
" having this ignore is sadly v vimportant
" set wildignore+=*/tmp/*,*.zip,*/node_modules/*,*/.git/*,DS_Store
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|power-platform-ux\/apps\/powerva-microsoft-com\/lib'

" Prevent preview window with YCM autocomplete
set completeopt-=preview

" Setup File types
" dunno if I really need these
" autocmd BufNewFile,BufRead *.pug set filetype=pug
" autocmd BufNewFile,BufRead *.js set filetype=javascript
" autocmd BufNewFile,BufRead *.vue set filetype=vue commentstring=//\ %s

" Change tabs to spaces in pug files
" I gotta figure out my stance on tabs/spaces again. prolly go spaces?
" autocmd FileType pug setlocal shiftwidth=2 tabstop=2 expandtab 

" Set default :Dispatch command for node files
" I actually do this from command mode by hand
autocmd FileType js let b:dispatch = 'node %'

" If wsl
if system('uname -r') =~ "Microsoft"
    augroup Yank
        autocmd!
        " every yank, overwrite windows clipboard 
        autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
        augroup END
endif

" yml format mode
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Show relative line numbers in gutter, show line number of current line
set number
set relativenumber

highlight LineNr ctermfg=grey
highlight CursorLineNr ctermfg=yellow

" Experiment with limiting repeated up/down
" Causes a delay for regular j and k movements, which is annoying but forces
" me to be even more aware when Im doing a single movement or using those keys
" nnoremap jj <nop>
" nnoremap kk <nop>

" Toggle paste mode
set pastetoggle=<leader>p

" Go to next tab on space space
nnoremap <Space><Space> :tabnext<CR>

" Fix backspace problems encountered on OSX
" found fix here: https://chrisjean.com/fix-backspace-in-vim/
" idr why?
set bs=2

" set tmux window name to open vim file
" idk if this actually works?
autocmd BufEnter,BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%"))

" Keep undo history across sessions, by storing in file.
" This is nice, but is this really a good idea?
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Using the tool alt https://github.com/uptech/alt
" Run a given vim command on the results of alt from a given path.
function! AltCommand(path, vim_command)
  let l:alternate = system("alt " . a:path)
  if empty(l:alternate)
    echo "No alternate file for " . a:path . " exists!"
  else
    exec a:vim_command . " " . l:alternate
  endif
endfunction

" Find the alternate file for the current path and open it
" Using this to switch between files and their test equivalents
nnoremap <leader>. :w<cr>:call AltCommand(expand('%'), ':e')<cr>

" ================ Scrolling ========================
set scrolloff=5         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

runtime coc-setup.vim
