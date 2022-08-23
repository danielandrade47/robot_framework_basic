*** Settings ***
Library   String

*** Variables ***
&{PESSOA}   nome=Daniel   sobrenome=Andrade

*** Test Cases ***
Imprimir um e-mail customizado e aleatório
    ${EMAIL_CRIADO}    Criar e-mail customizado    ${PESSOA.nome}    ${PESSOA.sobrenome}
    Log To Console     ${EMAIL_CRIADO}


*** Keywords ***
Criar e-mail customizado
    [Arguments]       ${NOME}  ${SOBRENOME}
    ${PALAVRA_ALEATORIA}      Generate Random String
    ${EMAIL_FINAL}    Set Variable    ${NOME}${SOBRENOME}${PALAVRA_ALEATORIA}@email.com
    [Return]          ${EMAIL_FINAL}