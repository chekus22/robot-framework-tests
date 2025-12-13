*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Ouvrir Google
    Open Browser    https://www.google.com    chrome
    Title Should Be    Google
    Close Browser
