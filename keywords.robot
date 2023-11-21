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