return {
  "saghen/blink.cmp",
  -- Make blink.cmp toogleable
  opts = function(_, opts)
    vim.b.completion = true

    opts.preset = "default"

    Snacks.toggle({
      name = "Completion",
      get = function()
        return vim.b.completion
      end,
      set = function(state)
        vim.b.completion = state
      end,
    }):map("<leader>uk")

    opts.enabled = function()
      -- Отключаем, если:
      -- 1. Переключатель выключен (ваша логика)
      -- 2. Тип буфера "prompt" (поля ввода поиска)
      -- 3. Это обычная командная строка (нажатие ":")
      return vim.b.completion ~= false
        and not vim.tbl_contains({ "prompt" }, vim.bo.buftype)
        and vim.api.nvim_get_mode().mode ~= "c"
    end
    return opts
  end,
}
