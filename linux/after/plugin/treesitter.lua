require'nvim-treesitter.configs'.setup {
  -- A list of parser names
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "go", "javascript", "typescript", "python", "bash"},

  -- Install parsers synchronously
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
