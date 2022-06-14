local command = vim.api.nvim_create_user_command
local bo = vim.bo

command("WriteAndReload", function()
  if bo.filetype == "vim" then
    vim.cmd "write"
    vim.cmd "source %"
  elseif bo.filetype == "lua" then
    vim.cmd "write"
    vim.cmd "luafile %"
  end
end, { nargs = 0 })

vim.cmd [[
" Function for diff
let g:diff_window = 0
function! DiffToggle()
    if g:diff_window
        diffoff!
        let g:diff_window= 0
    else
        windo diffthis
        let g:diff_window= 1
    endif
endfunction

" Function for toggling terminal
let g:term_active = 0
let g:many_tab = 0
function! ToggleTerm()
	if g:term_active
        if tabpagenr('$') > 1
            tabnext
        else
            tabe
            buf term
            call CleanEmptyBuffers()
        endif
	else
		tabe | term
	endif
endfunction
autocmd TermOpen * let g:term_active = 1
autocmd TermClose * let g:term_active = 0

" Function for deleting all empty buffer
function! CleanEmptyBuffers()
    let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val)<0 && !getbufvar(v:val, "&mod")')
    if !empty(buffers)
        exe 'bw ' . join(buffers, ' ')
    endif
endfunction

function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

augroup DadbodSql
  au!
  autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer { sources = { { name = 'vim-dadbod-completion' } } }
augroup END

]]
