#!/bin/bash

# 1. Берем общую температуру (Package) для вывода на панель
PACKAGE_TEMP=$(sensors | grep 'Package id 0' | grep -oP '\+\K[0-9.]+' | head -n 1)
PACKAGE_ROUND=$(printf "%.0f" "$PACKAGE_TEMP" 2>/dev/null || echo "0")

# 2. Собираем все строки Core (ядра) и форматируем их в таблицу
# Мы ищем строки "Core", берем название и саму температуру
CORES_TABLE=$(sensors | grep 'Core' | awk '{
    # Убираем лишние символы из температуры (+, °C, запятые)
    gsub(/[+°C,]/, "", $3); 
    # Форматируем: название (Core 0:) и значение
    printf "%-12s %5.0f°C\\n", $1" "$2, $3
}')

# 3. Заголовок
HEADER="Component       Temp\\n--------------------\\n"

# 4. Вывод JSON
# На панели — общая температура, в тултипе — список ядер
printf '{"text": "%s°C", "tooltip": "<tt>%s%s</tt>"}\n' "$PACKAGE_ROUND" "$HEADER" "$CORES_TABLE"
