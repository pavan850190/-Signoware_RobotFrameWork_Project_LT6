*** Settings ***
Documentation       thise suite will handle Invalid credential
Resource    ../Resource/CommonFunctionality.resource

Test Setup      Launch Browser
Test Teardown       Close Browser

*** Test Cases ***
Contact Us Test
    Valid Login
    Click Element    xpath=//span[contains(text(),'Home')]
    Click Element    xpath=(//span[contains(text(),'Contact Us')])[1]
    Page Should Contain    Contact Us
    Input Text    id=telephone    123456789
    Input Text    id=comment    the products are good
    Click Element    xpath=(//button[@type='submit'])[2]
    Element Text Should Be    xpath=//div[contains(text(),'Thanks for contacting')]    Thanks for contacting us with your comments and questions. We'll respond to you very soon.