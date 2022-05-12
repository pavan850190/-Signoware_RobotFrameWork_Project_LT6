*** Settings ***
Documentation       thise suite will handle Invalid credential
Resource    ../Resource/CommonFunctionality.resource

Test Setup      Launch Browser
Test Teardown       Close Browser

*** Test Cases ***
Product purchase test
    Valid Login
    Click Element    xpath=//span[contains(text(),'Home')]
    Click Element    xpath=//a[@title='Stainless Steel Shaker']
    Click Element    xpath=//img[@src='https://signoraware.com/media/catalog/product/cache/22f737010c882ae9dc73726ff0a183f9/3/4/3490_1.jpg']
    Click Element    xpath=//button[@id='product-addtocart-button']
    cli