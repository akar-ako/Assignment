*** Settings ***
Library    SeleniumLibrary
Variables    ../Variables.py

*** Keywords ***

Start TestCase
    Open Browser  ${URL}  Chrome
    Maximize Browser Window
    sleep    2s
Finish TestCase
    close browser
