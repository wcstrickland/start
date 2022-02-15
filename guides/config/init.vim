set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'nvim-lua/plenary.nvim'
Plugin 'glacambre/firenvim'
Plugin 'nvim-lua/popup.nvim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'luochen1990/rainbow'
Plugin 'jiangmiao/auto-pairs'
Plugin 'yggdroot/indentline'
" Plugin 'neoclide/coc.nvim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nvim-telescope/telescope.nvim'
Plugin 'neovim/nvim-lspconfig'
Plugin 'williamboman/nvim-lsp-installer', { 'branch': 'main' }
Plugin 'hrsh7th/nvim-compe'
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plugin 'nvim-treesitter/nvim-treesitter-textobjects'

" Plugin 'glepnir/galaxyline.nvim', { 'branch': 'main' }
Plugin 'kyazdani42/nvim-web-devicons'  " needed for galaxyline icons

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on

let g:rainbow_active = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_y = '%{strftime("%X")}'
let g:airline_theme ='angr'

"highlighting"
    colorscheme desert
    syntax on
    highlight Search cterm=None ctermfg=Black ctermbg=Yellow
    highlight Visual cterm=None ctermfg=Black ctermbg=Green
    highlight SignColumn ctermbg=Black
    highlight DiffAdd cterm=None ctermfg=Black ctermbg=Green
    highlight diffAdded ctermfg=Green
    highlight diffRemoved ctermfg=Red
    highlight DiffChange cterm=None ctermfg=Black ctermbg=DarkBlue
    highlight DiffDelete cterm=None ctermfg=Black ctermbg=Red
    highlight DiffText cterm=None ctermfg=Black ctermbg=Yellow
    highlight SpecialKey ctermfg=DarkGrey
    highlight VertSplit ctermfg=Black cterm=bold ctermbg=Black

"so good they should be defaults"
    set hlsearch incsearch ignorecase smartcase noshowmatch
    set noswapfile hidden number relativenumber lazyredraw ttyfast showtabline=2
    set showcmd  wildmenu path+=** complete-=i completeopt=menuone,noselect,noinsert
    set wildignore=*/node_modules/*,*/.viminfo/*,*/.git/* "exclued from vimgrep"
    set noerrorbells novisualbell splitright splitbelow
    set laststatus=2 display=lastline scrolloff=3 mouse=a
    set foldmethod=indent foldlevelstart=0 signcolumn=number
    set tabstop=4 shiftwidth=4 smarttab expandtab autoindent
    set nobackup nowritebackup shortmess+=c updatetime=300
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"coc"
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"statusline"
    set statusline=  statusline+=%#CursorLine#\ \ \ %#ModeMsg#%.20t\ %#Title#%m\ %#NonText#%y\ %#Question#[%c]\ %#LineNr#[%l\|%L]%#CursorLine#

"set 80char warning colum"
    autocmd VimEnter *.* :set cc=80
    highlight ColorColumn ctermbg=DarkGrey

"recursive rough spell check macro: requires turning spelling on first with :set spell"
    let @s="]s1z=@s"

"rebind esc and clear highlighting"
    inoremap jj <Esc>:nohls<cr>

"jumpt to bottom and center"
    nnoremap G Gzz

"single line up and down"
    nnoremap j gj
    nnoremap k gk
    nnoremap J }
    nnoremap K {
    xnoremap J }
    xnoremap K {
    nnoremap <expr> h (col('.') == 1) ? 'za' : 'h'
    nnoremap { g;
    nnoremap } g,

"SHORTCUTS"
    function Log(phrase)
        execute 'normal i console.log(`' . a:phrase . ': ${' . a:phrase . '} on line ' . string(line("."))
    endfunction
    inoremap <leader>log <esc>:call Log("")<left><left>
    inoremap <leader>for for(let el of ){<CR>console.log(el);<CR>}<esc>k>>kf)i
    inoremap <leader>try try{<CR><CR>}catch(e){<CR>console.log(e);<CR>}<esc>k>>kki<tab>
    inoremap <leader>map map((x) => ())<Esc>hi
    inoremap <leader>main def<CR><cr>def main():<cr><tab>pass<cr><cr><esc>Iif __name__ == "__main__":<cr><tab>main()
    inoremap <leader>doc /**<cr><cr>@fucntion<cr>@param{type}[name]<cr>@return{type}<cr>/



let mapleader = " "

set pastetoggle=<F2>
nnoremap <F3> :so /home/bill/.config/nvim/init.vim<cr>


"nerdtree"
    nnoremap <leader>f :NERDTree<cr>
"telescope"
    nnoremap <leader>t :Telescope find_files<cr>
"quickfix list"
    function! ToggleQuickFix()
        if empty(filter(getwininfo(), 'v:val.quickfix'))
            copen
        else
            cclose
        endif
    endfunction
    nnoremap <silent>Q :call ToggleQuickFix()<cr>

"replace exact word under cursor"
    nnoremap <leader>r :%s/\<<c-r>=expand("<cword>")<cr>\>//gc<left><left><left>

"close and open"
    nnoremap <leader>q :bw<cr>
    nnoremap <leader>w :w<CR>
    nnoremap <leader>! :w !sudo tee %<CR>
    nnoremap zq ZQ



"improved window nav"
    nnoremap <leader>h <c-w>h
    nnoremap <leader>j <c-w>j
    nnoremap <leader>k <c-w>k
    nnoremap <leader>l <c-w>l
    nnoremap <leader>< <c-w>5<
    nnoremap <leader>> <c-w>5>
    nnoremap <leader>+ <c-w>5+
    nnoremap <leader>- <c-w>5-

"change buffers"
    nnoremap <leader>b :ls<cr>:b<space>
    nnoremap + :bn<cr>

"marks"
    nnoremap <leader>m :marks abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ<cr>:normal '
    function Marks()
        let g:marks = getmarklist(bufname())
        for mark in g:marks
            "use regex to only do user defined marks"
            let g:user = matchstr(mark["mark"], '\v[[:alpha:]]')
            if empty(g:user)
                continue
            else
                call sign_define(mark["mark"], {"text":mark["mark"], "texthl": "DiffDelete"})
                call sign_place(0, 'marks', mark["mark"], bufname(), {'lnum': mark["pos"][1]})
            endif
        endfor
    endfunction
    command Marks call Marks()
    au BufEnter *.* call Marks()
    function Markit(char)
         call sign_define(a:char, {"text":a:char, "texthl": "DiffDelete"})
         call sign_place(0, 'marks', a:char, bufname(), {'lnum': line('.')})
         execute "normal m" . a:char . "<cr>"
    endfunction
    nnoremap M :call Markit("")<left><left>


"show registers and prompt for put and copy/paste from system clip"
    nnoremap <leader>P :reg<cr>:put
    nnoremap <leader>p "*p
    nnoremap Y y$
    vnoremap <leader>y "*y gv"+y

"search stuff"
    nnoremap * *N
    nnoremap <leader>* :vim/\<<c-r>=expand("<cword>")<cr>\>/j %<cr>
    nnoremap <leader>/ :vim/ /%<left><left><left>
    nnoremap g* *Ncgn
    nnoremap \ /\v
    nnoremap \| <s-k>

"trim all trailing whitespace"
    function TrailWhite()
        execute '%s/\s\+$//e'
    endfunction

"better bol/eol"
    nnoremap H ^
    nnoremap L g$
    xnoremap H ^
    xnoremap L g$h

"open a split with a diff of staged changes"
    function! Review()
        execute ":vertical new"
        execute ":%!git diff --staged"
        execute ":set filetype=diff"
    endfunction
    command Review call Review()

"todos"
    function Todos()
        execute "vim TODO ./%"
        execute ":norm Q"
    endfunction
    command Todos call Todos()


"figlet comments"
function Fig(chars)
    execute ':.!figlet ' . a:chars
    execute 'normal 0'
    execute 'normal5jI// '
endfunction

"require("statusbar")"

lua <<EOF
require("lsp")
require("treesitter")
require("completion")
EOF
