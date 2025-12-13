*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE}    https://api.github.com

*** Test Cases ***
Sans token → 401 sur endpoint privé
    [Documentation]    Vérifie qu'un endpoint privé sans authentification retourne 401
    Create Session    gh    ${BASE}    verify=false
    ${resp} =    GET On Session    gh    /user    expected_status=401
    Status Should Be    401
    Log    Endpoint privé sans token: ${resp.status_code}

Sans header → 200 sur endpoint public
    [Documentation]    Vérifie qu'un endpoint public sans authentification retourne 200
    Create Session    gh_public    ${BASE}    verify=false
    ${resp} =    GET On Session    gh_public    /repos/octocat/Hello-World
    Status Should Be    200
    Log    Endpoint public sans token: ${resp.status_code}
    Log    Repository name: ${resp.json()}[name]

Avec token invalide → 401
    [Documentation]    Vérifie qu'un token invalide est rejeté
    &{headers} =    Create Dictionary    Authorization=Bearer invalid_token_12345
    Create Session    gh_invalid    ${BASE}    headers=${headers}    verify=false
    ${resp} =    GET On Session    gh_invalid    /user    expected_status=401
    Status Should Be    401
    Log    Token invalide correctement rejeté: ${resp.status_code}

Vérifier données publiques du repo
    [Documentation]    Récupère et vérifie les données d'un repo public
    Create Session    gh_data    ${BASE}    verify=false
    ${resp} =    GET On Session    gh_data    /repos/octocat/Hello-World
    Status Should Be    200
    
    # Vérifications sur les données
    Should Be Equal As Strings    ${resp.json()}[name]    Hello-World
    Should Be Equal As Strings    ${resp.json()}[owner][login]    octocat
    Should Be True    ${resp.json()}[id] > 0
    Log    Stars: ${resp.json()}[stargazers_count]
    Log    Forks: ${resp.json()}[forks_count]

