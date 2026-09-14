 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#1a1d23',
    base01 = '#2b313b',
    base02 = '#262c36',
    base03 = '#626871',
    base04 = '#afb2b6',
    base05 = '#f2f2f3',
    base06 = '#f2f2f3',
    base07 = '#f2f2f3',
    base08 = '#fd4663',
    base09 = '#a177bb',
    base0A = '#7f77bb',
    base0B = '#889fc4',
    base0C = '#c4aad4',
    base0D = '#aabad5',
    base0E = '#afaad4',
    base0F = '#cfcce5',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#f2f2f3',          bg = '#1a1d23' })
  hi('TelescopeBorder',         { fg = '#626871',             bg = '#1a1d23' })
  hi('TelescopePromptNormal',   { fg = '#f2f2f3',          bg = '#1a1d23' })
  hi('TelescopePromptBorder',   { fg = '#626871',             bg = '#1a1d23' })
  hi('TelescopePromptPrefix',   { fg = '#889fc4',             bg = '#1a1d23' })
  hi('TelescopePromptCounter',  { fg = '#afb2b6',  bg = '#1a1d23' })
  hi('TelescopePromptTitle',    { fg = '#1a1d23',             bg = '#889fc4' })
  hi('TelescopePreviewTitle',   { fg = '#1a1d23',             bg = '#7f77bb' })
  hi('TelescopeResultsTitle',   { fg = '#1a1d23',             bg = '#a177bb' })
  hi('TelescopeSelection',      { fg = '#f2f2f3',          bg = '#262c36' })
  hi('TelescopeSelectionCaret', { fg = '#889fc4',             bg = '#262c36' })
  hi('TelescopeMatching',       { fg = '#889fc4',             bold = true })
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
