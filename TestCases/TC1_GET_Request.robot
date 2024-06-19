*** Settings ***
Library    RequestsLibrary
Library    Collections      #Whenever working with list or dictionary

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Using_Get_Request
    Create Session    demo    ${BASE_URL}
    ${response}=    GET On Session    demo    /posts/1

    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}

    #VALIDATIONS
    ${string_code}=  convert to string   ${response.status_code}
    should be equal  ${string_code}     200

    ${body}=  convert to string   ${response.content}
    should contain  ${body}     1

    ${keyValue}=    get from dictionary  ${response.headers}    Content-Type
    should be equal  ${keyValue}     application/json; charset=utf-8

