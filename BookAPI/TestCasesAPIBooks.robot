*** Settings ***
Documentation     Documentação da API de Testes: https://fakerestapi.azurewebsites.net/index.html
Resource     ResourceAPI.robot
Suite Setup    Conectar a minha API

*** Test Cases ***
Buscar a listagem de todos os livros (GET em todos os Livros)
    Requisitar todos os livros
    Conferir o Status Code    200
    Conferir o reason    OK
    Conferir se retorna uma lista com "200" livros

Buscar um livro específico (GET em um Livro específico por ID)
    Requisitar o livro "15"
    Conferir o Status Code    200
    Conferir o reason    OK
    Conferir se retorna todos os dados do livro 15