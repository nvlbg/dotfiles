-- Auto refresh NERDTree for new files
function NERDTreeRefresh()
    if vim.bo.filetype == "nerdtree" then
        vim.cmd("silent exe substitute(mapcheck('R'), '<CR>', '', '')")
    end
end

vim.cmd("autocmd BufEnter * lua NERDTreeRefresh()")

-- Use '..' to go to parent directory,
-- but only for buffers containing git blob or tree
vim.cmd([[
    autocmd User fugitive if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' | nnoremap <buffer> .. :edit %:h<CR> | endif
]])

-- Clipboard synchronization
function copy()
  if vim.v.event.operator == 'y' then
    -- copies contents from the given register to the clipboard via osc52 escape sequence
    require('osc52').copy_register(vim.v.event.regname)
  end
end

vim.api.nvim_create_autocmd('TextYankPost', {callback = copy})
