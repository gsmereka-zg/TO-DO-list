#!/bin/bash

# Define o nome do arquivo temporário.
TEMP_FILE=$(mktemp)

# Escreve o conteúdo do teste no arquivo temporário, com comentários.
cat > "$TEMP_FILE" << EOF
# --- Adicionar 5 Tarefas ---

# Tarefa 1: Compras
1
Comprar mantimentos
Leite, pão e ovos
2025-09-10
2
Casa
TODO

# Tarefa 2: Estudo
1
Estudar Bash Scripting
Aprender a manipular arquivos
2025-09-15
4
Estudo
DOING

# Tarefa 3: Lazer
1
Assistir filme
Ver o novo lançamento de ficção científica
2025-09-12
1
Lazer
TODO

# Tarefa 4: Trabalho
1
Reunião com a equipe
Preparar a apresentação de resultados
2025-09-11
5
Trabalho
DONE

# Tarefa 5: Pessoal
1
Pagar contas
Contas de água e luz
2025-09-09
3
Pessoal
TODO

# --- Listar Todas as Tarefas para Verificar ---
# A saída deve mostrar as 5 tarefas recém-adicionadas.
2

# --- Sair do Programa ---
0
EOF

# Lê o arquivo temporário, filtra as linhas de comentário e passa
# a entrada para o programa Java.
grep -v '^[[:space:]]*#' "$TEMP_FILE" | java -jar todolist.jar

# Remove o arquivo temporário.
rm "$TEMP_FILE"

echo "Teste de adição e listagem de 5 tarefas concluído."