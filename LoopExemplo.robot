*** Settings ***
Documentation    Estudo de utilização de Loops usando o Robot Framework

*** Variables ***
@{LISTA_DE_NUMEROS}    1    2    3    4    5    6    7    8    9    10

*** Test Cases ***
Teste de imprimir apenas alguns números (exemplo 1)
  Imprimir somente se for 5 e 10 (exemplo 1)

Teste de imprimir apenas alguns números (exemplo 2)
  Imprimir somente se for 5 e 10 (exemplo 2)

Teste de imprimir apenas alguns números (exemplo 3)
  Imprimir somente se for 5 e 10 (exemplo 3)

*** Keywords ***
Imprimir somente se for 5 e 10 (exemplo 1)
  Log To Console  ${\n}

  FOR    ${NUMERO}    IN   @{LISTA_DE_NUMEROS}
      IF  ${NUMERO} == 5
          Log To Console    Eu sou o número 5!
      ELSE IF  ${NUMERO} == 10
          Log To Console    Eu sou o número 10!
      ELSE
          Log To Console    Eu não sou o número 5 e nem o 10!
      END
  END

Imprimir somente se for 5 e 10 (exemplo 2)
  Log To Console  ${\n}

    FOR    ${NUMERO}    IN    @{LISTA_DE_NUMEROS}
      IF  ${NUMERO} == 5 or ${NUMERO} == 10
          Log To Console    Eu sou o número ${NUMERO}!
      ELSE
          Log To Console    Eu não sou o número 5 e nem o 10!
      END
  END

Imprimir somente se for 5 e 10 (exemplo 3)
  Log To Console  ${\n}
  FOR    ${NUMERO}    IN   @{LISTA_DE_NUMEROS}
      IF  ${NUMERO} in (5, 10)
          Log To Console    Eu sou o número ${NUMERO}!
      ELSE
          Log To Console    Eu não sou o número 5 e nem o 10!
      END              
  END