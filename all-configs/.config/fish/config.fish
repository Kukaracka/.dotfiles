# function fish_prompt -d "Write out the prompt"
#     # Минималистичный prompt: user@host ~/path >
#     printf '%s@%s %s%s%s > ' \
#         $USER $hostname \
#         (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
# end

# Это переменная окружения для работы snap
# echo 'export PATH=$PATH:/var/lib/snapd/snap/bin'
bind \ch backward-kill-word

if status is-interactive
    # --- Общие настройки ---
    set fish_greeting  # Без приветствия

    # --- Инициализация внешних инструментов ---
    # starship init fish | source

    # if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    #     cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    # end
    set -g fish_term24bit 1
    zoxide init fish | source
    # --- Алиасы: переопределения и обёртки ---
    alias clear "printf '\033[2J\033[3J\033[1;1H'"  # Полная очистка экрана
    alias grep='rg'          # ripgrep вместо grep
    alias ls='lsd'           # lsd вместо ls
    # alias pacman='sudo pacman'  # безопаснее: всегда с sudo
    alias q='qs -c ii'       # твоя кастомная команда


    # Редактор и окружения
    abbr -a n 'nvim'
    abbr -a c 'clear'
    # abbr -a y 'yazi'
    abbr -a sen 'sudo -E nvim'
    abbr -a bt 'bluetui'
    abbr -a wf 'impala'
    abbr -a lzd 'lazydocker'
    abbr -a lzg 'lazygit'


    abbr -a venv 'source .venv/bin/activate.fish'

    # Пакетный менеджер
    abbr -a spcs  'sudo pacman -S'
    abbr -a spcss  'sudo pacman -Ss'
    abbr -a spcr  'sudo pacman -R'
    abbr -a spcrhn 'sudo pacman -Rhn'
    abbr -a spcsyu 'sudo pacman -Syu'

    # Tmux abbreviations
    abbr -a tl   'tmux ls'
    abbr -a ta   'tmux attach -t'
    abbr -a tn   'tmux new -s'
    abbr -a tk   'tmux kill-session -t'
    abbr -a td   'tmux detach'
    abbr -a tra  'tmux attach'
    abbr -a trm  'tmux kill-server'

    # Расширенные варианты ls
    abbr -a la 'ls -a'
    abbr -a l 'ls -l'
    abbr -a lla 'ls -la'
    abbr -a lt 'ls --tree'

    # Systemctl
    abbr -a sss 'sudo systemctl start'
    abbr -a ssst 'sudo systemctl stop'

    abbr -a sse 'sudo systemctl enable'
    abbr -a ssd 'sudo systemctl disable'
    # Copy 

    abbr -a copy "wl-copy <"

    # Системные команды
    abbr -a sdn 'shutdown now'

end


function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
# --- Завершающие украшения (при старте терминала) ---
# pokemon-colorscripts --no-title -s -r | fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5 --logo -
if status is-interactive
and not set -q TMUX
    # Пытаемся подключиться к сессии с именем "main", если её нет — создаем
    exec tmux new-session -A -s main
end

# Created by `pipx` on 2026-02-28 06:47:13
set PATH $PATH /home/kukaracka/.local/bin
