set nocompatible    " use vim defaults
set ls=2            " allways show status line
set tabstop=4       "numbers of spaces of tab character
set shiftwidth=4    " numbers of spaces to (auto)indent
set cindent         " cindent
set autoindent      " always set autoindenting on
set showcmd         " display incomplete commands
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ignorecase		" ignore case when searching
set smartcase       " overrides ignorecase when searching with capital letters
set novisualbell    " turn off visual bell
set title           " set title in console title bar
set visualbell t_vb= "turn off visual bell
set showmatch       " Matching closing parenthesis,bracket or brace cursor jump 
set number          " To have line numbers
set hidden          " Edit another buffer without saving the modified buffer
                    " and without losing the modifications 
set shiftwidth=4
set expandtab

set statusline=%<%f\ %h%m%r%=%-20.(line=%l,col=%c%V,totlin=%L%)\%h%m%r%=%-40(,%n%Y%)\%P

"colorscheme literal_tango "Set the vim back groundcolor(/usr/share/vim/vim<#>/colors)
set background=light
set splitright
syntax on            " always set autoindenting on
filetype on          " Enable file type detection
filetype plugin on

"*******Map Settings************
"map g 1G            " Use 'g' to go to the top of the file
map q :q<CR>         "Quit with 'q' instead of ':q'. VERY useful
"map w :w<CR>"       " Saving a file using Ctrl-s instead of :w
" While in command mode pressing TAB switches between the files in the buffer
nmap <tab> :if &modifiable && !&readonly && &modified <cr> :w<cr> :endif<cr> :bn<cr> 
nmap <s-tab> :if &modifiable && !&readonly && &modified <cr> :w<cr> :endif<cr> :bp<cr>
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" To quickly page through a file
nmap <Space> <PageDown>


"*********Specific File Settings************
" Do NOT put spaces for tabs in Make files
au FileType make setlocal noexpandtab
" Highlight characters after textwidth(Eg:80) 
"au BufNewFile,BufRead *.c,*.h, *.cc, *.H, *.C exec 'match Todo /\%>' .  &textwidth . 'v.\+/'



"********* Vim Plugin settings goes below this line**************
nnoremap <silent> <F8> :TlistToggle<CR>     " Press F8 to see Tag List window

" Minimbuffer Explorer Plugin Settings
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1 
"let g:miniBufExplVSplit = 30 

" OmniCPP Plugin Settings
"let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_MayCompleteScope = 1
"OmniCPP preview window to close after completion
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


" Setting Tag information for code browsing
set tags+=/usr/include/tags    "common includes
set tags+=/homes/vkalluru/cpp_src/cpp_src/tags

if has("cscope")
    set csprg=/usr/local/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("/homes/vkalluru/cscope/cscope.out")
        cs add ~/cscope/cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif
"set cst
"set nocsverb
"cs add ~/cscope/cscope.out

" Dictionary files addition
set dictionary+=~/.mydict
set paste
