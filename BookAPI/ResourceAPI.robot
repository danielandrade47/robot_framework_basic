*** Settings ***
Documentation     Documentação da API de Testes: https://fakerestapi.azurewebsites.net/index.html
Library    RequestsLibrary
Library    Collections

*** Variables ***
${URL_API}    https://fakerestapi.azurewebsites.net/api/v1/

*** Keywords ***
Conectar a minha API
    Create Session    fakeAPI    ${URL_API}

### Actions
Requisitar todos os livros
    ${RESPOSTA}    Get Request    fakeAPI    Books
    Log    ${RESPOSTA.text}