#!/bin/bash

# 1. Формируем таблицу с группировкой
# ps выводит имя и RSS. awk суммирует RSS для одинаковых имен.
TABLE=$(ps axch -o cmd,rss | awk '{
    name = $1;
    # Если имя длинное или составное (например, Isolated), берем первые 15 символов
    name = substr(name, 1, 15);
    # Суммируем память (RSS) для этого имени
    mem[name] += $NF;
}
END {
    # После сбора всех данных сортируем по памяти (численно, в обратном порядке)
    for (n in mem) {
        printf "%-15s %10.0f MB\n", n, mem[n]/1024
    }
}' | sort -rnk2 | head -n 10 | awk '{printf "%-15s %10s MB\\n", $1, $2}')

# 2. Заголовок
HEADER="Process                RAM\\n---------------------------\\n"

# 3. Вывод JSON для Waybar
echo "{\"text\": \"$(free -h | awk '/Mem:/ {print $3}' | sed 's/Gi/G/')\", \"tooltip\": \"<tt>$HEADER$TABLE</tt>\"}"
