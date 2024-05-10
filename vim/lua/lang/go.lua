local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true, buffer=bufnr }
 
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
 
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set('n', '<C-]>', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', ',r', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', ',a', vim.lsp.buf.code_action, opts)
end
 
local nvim_lsp = require('lspconfig')

nvim_lsp.gopls.setup {
    cmd = {'gopls', '-remote=auto'},
    on_attach = on_attach,
    flags = {
        -- Don't spam LSP with changes. Wait a second between each.
        debounce_text_changes = 1000,
    },
    init_options = {
        memoryMode = "DegradeClosed",
        gofumpt = true,
        staticcheck = true,
    },
    root_dir = nvim_lsp.util.root_pattern("main.go"),
}

function goFormatAndImports(wait_ms)
    -- vim.lsp.buf.format({ name = 'efm' })
    vim.lsp.buf.format({ timeout_ms = wait_ms })
end

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function(args)
        goFormatAndImports(3000)
    end,
})

local golangci_lint = require('efmls-configs.linters.golangci_lint')
local goimports = require('efmls-configs.formatters.goimports')
local languages = {
  go = { golangci_lint, goimports },
}

local efmls_config = {
  filetypes = vim.tbl_keys(languages),
  settings = {
    rootMarkers = { '.git/' },
    languages = languages,
  },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
}

nvim_lsp.efm.setup(vim.tbl_extend('force', efmls_config, {
  -- Pass your custom lsp config below like on_attach and capabilities
  --
  -- on_attach = on_attach,
  -- capabilities = capabilities,
}))
