*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                 https://www.amazon.com.br/
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}  //h1[contains(.,'Eletrônicos e Tecnologia')]
${RESULT_PESQUISA}     //span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'Console PlayStation 5')]

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//a[@aria-label='${NOME_CATEGORIA}']

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto "${RESULT_PESQUISA}"
    Wait Until Element Is Visible    locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${RESULT_PESQUISA}')]

Adicionar o produto "Playstation 5" no carrinho
    Click Element    locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'PlayStation®5 + Horizon Forbidden West')]
    Wait Until Element Is Visible    locator=//input[contains(@name,'submit.add-to-cart')]
    Click Element    locator=//input[contains(@name,'submit.add-to-cart')]

Verificar se o produto "Playstation 5" foi adicionado com sucesso
    Wait Until Element Is Visible    locator=//span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]

Remover o produto "Playstation 5" do carrinho
    Wait Until Element Is Visible    locator=//span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]
    Click Element    locator=//a[@class='a-button-text']
    Wait Until Element Is Visible    locator=(//input[contains(@value,'Excluir')])[1]
    Click Element    locator=(//input[contains(@value,'Excluir')])[1]

Verificar se o carrinho fica vazio
    Wait Until Page Contains    text=Seu carrinho de compras da Amazon está vazio.


# GHERKIN STEPS
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a frase "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

Quando pesquisar pelo produto "Playstation 5"
    Digitar o nome de produto "Playstation 5" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Playstation 5"
    Verificar se o título da página fica "Amazon.com.br : Playstation 5"
    
E um produto da linha "Playstation 5" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "Console PlayStation 5"

Quando adicionar o produto "Playstation 5"
    Digitar o nome de produto "Playstation 5" no campo de pesquisa
    Clicar no botão de pesquisa
    Adicionar o produto "Playstation 5" no carrinho

Então o produto "Playstation 5" deve ser adicionado ao carrinho
    Verificar se o produto "Playstation 5" foi adicionado com sucesso

E existe o protudo "Playstation 5" no carrinho
    Quando adicionar o produto "Playstation 5"

Quando remover o produto "Playstation 5" do carrinho
    Remover o produto "Playstation 5" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio