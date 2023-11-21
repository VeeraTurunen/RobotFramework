*** Settings ***
Documentation       Test cases for Novita 
Library             SeleniumLibrary
#Test Teardown       Close Browser
Resource            variables.robot
Resource            keywords.robot


*** Test Cases ***
Open Novita page
   Open Url With Chrome            ${NOVITA_URL}    
   Choose Instructions
   Read Yarn and Needles
   Choose Yarn
   Click Product To Shopping Basket
   Choose Other Yarn