#!/bin/bash

echo "Forzando modo ERB en todos los archivos .html.erb..."

find . -name "*.html.erb" | while read file; do
  echo "Procesando: $file"
  code --wait "$file" > /dev/null 2>&1
done

echo "¡Listo! Todos los .html.erb ahora son ERB"
