local lsp = require("lsp-zero")

-- no clue what this does
lsp.preset("recommended")

-- default installed lsps
-- lsp.ensure_installed({
--     'tsserver',
--     'lua_ls',
--     'gopls',
-- })

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

-- completion plugin
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select), -- p: previous selection
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select), -- n: next selection
    ['<CR>'] = cmp.mapping.confirm({ select = true }),    -- y: yes: accept
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

local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*.py" },
    desc = "Auto-format python files after saving",
    callback = function()
        local fileName = vim.api.nvim_buf_get_name(0)
        vim.cmd(":silent !black " .. fileName)
    end,
    group = autocmd_group,
})

-- for some reason we need to specify to take the frist item in the quickfix list
local function on_list(options)
    vim.fn.setqflist({}, ' ', options)
    vim.api.nvim_command('cfirst')
end

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    local new_tab_keys = vim.api.nvim_replace_termcodes('<C-w>s<C-w>j<C-w>T', true, false, true)
    local split_screen_keys = vim.api.nvim_replace_termcodes('<C-w>v<C-w>l', true, false, true)

    -- get definition
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition { on_list = on_list } end, opts)
    vim.keymap.set("n", "<Leader>gd", function()
        vim.lsp.buf.definition { on_list = on_list }
        vim.api.nvim_feedkeys(new_tab_keys, 'n', false)
    end, opts)
    vim.keymap.set("n", "<C-g><C-d>", function()
        vim.api.nvim_feedkeys(split_screen_keys, 'n', false)
        vim.lsp.buf.definition { on_list = on_list }
    end, opts)

    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)                  -- knowledge
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
        ['black'] = { 'python' }
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
