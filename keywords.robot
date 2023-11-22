*** Settings ***
Library    SeleniumLibrary
*** Keywords ***
Open Url
    [Arguments]     ${browser}    ${url}
    Create Webdriver        ${browser}
    Maximize Browser Window
    Go To                   ${url}
Open Url With Chrome
    [Arguments]     ${url}
    Open Url        Chrome    ${url}

Choose Instructions
    [Documentation]   Etsitään valikosta Villasukkaohje
    Click Button    xpath=/html/body/header/div/nav/ul/li[2]/button
    Get Text     xpath=/html/body/header/div/nav/ul/li[2]/div[1]/div/div[1]/div[3]/ul/li[1]/a
    Click Link    xpath=/html/body/header/div/nav/ul/li[2]/div[1]/div/div[1]/div[3]/ul/li[1]/a
    # ohje sukille, ei toimi ilman sleepiä pakosti
    sleep    3s
    Wait Until element is visible    xpath=/html/body/main/div/div/div/div[2]/div[7]/a
    Click Link    xpath=/html/body/main/div/div/div/div[2]/div[7]/a

Read Yarn and Needles
    [Documentation]   Luetaan lankamenekki ja puikkotiedot
    # luetaan lankamenekki
    Wait Until Element is visible    xpath=/html/body/main/section[1]/div[2]/div[3]/p[2]
    Get Text     xpath=/html/body/main/section[1]/div[2]/div[3]/p[2]

    # luetaan puikkotiedot
    Wait Until Element is visible    xpath=/html/body/main/section[1]/div[2]/div[4]/p[2]
    Get Text     xpath=/html/body/main/section[1]/div[2]/div[4]/p[2]

Choose Yarn
    [Documentation]   Valitaan lanka kliksuttelemalla (jos en väärin muista)
    #Wait Until Element Is Visible    xpath=/html/body/main/section[1]/div[2]/div[6]/div/div[1]/div[2]
    Click Button     xpath=/html/body/header/div/nav/ul/li[1]/button
    # 7-veljestä painike
    Wait Until Element is Visible    xpath=/html/body/header/div/nav/ul/li[1]/div[1]/div/div[1]/div[2]/ul/li[1]/a
    Click Link     xpath=/html/body/header/div/nav/ul/li[1]/div[1]/div/div[1]/div[2]/ul/li[1]/a
    
Click Product To Shopping Basket
    [Documentation]   Valitaan vaalea lanka ja lisätään se ostoskoriin
    # langan valinta
    sleep    3s
    Wait Until Element Is Visible     xpath=/html/body/main/div/div/div/div[2]/article[1]/div[2]
    #valkoisen langan klikkaus, toimii välillä ilman sleepiä
    Click Element     xpath=/html/body/main/div/div/div/div[2]/article[1]/div[2]
    sleep    3s
    # Lisää tuote ostoskoriin
    Click Button    xpath=/html/body/main/section[1]/div[2]/div[4]/div[2]/form/button
    Wait Until Element Is Visible     xpath=//*[@id="minicart-close-button"]
    Click Button    xpath=//*[@id="minicart-close-button"]

Choose Other Yarn
    [Documentation]   Valitaan vaalea lanka ja hakukentän kautta
    Click Button     xpath=/html/body/header/div/button[2]
    Input Text    xpath=//*[@id="predictive-search-field"]     7 veljestä
    Press Keys    xpath=//*[@id="predictive-search-field"]      RETURN
    # jatkuu tästä lisäämällä uusi tuote ostoskoriin tms

Look For An Item Searchbox
    #Etsi puikot
    Click Button   XPath:/html/body/header/div/button[2]
    Input Text    XPath://*[@id="predictive-search-field"]   Novita sukkapuikot 20 cm 10.0 mm
    Press Keys    None      ENTER
    # Lisaa tuote ostoskoriin (Ei joskus toimi ilman sleep)
    #Sleep    2s
    Wait Until Element is visible    XPath:/html/body/main/div/div/div/div/div[2]/div/div/div[2]/article[1]/div[3]/a/h2
    Click Element    XPath:/html/body/main/div/div/div/div/div[2]/div/div/div[2]/article[1]/div[3]/a/h2
    Wait Until Element is visible    XPath:/html/body/main/section[1]/div[2]/div[3]/div[2]/form/button
    Click Button    XPath:/html/body/main/section[1]/div[2]/div[3]/div[2]/form/button
Check Basket And Remove Item
    #Poista juuri lisatty tuote
    Click Element    XPath:/html/body/header/div/div/div/button
    Wait Until Element is visible    XPath:/html/body/dialog[1]/div[2]/a
    Click Element    XPath:/html/body/dialog[1]/div[2]/a  
    Wait Until Element is visible    XPath:/html/body/main/section/div/div[1]/div/div/div[2]/div[2]/form/button
    Click Element    XPath:/html/body/main/section/div/div[1]/div/div/div[2]/div[2]/form/button
Look For Different Needles
    #Hae toiset puikot ylapalkista ja
    Mouse Over    XPath:/html/body/header/div/nav/ul/li[1]/button
    Sleep    2s
    Wait Until Element Is Visible    XPath:/html/body/header/div/nav/ul/li[1]/div[1]/div/div[1]/div[1]/ul/li[2]/a
    Click Element    XPath:/html/body/header/div/nav/ul/li[1]/div[1]/div/div[1]/div[1]/ul/li[2]/a
    Wait Until Element Is Visible    XPath:/html/body/main/div/div/div/div[2]/article[4]/div[3]/a
    Click Element    XPath:/html/body/main/div/div/div/div[2]/article[4]/div[3]/a
    Wait Until Element Is Visible    XPath:/html/body/main/div/div/div/div[2]/article[4]/div[3]/a
    Sleep    3s
    Click Button    XPath:/html/body/main/section[1]/div[2]/div[3]/div[2]/form/button

Go To Checkout And Input Info
    #Ostoskoriin ja kassalle
    Wait Until Element Is Visible    XPath:/html/body/dialog[1]/div[2]/a
    Click Element    XPath:/html/body/dialog[1]/div[2]/a
    Wait Until Element Is Visible    XPath:/html/body/main/section/div/div[2]/form/button
    Click Button    XPath:/html/body/main/section/div/div[2]/form/button
    #Kirjoita email
    Wait Until Element Is Visible    XPath://*[@id="email"]
    Input Text    XPath://*[@id="email"]    uli uu
    Sleep    2s
    