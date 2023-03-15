
call plug#begin()
" Material Theme
Plug 'marko-cerovac/material.nvim'
" airline
Plug 'vim-airline/vim-airline'
" editor
Plug 'liuchengxu/vim-which-key'
" Welcome
Plug 'mhinz/vim-startify'
" file manager
Plug 'lambdalisue/fern.vim'
" file search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" language-server
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" markdown
Plug 'instant-markdown/vim-instant-markdown'
" tex
Plug 'lervag/vimtex'
" snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" comment
Plug 'tpope/vim-commentary'|Plug 'tomtom/tcomment_vim'
call plug#end()

set showtabline=1

" Commenting blocks of code.
augroup commenting_blocks_of_code
    autocmd!
    autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
    autocmd FileType sh,ruby,python   let b:comment_leader = '# '
    autocmd FileType conf,fstab       let b:comment_leader = '# '
    autocmd FileType tex              let b:comment_leader = '% '
    autocmd FileType mail             let b:comment_leader = '> '
    autocmd FileType vim              let b:comment_leader = '" '
augroup END
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" inlay hints https://www.reddit.com/r/vim/comments/wx77sa/vimlsp_merged_inlay_hints_support/
let g:lsp_inlay_hints_enabled = 1
let g:lsp_inlay_hints_mode = {
\  'normal': ['always'],
\}

autocmd User lsp_setup call lsp#register_server({
\   'name': 'gopls',
\   'cmd': ['gopls'],
\   'allowlist': ['go'],
\   'initialization_options': {
\     'ui.inlayhint.hints': {
\         'assignVariableTypes': v:false,
\         'compositeLiteralFields': v:false,
\         'compositeLiteralTypes': v:false,
\         'constantValues': v:false,
\         'functionTypeParameters': v:true,
\         'parameterNames': v:true,
\         'rangeVariableTypes': v:false,
\     },
\   }
\ })