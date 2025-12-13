*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Login réussi sur site démo
    Open Browser    https://the-internet.herokuapp.com/login    chrome
    Input Text    id=username    tomsmith
    Input Text    id=password    SuperSecretPassword!
    Click Button    //button[@type="submit"]
    Wait Until Page Contains    You logged into a secure area!
    Page Should Contain    You logged into a secure area!
    Close Browser