 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#1a1d23',
    base01 = '#2b303b',
    base02 = '#262a36',
    base03 = '#636873',
    base04 = '#afb1b6',
    base05 = '#f2f2f3',
    base06 = '#f2f2f3',
    base07 = '#f2f2f3',
    base08 = '#fd4663',
    base09 = '#a283af',
    base0A = '#8c81b1',
    base0B = '#8b9ac1',
    base0C = '#c6afd0',
    base0D = '#acb7d3',
    base0E = '#b6afd0',
    base0F = '#d3cde4',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#f2f2f3',          bg = '#1a1d23' })
  hi('TelescopeBorder',         { fg = '#636873',             bg = '#1a1d23' })
  hi('TelescopePromptNormal',   { fg = '#f2f2f3',          bg = '#1a1d23' })
  hi('TelescopePromptBorder',   { fg = '#636873',             bg = '#1a1d23' })
  hi('TelescopePromptPrefix',   { fg = '#8b9ac1',             bg = '#1a1d23' })
  hi('TelescopePromptCounter',  { fg = '#afb1b6',  bg = '#1a1d23' })
  hi('TelescopePromptTitle',    { fg = '#1a1d23',             bg = '#8b9ac1' })
  hi('TelescopePreviewTitle',   { fg = '#1a1d23',             bg = '#8c81b1' })
  hi('TelescopeResultsTitle',   { fg = '#1a1d23',             bg = '#a283af' })
  hi('TelescopeSelection',      { fg = '#f2f2f3',          bg = '#262a36' })
  hi('TelescopeSelectionCaret', { fg = '#8b9ac1',             bg = '#262a36' })
  hi('TelescopeMatching',       { fg = '#8b9ac1',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
