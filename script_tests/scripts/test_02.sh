#!/bin/bash

# Define o nome do arquivo temporário.
TEMP_FILE=$(mktemp)

# Escreve o conteúdo do teste no arquivo temporário, com comentários.
cat > "$TEMP_FILE" << EOF
# --- Teste de Adicionar Tarefa 1 ---
1
Teste 1
Descrição da primeira tarefa de teste.
2025-10-15
3
Trabalho
TODO

# --- Teste de Adicionar Tarefa 2 ---
1
Teste 2
Descrição da segunda tarefa de teste.
2025-10-16
5
Pessoal
DOING

# --- Teste de Listar Todas as Tarefas ---
2

# --- Teste de Listar por Categoria ---
4
Trabalho

# --- Teste de Deletar Tarefa ---
3
0

# --- Teste de Listar Todas as Tarefas Novamente ---
2

# --- Sair do Programa ---
0
EOF

# Lê o arquivo temporário, filtra as linhas que começam com '#'
# e passa a entrada para o programa Java.
grep -v '^[[:space:]]*#' "$TEMP_FILE" | java -jar todolist.jar

# Remove o arquivo temporário.
rm "$TEMP_FILE"

echo "Teste concluído."