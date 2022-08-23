*** Settings ***
Documentation    Exemplo de Utilização de Listas

*** Variable ***
@{MESES_ANO}    Janeiro    Fevereiro    Março    Abril    Maio    Junho    Julho    Agosto    Setembro    Outubro    Novembro    Dezembro

*** Test Cases ***
Imprimir lista com os 12 meses do ano
    Imprimir meses

*** Keywords ***
Imprimir meses
    Log To Console    Mês 01: ${MESES_ANO[0]}
    Log To Console    Mês 02: ${MESES_ANO[1]}
    Log To Console    Mês 03: ${MESES_ANO[2]}
    Log To Console    Mês 04: ${MESES_ANO[3]}
    Log To Console    Mês 05: ${MESES_ANO[4]}
    Log To Console    Mês 06: ${MESES_ANO[5]}
    Log To Console    Mês 07: ${MESES_ANO[6]}
    Log To Console    Mês 08: ${MESES_ANO[7]}
    Log To Console    Mês 09: ${MESES_ANO[8]}
    Log To Console    Mês 10: ${MESES_ANO[9]}
    Log To Console    Mês 11: ${MESES_ANO[10]}
    Log To Console    Mês 12: ${MESES_ANO[11]}