call plug#begin('~/.vim/plugged')
"======================================================
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
"======================================================
Plug 'jiangmiao/auto-pairs'
"======================================================
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"======================================================
Plug 'kien/ctrlp.vim'
"======================================================
"Plug 'vim-syntastic/syntastic'
"======================================================
Plug 'vim-airline/vim-airline'
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
"color themes
Plug 'morhetz/gruvbox'
Plug 'robu3/vimongous'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'zxqfl/tabnine-vim'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'

call plug#end()

syntax on
set background=dark
"colorscheme solarized
set number
set shiftwidth=8
set smarttab
set expandtab
set hlsearch
set incsearch
set list
set listchars=tab:>-

set rtp+=~/tabnine-vim

map <F2>  : set expandtab<CR>
map <F3>  : set smarttab<CR>
map <F4>  : set shiftwidth=4<CR>
map <F5>  : set shiftwidth=8<CR>
"================================================
"NerdTree and NerdTreeGit
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
let g:NERDTreeShowIgnoredStatus = 1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('go', 'blue', 'none', 'red', '#151515')
"================================================

"=================================================
"INDENT GUIDES
let g:indent_guides_enable_on_vim_startup = 1
"=================================================
"HTML 5
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0
"=================================================
"Setting vim-syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0
let g:syntastic_asm_checkers             = ['asm', 'asm/0']
":echo syntastic#util#system('echo "$PATH"')
"=================================================
"Emmet
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_install_global = 0

autocmd FileType html,css EmmetInstall
"=================================================
"GCC config
map <F7>   :!g++ %<CR>
map <F6>   :!./a.out<CR>
"=================================================

"mappings 

map <C-n>  : NERDTreeToggle<CR>
map <C-s>  : w<CR>
nmap <F8>  : TagbarToggle<CR>
nmap <F10> : SyntasticCheck 0<CR>
map <F9>   : Tabularize /
