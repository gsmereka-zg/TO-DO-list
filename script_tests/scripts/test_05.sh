#!/bin/bash

# Define o nome do arquivo temporário.
TEMP_FILE=$(mktemp)

# Escreve o conteúdo do teste no arquivo temporário, com comentários.
cat > "$TEMP_FILE" << EOF
# --- Adicionar 5 Tarefas com Prioridades Variadas ---

# Tarefa 1 (Prioridade: 2)
1
Limpar a garagem
Organizar ferramentas e caixas
2025-10-01
2
Casa
TODO

# Tarefa 2 (Prioridade: 4) - Será filtrada depois
1
Preparar relatório anual
Coletar dados e formatar o documento
2025-10-05
4
Trabalho
DOING

# Tarefa 3 (Prioridade: 1)
1
Ler um livro
Terminar o capítulo sobre ficção científica
2025-10-02
1
Lazer
TODO

# Tarefa 4 (Prioridade: 4) - Também será filtrada
1
Finalizar projeto
Revisar o código e fazer os últimos ajustes
2025-10-07
4
Estudo
TODO

# Tarefa 5 (Prioridade: 3)
1
Agendar consulta
Marcar uma visita ao dentista
2025-10-03
3
Pessoal
DONE

# --- Listar Todas as Tarefas ---
# A saída deve mostrar as 5 tarefas recém-adicionadas.
2

# --- Filtrar e Listar por Prioridade Específica ---
# A saída deve mostrar apenas as tarefas com prioridade 4.
5
4

# --- Sair do Programa ---
0
EOF

# Lê o arquivo temporário, filtra as linhas de comentário e passa
# a entrada para o programa Java.
grep -v '^[[:space:]]*#' "$TEMP_FILE" | java -jar todolist.jar

# Remove o arquivo temporário.
rm "$TEMP_FILE"