*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary

*** Variables ***
${BASE_URL}    https://mocki.io

*** Test Cases ***
GET_EmployeeInfo
    Create Session    demo    ${BASE_URL}
    ${response}=    GET On Session    demo    /v1/96f446a0-1d48-4ec2-bf1a-91afe5a41156
    ${json_file}=   To Json    ${response.content}      #Using To Json to Convert Response Content to JSON object

    # VALIDATIONS
    ${status_value}=    Get Value From Json    ${json_file}   $.status      #Get Value From Json is used to fetch values from the JSON object using JSONPath expressions.
    Should Be Equal  ${status_value[0]}   success

    # SINGLE DATA Validation in Array
    ${city_name}=    Get Value From Json    ${json_file}   $.city[0]    #["MDU"]
    Should Be Equal  ${city_name[0]}  MDU

    # Multiple DATA Validation in Array
    ${cities_name}=    Get Value From Json    ${json_file}   $.city      #[["MDU","CHN","CMB","HYB","BNG", "MBY"]]
    Log to console  ${cities_name}
    Should Contain any  ${cities_name[0]}  MDU  CHN  CMB  HYB