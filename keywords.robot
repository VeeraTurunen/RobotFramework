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
