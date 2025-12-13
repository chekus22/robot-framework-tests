*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE}    https://jsonplaceholder.typicode.com

*** Test Cases ***
POST crée un post
    Create Session     api    ${BASE}
    &{data}=    Create Dictionary    title=Mon super titre    body=COntenu top    userId=42
    ${resp}=    POST On Session    api    /posts    json=${data}
    Status Should Be    201
    Should Be Equal As Strings    ${resp.json()}[title]    Mon super titre

UT modifie le post 1
    Create Session    api    ${BASE}
    &{data} =    Create Dictionary    title=Titre modifié    body=Nouveau contenu    userId=99
    ${resp} =    PUT On Session    api    /posts/1    json=${data}
    Status Should Be    200
    Should Be Equal As Strings    ${resp.json()}[title]    Titre modifié
    Should Be Equal As Integers    ${resp.json()}[userId]    99