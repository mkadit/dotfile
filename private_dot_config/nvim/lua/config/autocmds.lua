-- This file is automatically loaded by plugins.init

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, { command = "checktime" })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "qf",
    -- "help",
    "man",
    "notify",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})


vim.cmd([[
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

" augroup DadbodSql
"   au!
"   autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer { sources = { { name = 'vim-dadbod-completion' } } }
" augroup END

" Create new tab based on current file 
command -nargs=0 Zoom call Zoom()
function! Zoom() abort
    if winnr('$') > 1
        let lst = win_findbuf(bufnr())
        call filter(lst, "tabpagewinnr(win_id2tabwin(v:val)[0], '$') == 1")
        if len(lst) >=# 1
            call win_gotoid(lst[0])
        else
            tab split
        endif
    else
        let lst = win_findbuf(bufnr())
        call filter(lst, "v:val !=# " . win_getid())
        if len(lst) >=# 1
            wincmd c
            call win_gotoid(lst[0])
        endif
    endif
endfunction


]])
