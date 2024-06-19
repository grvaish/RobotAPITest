*** Settings ***
Library    RequestsLibrary
Library    Collections      #Whenever working with list or dictionary

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Using_Post_Request
    #{
         #  "userId": 1,
         #  "id": 1,
         #  "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
         #  "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
         #}
    #POST - Generally used to create a new resource on the server.
    Create Session    demo    ${BASE_URL}
    ${body}=    create dictionary   userId=1    id=1    title=Introduction to AI   body=Learn AI basics  link=https://example.com/article1   comment_count=8
    ${header}=  create dictionary   Content-Type=application/json; charset=utf-8
    ${response}=    POST On Session    demo    /posts    json=${body}    headers=${header}

    log to console  ${response.status_code}
    log to console  ${response.content}
    #log to console  ${response.header}

    ${string_code}=  convert to string   ${response.status_code}
    should be equal  ${string_code}     201

    ${res_body}=  convert to string   ${response.content}
    should contain  ${res_body}     title
    should contain  ${res_body}     body




