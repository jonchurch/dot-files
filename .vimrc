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

" Vim fuzzy autocomplete with tab
" this is a very heavy dep for something I don't use much
" Plugin 'Valloric/YouCompleteMe'

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

" So we don't have to press shift when we want to get into command mode.
nnoremap ; :
vnoremap ; :

" Get ; back with ;;
" noremap ;; ;

" Get ; back with :
nnoremap : ;
" vnoremap : ;

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

" Map the key for toggling comments with vim-commentary
" this doesnt make sense to me, leader should be , but I do this with gc in
" normal mode
nnoremap <leader>c <Plug>CommentaryLine

" Remap ctrlp to ctrl-t 
let g:ctrlp_map = '<c-t>'

" Let ctrlp have up to 20 results.
let g:ctrlp_max_height = 20

" set working dir to only vim dir
let g:ctrlp_working_path_mode=''

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
" autocmd BufNewFile,BufRead *.pug set filetype=pug
" autocmd BufNewFile,BufRead *.js set filetype=javascript
" autocmd BufNewFile,BufRead *.vue set filetype=vue commentstring=//\ %s

" Change tabs to spaces in pug files
" I gotta figure out my stance on tabs/spaces again. prolly go spaces?
" autocmd FileType pug setlocal shiftwidth=2 tabstop=2 expandtab 

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


" ======================== CoC Autocomplete setup start ======================
  " \ 'coc-pairs',
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

" try to fix color of errors from tsserver 
hi! CocErrorSign guifg=#d1666a

" Sample CoC config pasted from their readme
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" ======================== CoC Autocomplete setup end ======================
