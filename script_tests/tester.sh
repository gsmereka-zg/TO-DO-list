#!/bin/bash

SCRIPTS_DIR="./script_tests/scripts"
RESULTS_DIR="./script_tests/results"

mkdir -p "$RESULTS_DIR"

for script in "$SCRIPTS_DIR"/*.sh; do
    script_name=$(basename "$script" .sh)
    result_file="$RESULTS_DIR/${script_name}_output.txt"
    error_file="$RESULTS_DIR/${script_name}_error.txt"

    echo "Running $script_name..."

    # Limpa os arquivos de saída antes de rodar
    > "$result_file"
    > "$error_file"

    # Executa o script, separando stdout e stderr
    bash "$script" > "$result_file" 2> "$error_file"

    echo "Result saved to $result_file"
    echo "Errors saved to $error_file"
done

echo "All tests completed."
