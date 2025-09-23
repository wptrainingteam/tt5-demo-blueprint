#!/bin/bash

# Script to replace URL patterns in playground-content.xml with user input

default_find="http://localhost:8881/wp-content/uploads/2025/09/"
default_replace="https://raw.githubusercontent.com/wptrainingteam/tt5-demo-blueprint/main/media/"

# Check for --use-defaults flag
if [[ "$1" == "--use-defaults" ]]; then
    find_url="$default_find"
    replace_url="$default_replace"
    echo "Using default values:"
    echo "Find: $find_url"
    echo "Replace: $replace_url"
else
    read -p "Enter the URL to find [$default_find]: " find_url
    find_url=${find_url:-$default_find}

    read -p "Enter the replacement URL [$default_replace]: " replace_url
    replace_url=${replace_url:-$default_replace}
fi

# Escape special characters for sed
escaped_find=$(printf '%s\n' "$find_url" | sed 's/[\[\].*^$(){}?+|/\]/\\&/g')
escaped_replace=$(printf '%s\n' "$replace_url" | sed 's/[\[\].*^$(){}?+|/\]/\\&/g')

# Count occurrences before replacement
count_before=$(grep -o "<wp:attachment_url><!\[CDATA\[$escaped_find" playground-content.xml | wc -l)

sed -i.bak "s|<wp:attachment_url><!\[CDATA\[\($escaped_find\)|<wp:attachment_url><![CDATA[$escaped_replace|g" playground-content.xml

echo "URL replacement completed. Original file backed up as playground-content.xml.bak"
echo "Replaced '$find_url' with '$replace_url'"
echo "Number of replacements made: $count_before"