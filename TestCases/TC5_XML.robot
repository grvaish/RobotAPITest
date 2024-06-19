*** Settings ***
Library   XML
Library   os
Library   Collections      #Whenever working with list or dictionary

*** Test Cases ***
xml_File_Testing
    ${xml_obj}=   parse xml  F:/SeleniumPractice/xmldata/employees.xml

    #Validations

    #V1 - Single value validation
    #Approach 1
    ${name_value}=    GET element text    ${xml_obj}    .//videoGame[1]/name
    Should Be Equal  ${name_value}   Unicorn
    #Approach 2
    ${name_value}=    GET element    ${xml_obj}    .//videoGame[1]/name
    Should Be Equal  ${name_value.text}   Unicorn
    #Approach 3
    element textshould be   ${xml_obj}    Unicorn   .//videoGame[1]/name

    #V2 - Check Number of Nodes(elements)
    ${count}=    GET element count   ${xml_obj}    .//videoGame
    Should Be Equal As Integers  ${count}   4           #integer != string

    #V3 - Check attribute presence
    Element Attribute Should Be  ${xml_obj}  id  4  .//videoGame[4]

    #V3 - Check Values of Child Elements
    ${child_elements}=    GET Child elements    ${xml_obj}    .//videoGame[1]
    Should Not Be Empty  ${child_elements}

    ${name}=  get element text    ${child_elements[0]}
    ${releaseDate}=  get element text    ${child_elements[1]}
    ${reviewScore}=  get element text    ${child_elements[2]}

    Log To Console  ${name}
    Log To Console  ${releaseDate}
    Log To Console  ${reviewScore}

    Should Be Equal     ${name}     Unicorn
    Should Be Equal     ${releaseDate}  2005-10-01
    Should Be Equal     ${reviewScore}     85