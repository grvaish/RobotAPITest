*** Settings ***
Library   XML
Library   os
Library   Collections      #Whenever working with list or dictionary
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://mocktarget.apigee.net

*** Test Cases ***
xml_File_Testing
    Create Session    demo    ${BASE_URL}
    ${response}=    GET On Session    demo  /xml
    ${xml_string}=  convert to string   ${response.content}
    ${xml_obj}=   parse xml  ${xml_string}

    #Validations

    #V1 - Single value validation
    element text should be   ${xml_obj}    San Jose   .//city

    #V2 - Check Values of Child Elements
    ${child_elements}=    GET Child elements    ${xml_obj}
    Should Not Be Empty  ${child_elements}

    ${city}=  get element text    ${child_elements[0]}
    ${firstName}=  get element text    ${child_elements[1]}
    ${lastName}=  get element text    ${child_elements[2]}
    ${state}=  get element text    ${child_elements[3]}

    Should Be Equal     ${city}     San Jose
    Should Be Equal     ${firstName}    John
    Should Be Equal     ${lastName}     Doe
    Should Be Equal     ${state}    CA
