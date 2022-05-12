*** Settings ***
Documentation       thise suite will handle valid credential and testing the password empty box

Resource    ../Resource/CommonFunctionality.resource

Library     DataDriver      file=../test_data/SignoraWare_data.xlsx      sheet_name=valid Credential

Test Setup      Launch Browser
Test Teardown       Close Browser
Test Template   valid Credential Template

*** Test Cases ***

Login_test

*** Keywords ***
valid Credential Template
    Click Element    xpath=//a[text()='Sign In']
    [Arguments]     ${username}     ${password}      ${expected_value}
    Input Text    id=email    ${username}
    Input Text    id=pass     ${password}
    Click Element    id=send2
    Page Should Contain    ${expected_value}