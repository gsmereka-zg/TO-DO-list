#!/bin/bash

# Define o nome do arquivo temporário
TEMP_FILE=$(mktemp)

# Escreve os comandos e comentários no arquivo temporário
cat > "$TEMP_FILE" << EOF
# Este é um comentário, será ignorado
1
Test Task
This is a test
2025-09-05
# Outro comentário
3
Work
TODO
2
0
# Fim
EOF

# Lê o arquivo temporário, filtra as linhas que começam com '#' e executa o programa
grep -v '^#' "$TEMP_FILE" | java -jar todolist.jar

# Remove o arquivo temporário
rm "$TEMP_FILE"