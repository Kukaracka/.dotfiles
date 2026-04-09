#!/bin/bash

# 1. Узнаем количество ядер (потоков)
CORES=$(nproc)

# 2. Считаем общую загрузку (она уже в масштабе 100%)
CPU_TOTAL=$(top -bn1 | grep "Cpu(s)" | sed "s/,/\./g" | awk '{print $2 + $4}')

# 3. Формируем таблицу ТОП-6, деля каждое значение на количество ядер
TABLE=$(top -bn1 -o %CPU | awk -v cores="$CORES" 'NR>7 && NR<18 {
    # Берем %CPU ($9), убираем запятую и делим на количество ядер
    gsub(/,/, ".", $9);
    cpu_scaled = $9 / cores;
    # Название процесса ($12)
    name = substr($12, 1, 18);
    printf "%-20s %7.1f%%\\n", name, cpu_scaled
}')

# 4. Заголовок
HEADER="Process                  CPU\\n--------------------------------\\n"

# 5. Вывод JSON
printf '{"text": "%.1f%%", "tooltip": "<tt>%s%s</tt>"}\n' "$CPU_TOTAL" "$HEADER" "$TABLE"
