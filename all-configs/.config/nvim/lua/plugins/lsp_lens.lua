return {
  "VidocqH/lsp-lens.nvim",
  lazy = true,
  event = "LspAttach",
  config = function()
    local SymbolKind = vim.lsp.protocol.SymbolKind

    require("lsp-lens").setup({
      enable = true,
      include_declaration = false,
      sections = {
        definition = function(count)
          return "Definitions: " .. count
        end,
        references = function(count)
          return "References: " .. count
        end,
        implements = function(count)
          return "Implements: " .. count
        end,
      },
      ignore_filetype = {
        "vim",
        "lua",
        "markdown",
        "json",
        "yaml",
      },
      target_symbol_kinds = { SymbolKind.Function, SymbolKind.Method, SymbolKind.Interface },
      wrapper_symbol_kinds = { SymbolKind.Class, SymbolKind.Struct },
    })

    local lens = require("lsp-lens.lens-util")
    vim.api.nvim_create_autocmd({ "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("lsp_lens_extra", { clear = true }),
      callback = function()
        if vim.bo.filetype == "python" then
          lens:procedure()
        end
      end,
    })
  end,
}
