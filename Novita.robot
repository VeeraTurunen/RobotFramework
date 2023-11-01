*** Settings ***
Documentation       Test cases for Novita 
Library             SeleniumLibrary
#Test Teardown       Close Browser
Resource            variables.robot
Resource            keywords.robot


*** Test Cases ***
Open Novita page
   Open Url With Chrome            ${NOVITA_URL}    

   #copy&paste-testi palikkatyyliin
   Click Button   XPath:/html/body/dialog[2]/div/div/button
   ${spacename}=   Get Text    XPath:/html/body/main/section[2]/div/div/header/h2
   Click Button   XPath:/html/body/header/div/button[2]
   Input Text    XPath://*[@id="predictive-search-field"]    ${spacename}
   Sleep   10s 

   