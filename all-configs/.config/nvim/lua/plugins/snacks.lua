return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          layout = {
            layout = {
              width = 25, -- Установите здесь нужную ширину (например, 40)
            },
          },
        },
        files = {
          hidden = true,
          dirs = { vim.fn.getcwd() },
        },
      },
    },
  },
}
