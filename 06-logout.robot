*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Logout reussi sur le site demo
    Open Browser    https://the-internet.herokuapp.com/login    chrome
    Input Text    id=username    tomsmith
    Input Text    id=password    SuperSecretPassword!
    Click Element    //button[@type="submit"]
    Wait Until Page Contains    You logged into a secure area!
    Page Should Contain    You logged into a secure area!
    Click Element   //a[@href="/logout"]
    Wait Until Page Contains    You logged out of the secure area!
    Page Should Contain    You logged out of the secure area!
    Close Browser