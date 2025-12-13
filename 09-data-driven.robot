*** Settings ***
Library    SeleniumLibrary
Test Template    Tester le Login
Suite Setup    Open Browser    ${URL}    chrome
Suite Teardown    Close Browser
*** Variables ***
${URL}    https://the-internet.herokuapp.com/login
 
*** Test Cases ***   USERNAME  PASSWORD   RESULTAT ATTENDU
Login OK                    tomsmith      SuperSecretPassword!   You logged into a secure area!
Login mauvais password      tomsmith      mauvais                Your password is invalid!
Login user vide             ${EMPTY}      SuperSecretPassword!   Your username is invalid!
Login password vide         tomsmith      ${EMPTY}               Your password is invalid

*** Keywords ***
Tester le login
    Go To    ${URL}
    [Arguments]    ${username}    ${password}    ${message} 
    Input Text      id=username    ${username}
    Input Password  id=password    ${password}
    Click Element   //button[@type="submit"]
    Wait Until Page Contains    ${message}                
