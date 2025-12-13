*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
GET public API
    Create Session    jsonplaceholder    https://jsonplaceholder.typicode.com
    ${resp}=    GET On Session    jsonplaceholder    /posts/1
    Status Should Be    200
    Should Be Equal As Integers    ${resp.json()}[userId]    1