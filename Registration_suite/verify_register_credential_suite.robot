*** Settings ***
Documentation       thise suite will handle registraion  details
Resource    ../Resource/CommonFunctionality.resource

Test Setup      Launch Browser
Test Teardown   Close Browser

*** Variables ***
${text}     This is a required field.
*** Test Cases ***
Reg_test
    Click Element    xpath=//a[text()='Create an Account']
    Page Should Contain    Personal Information
    Input Text    id=firstname   Pavan
    Input Text    id=email_address   pavan@gmail.com
    Input Text    id=lastname   raj
    Input Text    id=password   12345678@a
    Input Text    id=password-confirmation   12345678@a
    Click Element    xpath=(//button[@type='submit'])[2]

Pass_Strengthweek_test
    Click Element    xpath=//a[text()='Create an Account']
    Input Text    id=password   12345678
    Element Text Should Be    xpath=//span[text()='Weak']    Weak
    Sleep    5s
    Input Text    id=password   123456@asd
    Element Text Should Be    xpath=//span[text()='Medium']    Medium
    Sleep    5s
    Input Text    id=password   123456@asdfg
    Element Text Should Be    xpath=//span[text()='Strong']     Strong
    Sleep    5s
    Input Text    id=password   78781212963$Aa
    Element Text Should Be    xpath=//span[text()='Very Strong']     Very Strong

Pass_Matching_test
    Click Element    xpath=//a[text()='Create an Account']
    Input Text    id=password   78781212963$Aa
    Input Text    id=password-confirmation   12345678@a
    Click Element    xpath=(//button[@type='submit'])[2]
    Element Text Should Be    id=password-confirmation-error    expected=Please enter the same value again.

Emptydetails_validation_test
    Click Element    xpath=//a[text()='Create an Account']
    Click Element    xpath=(//button[@type='submit'])[2]
    Element Text Should Be    id=firstname-error    ${text}
    Element Text Should Be    id=email_address-error    ${text}
    Element Text Should Be    id=lastname-error    ${text}
    Element Text Should Be    id=password-error    ${text}
    Element Text Should Be    id=password-confirmation-error    ${text}


