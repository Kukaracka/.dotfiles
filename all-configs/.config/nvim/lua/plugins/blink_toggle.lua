return {
  {
    "saghen/blink.cmp",
    optional = true,
    opts = function(_, opts)
      -- Отключаем dot_repeat для text_edits
      opts.text_edits = opts.text_edits or {}
      opts.text_edits.dot_repeat = false

      -- Остальное без изменений
      opts.completion = opts.completion or {}
      opts.completion.list = opts.completion.list or {}
      opts.completion.list.selection = {
        preselect = false,
      }

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
        return vim.b.completion ~= false
          and not vim.tbl_contains({ "prompt" }, vim.bo.buftype)
          and vim.api.nvim_get_mode().mode ~= "c"
      end

      return opts
    end,
  },
}
