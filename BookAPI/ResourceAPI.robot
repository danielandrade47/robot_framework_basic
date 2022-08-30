*** Settings ***
Documentation     Documentação da API de Testes: https://fakerestapi.azurewebsites.net/index.html
Library    RequestsLibrary
Library    Collections

*** Variables ***
${URL_API}    https://fakerestapi.azurewebsites.net/api/v1/
&{BOOK_15}    id=15
...           title=Book 15
...           description=Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n
...           pageCount=1500
...           excerpt=Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n

*** Keywords ***
Conectar a minha API
    Create Session    fakeAPI    ${URL_API}

### Actions
Requisitar todos os livros
    ${RESPOSTA}    Get Request    fakeAPI    Books
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Requisitar o livro "${ID_LIVRO}"
    ${RESPOSTA}    Get Request    fakeAPI    Books/${ID_LIVRO}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

#### Conferências
Conferir o Status Code
    [Arguments]    ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUSCODE_DESEJADO}

Conferir o reason
    [Arguments]    ${REASON_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.reason}    ${REASON_DESEJADO}

Conferir se retorna uma lista com "${QTD_LIVROS}" livros
    Length Should Be    ${RESPOSTA.json()}    200

Conferir se retorna todos os dados do livro 15
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id             ${BOOK_15.id}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title          ${BOOK_15.title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    description    ${BOOK_15.description}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    pageCount      ${BOOK_15.pageCount}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    excerpt        ${BOOK_15.excerpt}
    Should Not Be Empty    ${RESPOSTA.json()["publishDate"]}