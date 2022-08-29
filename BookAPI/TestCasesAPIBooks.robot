*** Settings ***
Documentation     Documentação da API de Testes: https://fakerestapi.azurewebsites.net/index.html
Resource     ResourceAPI.robot
Suite Setup    Conectar a minha API

*** Test Cases ***
Buscar a listagem de todos os livros (GET em todos os Livros)
    Requisitar todos os livros