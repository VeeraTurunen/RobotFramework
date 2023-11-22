*** Settings ***
Documentation       Test cases for Novita 
Library             SeleniumLibrary
#Test Teardown       Close Browser
Resource            variables.robot
Resource            keywords.robot


*** Test Cases ***
Open Novita page 1
   Open Url With Chrome            ${NOVITA_URL}    
   #Pitka sleep etta kaikki pop-upit ilmestyy, wait element odottaa vain 5 sec. 
   Sleep    15s
   #Click Allow All Cookies And Select Currency; EI LUULTAVASTI TARVITSE KAIKILLE KAYTTAJILLE    
   Click Button   XPath:/html/body/dialog[2]/div/div/button
   Click Button   XPath:/html/body/div[1]/div/div[4]/div[1]/div[2]/button[4]

Robinin testi
   #paina mitä etsit
   Click Button   XPath:/html/body/header/div/button[2]
   #kirjoita "villasukat"
   Input Text    xpath=//*[@id="predictive-search-field"]     Villasukat
   #paina entteriä jotta haku alkaa
   Press Keys	xpath=//*[@id="predictive-search-field"]	RETURN
   #katsele 2s
   Sleep    2s
   #paina ohjeita
   Click Button   XPath:/html/body/main/div/div/div/div/div[1]/button[2]
   #katsele 2s
   Sleep    2s
   #Valitse ensimmäinen ohje
   Click Element   XPath:/html/body/main/div/div/div/div/div[3]/div/div/div[2]/div[2]
   #Ei voida tulostaa ohjetta koska ei olla tilaajia
Tulosta ohje
   Sleep    3s
   #Valitse ensimmäinen ohje
   Click Button   XPath:/html/body/main/section[1]/div[2]/div[6]/div/div[2]/div[2]/div[2]/button
   Sleep    3s

Open Novita page 2
   Open Url With Chrome            ${NOVITA_URL}    
   #Pitka sleep etta kaikki pop-upit ilmestyy, wait element odottaa vain 5 sec. 
   Sleep    15s
   #Click Allow All Cookies And Select Currency; EI LUULTAVASTI TARVITSE KAIKILLE KAYTTAJILLE    
   Click Button   XPath:/html/body/dialog[2]/div/div/button
   Click Button   XPath:/html/body/div[1]/div/div[4]/div[1]/div[2]/button[4]

Tyttojen testi
   Choose Instructions
   Read Yarn and Needles
   Choose Yarn
   Click Product To Shopping Basket
   Choose Other Yarn
   Look For An Item Searchbox
   Check Basket And Remove Item
   Look For Different Needles
   Go To Checkout And Input Info





   
  