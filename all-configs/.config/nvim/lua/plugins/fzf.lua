return {
  {
    "ibhagwan/fzf-lua",
    opts = {
      files = {
        cmd = "rg --files --hidden --no-ignore --glob '!**/.git/*'",
        hidden = true,
        no_ignore = true,
      },
      grep = {
        rg_opts = "--hidden --no-ignore --glob '!**/.git/*' --color=never --no-heading --with-filename --line-number --column --smart-case",
        hidden = true,
        no_ignore = true,
      },
      live_grep = {
        rg_opts = "--hidden --no-ignore --glob '!**/.git/*' --color=never --no-heading --with-filename --line-number --column --smart-case",
        hidden = true,
        no_ignore = true,
      },
    },
  },
}
