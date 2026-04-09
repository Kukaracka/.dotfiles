#!/bin/bash

# 1. Получаем краткий аптайм для панели (например, 2h 15m)
UPTIME_SHORT=$(uptime -p | sed 's/up //; s/ hours,/h/; s/ hour,/h/; s/ minutes/m/; s/ minute/m/')

# 2. Получаем точную дату и время запуска системы
BOOT_TIME=$(who -b | awk '{print $3" "$4}')

# 3. Формируем подробный тултип
HEADER="System Status\\n--------------------\\n"
INFO="Up since:  $BOOT_TIME\\nTotal up:  $UPTIME_SHORT"

# 4. Вывод JSON
printf '{"text": "%s", "tooltip": "<tt>%s%s</tt>"}\n' "$UPTIME_SHORT" "$HEADER" "$INFO"
