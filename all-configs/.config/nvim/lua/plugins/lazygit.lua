return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- Явно указываем путь к конфигу lazygit
    vim.g.lazygit_config_file_path = vim.fn.expand("~/.config/lazygit/config.yml")
  end,
}
