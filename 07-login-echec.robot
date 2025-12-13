*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Login en echec
    Open Browser    https://the-internet.herokuapp.com/login    chrome
    Input Text    id=username    tomsmith
    Input Text    id=password    mauvais
    Click Button    //button[@type="submit"]
    Wait Until Page Contains    Your password is invalid!
    Page Should Contain    Your password is invalid!
    Close Browser   