local lsp = require("lsp-zero")

-- no clue what this does
lsp.preset("recommended")

-- default installed lsps
lsp.ensure_installed({
    'tsserver',
    'lua_ls',
    'gopls',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


-- completion plugin
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select), -- p: previous selection
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select), -- n: next selection
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),   -- y: yes: accept
    ['<C-Space>'] = cmp.mapping.complete(),               -- idk that's how everyone does this
})
-- eleminating previous mapping
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

-- initializing lsp-zero cmp to the mapping we created
lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts) -- get definition
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)       -- knowledge
    -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts) -- commented cuz idk what it does
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts) -- view diagnostic
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts) -- ommented cuz idk what it does
end)

lsp.format_on_save({
    servers = {
        ['tsserver'] = { 'typescript' },
        ['lua_ls'] = { 'lua' },
        ['gopls'] = { 'go' },
    }
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = 'fuck you',
        prefix = '',
    },
})
