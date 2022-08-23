*** Settings ***
Documentation    Exemplo de Utilização de Dicionario

*** Variables ***
&{MESES_DIAS_2022}     Janeiro=31
...                    Fevereiro=28
...                    Março=31
...                    Abril=30
...                    Maio=31
...                    Junho=30
...                    Julho=31
...                    Agosto=31
...                    Setembro=30
...                    Outubro=31
...                    Novembro=30
...                    Dezembro=31

*** Test Cases ***
Imprimir meses e dias de 2022
    Log To Console     Em JANEIRO há ${MESES_DIAS_2022.Janeiro} dias!
    Log To Console     Em FEVEREIRO há ${MESES_DIAS_2022.Fevereiro} dias!
    Log To Console     Em MARÇO há ${MESES_DIAS_2022.Março} dias!
    Log To Console     Em ABRIL há ${MESES_DIAS_2022.Abril} dias!
    Log To Console     Em MAIO há ${MESES_DIAS_2022.Maio} dias!
    Log To Console     Em JUNHO há ${MESES_DIAS_2022.Junho} dias!
    Log To Console     Em JULHO há ${MESES_DIAS_2022.Julho} dias!
    Log To Console     Em AGOSTO há ${MESES_DIAS_2022.Agosto} dias!
    Log To Console     Em SETEMBRO há ${MESES_DIAS_2022.Setembro} dias!
    Log To Console     Em OUTUBRO há ${MESES_DIAS_2022.Outubro} dias!
    Log To Console     Em NOVEMBRO há ${MESES_DIAS_2022.Novembro} dias!
    Log To Console     Em DEZEMBRO há ${MESES_DIAS_2022.Dezembro} dias!