return {
  "folke/snacks.nvim",
  opts = {
    zen = {
      enter = false,
      backdrop = false,
      styles = {},
      show = {
        statusline = true,
        tabline = true,
        number = true,
        relativenumber = true,
      },
    },
    win = {
      width = 85, -- Глобальная ширина по умолчанию для обычных окон snacks
    },
    -- Добавляем исключение конкретно для стиля окна lazygit
    styles = {
      lazygit = {
        width = 0.9, -- 90% от ширины экрана
        height = 0.9, -- 90% от высоты экрана
      },
    },
    picker = {
      hidden = true,
      ignored = true,
      sources = {
        explorer = {
          layout = {
            layout = {
              position = "left",
              width = 0.3,
            },
          },
          hidden = true,
          ignored = true,
        },
        files = {
          hidden = true,
          ignored = true,
        },
      },
    },
  },
}
