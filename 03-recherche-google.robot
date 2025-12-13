*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Rechercher Robot Framework sur Google
    Open Browser    https://www.google.com    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    //button[contains(.,'Tout accepter')]    10s
    Click Element    //button[contains(.,'Tout accepter')]
    Input Text    //textarea[@name='q']    Robot Framework
    Press Keys    //textarea[@name='q']    ENTER
    Wait Until Page Contains    Robot Framework    20s
    Close Browser