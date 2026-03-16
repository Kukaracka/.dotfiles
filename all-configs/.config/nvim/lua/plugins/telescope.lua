return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>ss", LazyVim.pick("lsp_document_symbols"), desc = "Goto Symbol" },
    { "<leader>sS", LazyVim.pick("lsp_workspace_symbols"), desc = "Goto Symbol (Workspace)" },
  },
  opts = {
    defaults = {
      -- Это заставит ВСЕ поисковики telescope видеть скрытые файлы
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    },
    pickers = {
      find_files = {
        hidden = true,
      },
    },
  },
}
