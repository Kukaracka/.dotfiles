#!/bin/bash

# Путь к файлу блокировки (любой временный файл)
LOCKFILE="/tmp/niri_autostart.lock"

# Ожидаем своей очереди на запуск (эксклюзивная блокировка)
exec 200>$LOCKFILE
flock 200

# --- Далее идет ваша логика ---
CMD=$1
ID=$2
WS=$3

# Сохраняем воркспейс, с которого начали
START_WS=$(niri msg --json workspaces | jq -r '.[] | select(.is_focused == true) | .id')

# Переключаемся и запускаем
niri msg action focus-workspace "$WS"
niri msg action spawn -- $CMD

# Цикл ожидания фокуса
while true; do
    CURRENT=$(niri msg --json focused-window | jq -r '.app_id // empty')
    if [ "$CURRENT" == "$ID" ]; then
        # Возвращаемся в исходную точку
        niri msg action focus-workspace "$START_WS"
        break
    fi
    sleep 0.2
done

# Как только скрипт завершится, flock автоматически снимет блокировку
# и следующий экземпляр в очереди начнет работу.
