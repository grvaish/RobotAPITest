*** Settings ***
Library   JSONLibrary
Library    os
Library    Collections      #Whenever working with list or dictionary

*** Variables ***
${BASE_URL}    http://localhost:8080

*** Test Cases ***
JSON_File_Testing
    ${json_file}=   load json from file  F:/SeleniumPractice/jsondata/jsondata.json
    ${name_value}=    GET value from json    ${json_file}   $.firstName
    Should Be Equal  ${name_value[0]}   John

    ${street_value}=    GET value from json    ${json_file}   $.address.streetAddress
    Should Be Equal  ${street_value[0]}   naist street

    ${faxnum_value}=    GET value from json    ${json_file}   $.phoneNumbers[1].number
    Should Be Equal  ${faxnum_value[0]}   0123-4567-8910

