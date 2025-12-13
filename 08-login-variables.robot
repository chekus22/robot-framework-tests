*** Variables ***
${URL}    https://the-internet.herokuapp.com/login
${USER}     tomsmith
${PASS}    SuperSecretPassword!



*** Settings ***
Library    SeleniumLibrary    

*** Test Cases ***
Login avec variables
    Open Browser    ${URL}    chrome
    Input Text    id=username    ${USER}
    Input Password    id=password    ${PASS}
    Click Button    //button[@type="submit"]
    Wait Until Page Contains    You logged into a secure area!
    Page Should Contain    You logged into a secure area!
    Close Browser