#!/bin/bash

# todo.sh Um programa para gerenciar 
# uma lista de tarefas

ARQUIVO_TODO="$HOME/.todo.txt"

#cores
GREEN="\e[1;32m"
NC="\e[0m" # sem cor

function adicionar_tarefa() {
    TAREFA=$1
    PRIORIDADE=$2
    DATA=$(date +%Y-%m-%d)

    # []|data|prioridade|tarefa
    
    echo "[]|$DATA|${PRIORIDADE^^}|$TAREFA" >> $ARQUIVO_TODO
    
    echo -e "${GREEN}Tarefa foi adicionada com sucesso${NC}"    
}

function listar_tarefas() {
    linha=1

    while IFS='|' read -r status data prioridade tarefa; 
    do
        echo "$linha. $status | $data | $prioridade | $tarefa"

        ((linha++))

    done < $ARQUIVO_TODO     
}

function fechar_tarefa(){
    NUMERO=$1
    ARQ_TEMP=$(mktemp)

    linha=1
    while IFS='|' read -r status resto; 
    do
        if [ $NUMERO -eq $linha ];
        then
            if [ $status = "[]" ]; then
                echo "[x]|$resto" >> $ARQ_TEMP
                echo "Tarefa concluída com sucesso!"
            else 
                echo "[]|$resto" >> $ARQ_TEMP
                echo "Tarefa desmarcada com sucesso!"
            fi
        else 
            echo "$status|$resto" >> $ARQ_TEMP
        fi       

        ((linha++))

    done < $ARQUIVO_TODO 

    mv $ARQ_TEMP $ARQUIVO_TODO
}

function deletar_tarefa() {
    NUMERO=$1
    ARQ_TEMP=$(mktemp)

    linha=1
    while IFS='|' read -r status resto; 
    do
        if [ $NUMERO -eq $linha ];
        then
            echo "Tarefa foi deletada!"
        else 
            echo "$status|$resto" >> $ARQ_TEMP
        fi       

        ((linha++))

    done < $ARQUIVO_TODO 

    mv $ARQ_TEMP $ARQUIVO_TODO
}

function procurar_tarefa() {
    TERMO=$1

    encontrado=0
    linha=1
    while IFS='|' read -r status resto; 
    do
        if echo $resto | grep -qi $TERMO;
        then
            echo "$linha. | $status | $resto"
            encontrado=1
        fi       

        ((linha++))

    done < $ARQUIVO_TODO 

    if [ $encontrado -eq 0 ]; then
        echo "Não foi encontrado tarefa com esse termo"
    fi
}

function mostrar_ajuda() {
    echo "Uso: $0 [parametro] opção"
    echo ""
    echo "  add \"TAREFA\" [prioridade]  - adicionar tarefa"
    echo "  list - listar tarefas"
    echo "  done NUM - finalizar tarefa"
    echo "  del NUM - deletar tarefa"
    echo "  search TERMO - procurar uma tarefa"
    echo ""
    echo "Exemplo: ./todo.sh add \"ir pra academia\" MEDIA"
}

case $1 in 
    "add")
        adicionar_tarefa "$2" "$3"
     ;;
    "list")
        listar_tarefas
     ;;
    "done")
        fechar_tarefa $2
     ;;
    "del")
        deletar_tarefa $2
     ;;
    "search")
        procurar_tarefa $2
     ;;
    *)
        mostrar_ajuda
     ;;
esac
