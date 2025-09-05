#!/bin/bash

# Define o nome do arquivo temporário.
TEMP_FILE=$(mktemp)

# Escreve o conteúdo do teste no arquivo temporário, com comentários.
cat > "$TEMP_FILE" << EOF
# --- Adicionar 5 Tarefas Diferentes ---

# Tarefa 1 (Status: TODO)
1
Limpar a casa
Tirar o pó e aspirar os cômodos
2025-10-01
2
Casa
TODO

# Tarefa 2 (Status: DOING)
1
Preparar apresentação
Organizar slides para o seminário
2025-10-05
4
Estudo
DOING

# Tarefa 3 (Status: DONE) - Será filtrada depois
1
Fazer exercícios
Ir à academia por uma hora
2025-10-02
3
Pessoal
DONE

# Tarefa 4 (Status: TODO)
1
Revisar código
Verificar o código do projeto
2025-10-07
5
Estudo
TODO

# Tarefa 5 (Status: DONE) - Também será filtrada
1
Finalizar relatório
Escrever a conclusão do documento
2025-10-03
1
Trabalho
DONE

# --- Listar Todas as Tarefas ---
# A saída deve mostrar as 5 tarefas recém-adicionadas.
2

# --- Filtrar e Listar por Status Específico ---
# A saída deve mostrar apenas as tarefas com o status "DONE".
6
DONE

# --- Sair do Programa ---
0
EOF

# Lê o arquivo temporário, filtra as linhas de comentário e passa
# a entrada para o programa Java.
grep -v '^[[:space:]]*#' "$TEMP_FILE" | java -jar todolist.jar

# Remove o arquivo temporário.
rm "$TEMP_FILE"