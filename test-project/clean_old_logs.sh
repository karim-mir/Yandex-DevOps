#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Использование: $0 <директория> <дней>"
    exit 1
fi

LOG_DIR="$1"
DAYS="$2"

if [ ! -d "$LOG_DIR" ]; then
    echo "Директория не существует: $LOG_DIR"
    exit 1
fi

OLD_FILES=$(find "$LOG_DIR" -maxdepth 1 -name "*.log" -type f -mtime +"$DAYS")

if [ -z "$OLD_FILES" ]; then
    echo "Нет файлов .log старше $DAYS дней"
    exit 0
fi

echo "Найдены файлы:"
echo "$OLD_FILES"
echo ""
read -p "Удалить эти файлы? (y/n): " answer

if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
    echo "$OLD_FILES" | xargs rm -v
    echo "Файлы удалены"
else
    echo "Отмена удаления"
fi
