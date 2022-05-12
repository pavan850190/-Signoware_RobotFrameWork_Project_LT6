*** Settings ***
Documentation       thise file will keep the configuration details

Library     SeleniumLibrary
Library     OperatingSystem
Library    Collections
*** Variables ***
${BROWSER}      chrome
${URL}      https://signoraware.com/

*** Keywords ***
Launch Browser
    Append To Environment Variable    Path    ${EXECDIR}${/}driver
    Open Browser    browser=${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Set Screenshot Directory    ${EXECDIR}${/}screanshots
    Go To    url=${URL}

Valid Login
    Click Element    xpath=//a[text()='Sign In']
    Input Text    id=email    masil22830@abincol.com
    Input Text    id=pass     147852369@Aa
    Click Element    id=send2
