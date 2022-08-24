*** Settings ***
Documentation    Estudo de utilização de Loops usando o Robot Framework

*** Variables ***
### Indice da lista    0            1          2        3        4           5
@{LISTA_DE_ITENS}    celular    carregador    fone    mouse    teclado    monitor

*** Test Cases ***
Teste de REPEAT KEYWORD
    [Documentation]    Chama uma mesma keyword diversas vezes
    Usando Repeat keyword

Teste do FOR do tipo IN RANGE
    [Documentation]    Faz um loop dentro de um intervalo que eu passar
    Usando FOR IN RANGE

Teste de FOR do tipo IN
    [Documentation]    Faz um loop percorrendo a lista que foi passada
    Usando FOR IN

Teste de FOR do tipo IN ENUMERATE
    [Documentation]    Faz um loop percorrendo a lista que passar e percorre o indice da lista
    Usando FOR IN ENUMERATE

Teste de Sair do FOR
    [Documentation]    Controlar quando o FOR deve se encerrar antes de terminar de percorrer todos os Loops
    Usando FOR IN com EXIT FOR LOOP IF

*** Keywords ***
Usando Repeat keyword
    Log To Console    ${\n}
    Repeat Keyword    8x    Log To Console     Repetição da keyword

Usando FOR IN RANGE
    Log to Console    ${\n}
    FOR    ${CONTADOR}    IN RANGE    0    5
        Log To Console    Minha posição agora é: ${CONTADOR}
    END

Usando FOR IN
    Log To Console    ${\n}
    FOR    ${ITEM}    IN    @{LISTA_DE_ITENS}
        Log To Console    Item Selecionado: ${ITEM}
    END

Usando FOR IN ENUMERATE
    Log To Console    ${\n}
    FOR    ${INDICE}    ${ITEM}    IN ENUMERATE    @{LISTA_DE_ITENS}
        Log To Console    Item Selecionado: ${INDICE} --> ${ITEM}
        No Operation
    END

Usando FOR IN com EXIT FOR LOOP IF
    Log To Console    ${\n}
    FOR    ${INDICE}    ${ITEM}    IN ENUMERATE    @{LISTA_DE_ITENS}
        Log To Console    Item Selecionado: ${INDICE} --> ${ITEM}
        Exit For Loop If    '${ITEM}'=='fone'
    END