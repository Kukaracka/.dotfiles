return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>ss", LazyVim.pick("lsp_document_symbols"), desc = "Goto Symbol" },
    { "<leader>sS", LazyVim.pick("lsp_workspace_symbols"), desc = "Goto Symbol (Workspace)" },
  },
  opts = {
    defaults = {
      file_ignore_patterns = {}, -- очищаем паттерны игнорирования
      -- Устанавливаем команду поиска по умолчанию для всех пикеров
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--no-ignore",
        "--glob",
        "!**/.git/*",
      },
    },
    pickers = {
      find_files = {
        hidden = true,
        no_ignore = true,
        -- Явно передаем команду поиска с флагами
        find_command = { "rg", "--files", "--hidden", "--no-ignore", "--glob", "!**/.git/*" },
      },
      live_grep = {
        -- Для live_grep тоже добавляем скрытые файлы
        additional_args = {
          "--hidden",
          "--no-ignore",
          "--glob",
          "!**/.git/*",
        },
      },
    },
  },
}
