*** Settings ***
Documentation       thise suite will handle Invalid credential
Resource    ../Resource/CommonFunctionality.resource

Test Setup      Launch Browser
Test Teardown       Close Browser
Test Template   Invalid Credential Template

*** Test Cases ***
Tc1     john@gmail.com    123456
Tc2     peter@mail.com   124568

*** Keywords ***
Invalid Credential Template
    Click Element    xpath=//a[text()='Sign In']
    [Arguments]     ${username}     ${password}
    Input Text    id=email    ${username}
    Input Text    id=pass     ${password}
    Click Element    id=send2
    Element Should Contain    xpath=//div[contains(text(),'sign-in was incorrect')]    The account sign-in was incorrect or your account is disabled temporarily. Please wait and try again later.