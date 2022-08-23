*** Settings ***
Documentation    Estudo de utilização de Loops usando o Robot Framework

*** Variables ***
### Indice da lista    0            1          2        3        4
@{LISTA_DE_ITENS}    celular    carregador    fone    mouse    teclado

*** Test Cases ***
Teste de REPEAT KEYWORD
    [Documentation]    Chama uma mesma keyword diversas vezes
    Usando Repeat keyword

Teste do FOR do tipo IN RANGE
    [Documentation]    Faz um loop dentro de um intervalo que eu passar
    Usando FOR IN RANGE

Teste de FOR do tipo IN

Teste de FOR do tipo IN ENUMERATE

Teste de Sair do FOR

*** Keywords ***
Usando Repeat keyword
    Log To Console    ${\n}
    Repeat Keyword    8x    Log To Console     Repetição da keyword

Usando FOR IN RANGE
    Log to Console    ${\n}
    FOR    ${CONTADOR}    IN RANGE    0    5
        Log To Console    Minha posição agora é: ${CONTADOR}
    END