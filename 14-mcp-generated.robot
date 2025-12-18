*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         https://the-internet.herokuapp.com/login
${BROWSER}     chrome
${USERNAME}    tomsmith
${PASSWORD}    SuperSecretPassword!
${SUCCESS_MESSAGE}    You logged into a secure area!

*** Keywords ***
Login To Application
    [Arguments]    ${username}    ${password}
    Go To    ${URL}
    Input Text    id=username    ${username}
    Input Password    id=password    ${password}
    Click Element    //button[@type="submit"]
    Wait Until Page Contains    ${SUCCESS_MESSAGE}

*** Test Cases ***
Vérifier login réussi
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Login To Application    ${USERNAME}    ${PASSWORD}
    Page Should Contain    ${SUCCESS_MESSAGE}
    [Teardown]    Close Browser