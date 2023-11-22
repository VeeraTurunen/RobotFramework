*** Settings ***
Documentation       Test cases for Novita 
Library             SeleniumLibrary
#Test Teardown       Close Browser
Resource            variables.robot
Resource            keywords.robot


*** Test Cases ***
Open Novita page
   Open Url With Chrome            ${NOVITA_URL}    
   #Pitka sleep etta kaikki pop-upit ilmestyy, wait element odottaa vain 5 sec. 
   Sleep    10s
   #Click Allow All Cookies And Select Currency; EI LUULTAVASTI TARVITSE KAIKILLE KAYTTAJILLE  
   Click Button   XPath:/html/body/div[1]/div/div[4]/div[1]/div[2]/button[4]
   Click Button   XPath:/html/body/dialog[2]/div/div/button

   Choose Instructions
   Read Yarn and Needles
   Choose Yarn
   Click Product To Shopping Basket
   Choose Other Yarn
   Look For An Item Searchbox
   Check Basket And Remove Item
   Look For Different Needles
   Go To Checkout And Input Info





   
  