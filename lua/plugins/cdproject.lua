return {
  "LintaoAmons/cd-project.nvim",
  init = function()
    require("cd-project").setup({
      projects_config_filepath = vim.fs.normalize(vim.fn.stdpath("config") .. "/cd-project.nvim.json"),
      project_dir_pattern = { ".git", ".gitignore", "Cargo.toml", "package.json", "go.mod" },
    })
  end,
}
