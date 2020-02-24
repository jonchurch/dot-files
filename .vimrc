" Setting up Vundle - the vim plugin bundler
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
    if !filereadable(vundle_readme) 
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
        let iCanHazVundle=0
    endif
    set nocompatible              " be iMproved, required
    filetype off                  " required
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
	" Let vundle manage itself:
    Plugin 'VundleVim/Vundle.vim'

	" Run commands from vim
	" also don't use this much? Except I guess to run node %
	Plugin 'tpope/vim-dispatch.git'

	" Vim fuzzy autocomplete with tab
	" this is a very heavy dep for something I don't use much
	" Plugin 'Valloric/YouCompleteMe'

	" Navigate between vim or tmux panes seamlessly
	" @IDK is this what I'm using to command-l between tmux and vim?
	Plugin 'christoomey/vim-tmux-navigator'	

	" Neoformat for prettier js formatting
	Plugin 'sbdchd/neoformat'

	" Vue file highlighting
	" I guess? How many highlighting deps do I really need? Is there just one
	" I can use?
	Plugin 'posva/vim-vue'
    
	" Fuzzy finder 
	" I use this a lot
	Bundle 'kien/ctrlp.vim'

	" Support for easily toggling comments.
	" I also use this, dunno if its best?
	Bundle 'tpope/vim-commentary'

	" Proper JSON filetype detection, and support.
	" this is okay, but I don't really use it much (sometimes I get a warning
	" on save but idk if its coming from here, and its not very useful for
	" linting)
	Bundle 'leshill/vim-json'


	" graphql query syntax
	Bundle 'jparise/vim-graphql'

	" vim indents HTML very poorly on it's own. This fixes a lot of that.
	" DOES IT THOUGH? I care more about jsx, but I don't usually have great
	" experience with indented html
	Bundle 'indenthtml.vim'

	" Do I want to use this? What exactly does it give me?
	" Plugin 'Syntastic' "uber awesome syntax and errors highlighter

	" emoji-vim
	" don't think I need this to display emoji in vim, not sure?
	" Plugin 'junegunn/vim-emoji'

	" JS and JSX syntax, uses pangloss/vim-javascript and mxw/vim-jsx-pretty
	Plugin 'chemzqm/vim-jsx-improve'
   
	" tsx hl
	Plugin 'ianks/vim-tsx'

	" tsx and jsx
	Plugin 'leafgarland/typescript-vim'
	Plugin 'peitalin/vim-jsx-typescript'

	" Markdown syntax
	Bundle 'tpope/vim-markdown'

	" LessCSS -- I don't use this
	" Bundle 'groenewege/vim-less'

	" Vim jsbeautify plugin
	" Plugin 'maksimr/vim-jsbeautify'
	" I haven't been using this either

	" Vim  theme
	" https://draculatheme.com/vim/
	Plugin 'dracula/vim'

	" Pairs brackets and quotes on open
	" This messes me up sometimes... consider yourself on probation
	Plugin 'delimitMate.vim'

	" use editor config
	Plugin 'editorconfig/editorconfig-vim'	

	" ALE Linting
	Plugin 'dense-analysis/ale'

    if iCanHazVundle == 0
        echo "Installing Vundles, please ignore key map error messages"
        echo ""
        :PluginInstall
    endif

    call vundle#end() 
    "must be last

" YouComplete needs utf-8 encoding
" I'm not using YCM anymore, but I think this is still a relevant feature?
" I think it's necessary for displaying unicode, but not sure
set encoding=utf-8

" We have to turn this stuff back on if we want all of our features.
filetype plugin indent on " Filetype auto-detection
syntax on " Syntax highlighting

" Autoclose brackets and newline carriage return
let g:delimitMate_expand_cr=1
let g:delimitMate_matchpairs = "(:),[:],{:},<:>,>:<"

" Enable spellchecking in md files
" autocmd BufNewFile,BufRead *.md set ft=markdown spell
" dont spellcheck urls
" syn match UrlNoSpell '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell

" Highlight md code blocks
" let g:markdown_github_languages = ['js', 'javascript']

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

" So we don't have to press shift when we want to get into command mode.
nnoremap ; :
vnoremap ; :

" Get ; back with ;;
" noremap ;; ;

" Get ; back with :
nnoremap : ;
vnoremap : ;

" So we don't have to reach for escape to leave insert mode.
inoremap jf <esc>
inoremap Jf <esc>

" create new vsplit, and switch to it.
noremap <leader>v <C-w>v

" bindings for easy split nav
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" Use sane regex's when searching
nnoremap / /\v
vnoremap / /\v

" Clear match highlighting
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>

" Quick buffer switching - like cmd-tab'ing
nnoremap <leader><leader> <c-^>


" Visual line nav, not real line nav
" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that.
"
" Turned this off because I often have wrapped lines, and this makes relnum
" useless
" noremap j gj
" noremap k gk

" Plugin settings:
" Below are some 'sane' (IMHO) defaults for a couple of the above plugins I
" referenced.

" Map the key for toggling comments with vim-commentary
" this doesnt make sense to me, leader should be , but I do this with gc in
" normal mode
nnoremap <leader>c <Plug>CommentaryLine

" Remap ctrlp to ctrl-t 
let g:ctrlp_map = '<c-t>'

" Let ctrlp have up to 20 results.
let g:ctrlp_max_height = 20

" custom ctrlp ignore
" having this ignore is sadly v vimportant
" set wildignore+=*/tmp/*,*.zip,*/node_modules/*,*/.git/*,DS_Store
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Finally the color scheme. Choose whichever you want from the list in the
" link above (back up where we included the bundle of a ton of themes.)

" colorscheme dracula

" Disable Arrow keys in Normal mode
" I've broken this habit, I prolly don't need these anymore
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>

" Disable Arrow keys in Insert mode
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>

" Prevent preview window with YCM autocomplete
set completeopt-=preview

" Setup File types
" dunno if I really need these
autocmd BufNewFile,BufRead *.pug set filetype=pug
autocmd BufNewFile,BufRead *.js set filetype=javascript
autocmd BufNewFile,BufRead *.vue set filetype=vue commentstring=//\ %s

" Change tabs to spaces in pug files
" I gotta figure out my stance on tabs/spaces again. prolly go spaces?
autocmd FileType pug setlocal shiftwidth=2 tabstop=2 expandtab 

" Set default :Dispatch command for node files
" I actually do this from command mode by hand
autocmd FileType js let b:dispatch = 'node %'

" Use vim * system register to copy/paste from crouton clipboard
" don't need this anymore if I'm sticking to Mac
"nnoremap "*p :r !cat ~/.crouton-clipboard/data.txt<CR>
"vnoremap "*y :'<,'>w! ~/.crouton-clipboard/data.txt<CR>

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
" idk if I need this mode anymore...
set pastetoggle=<leader>p

" Go to next tab on space space
nnoremap <Space><Space> :tabnext<CR>

" Fix backspace problems encountered on OSX
" found fix here: https://chrisjean.com/fix-backspace-in-vim/
" idr why?
set bs=2

" set tmux window name to open vim file
" idk if this actually works?
autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%:t"))

" Keep undo history across sessions, by storing in file.
" This is nice, but is this really a good idea?
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Scrolling ========================
set scrolloff=5         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Run prettier on save
" autocmd BufWritePre *.js,*.md Neoformat

let g:ale_fixers = {
\   'javascript': ['eslint'],
\		'typescript': ['eslint'],
\		'markdown': ['prettier']
\}
let g:ale_fix_on_save = 1

let g:ale_sign_error = '!'
let g:ale_sign_warning = '_'

" Navigate to ALE errors
nnoremap <silent> <leader>j :ALENext<cr>
nnoremap <silent> <leader>k :ALEPrevious<cr>

" Syntastic eslint setup
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = 'npm run lint --'
