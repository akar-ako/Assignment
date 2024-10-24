*** Settings ***
Library  SeleniumLibrary
Resource    ./Resources/CommonFunctionality.robot
Resource    ./Resources/DefinedKeywords.robot
Variables    ./Variables.py

Test Setup    Start TestCase
Test Teardown    Finish TestCase

*** Test Cases ***
Automate Purchase Product

    # Add 5 items items to cart
    DefinedKeywords.Add the ordered product number to the card

    # Proceed to cart
    DefinedKeywords.verify if product quantities are equal then click add to card

    # Open Card and Get the product info on home page to verify
    ${product_values}=    DefinedKeywords.Open the card and get product values to verify
    ${ProductNameToVerify}=  set variable    ${product_values}[0]
    ${ProductPriceToVerify}=  set variable    ${product_values}[1]
    ${ProductQuantityToVerify}=  set variable    ${product_values}[2]
    ${ProductTotalPriceToVerify}=  set variable    ${product_values}[3]

    # Proceed to checkout and get the product info on card page to verify
    ${product_values2}=    DefinedKeywords.Proceed to checkout and get the product info on card page to verify
    ${ProductNameToVerify2}=  set variable    ${product_values2}[0]
    ${ProductPriceToVerify2}=  set variable    ${product_values2}[1]
    ${ProductQuantityToVerify2}=  set variable    ${product_values2}[2]
    ${ProductTotalPriceToVerify2}=  set variable    ${product_values2}[3]

    # Check the product values from both side are equal or not
    DefinedKeywords.verify if values are equal    ${ProductNameToVerify}    ${ProductNameToVerify2}    ${ProductPriceToVerify}    ${ProductPriceToVerify2}    ${ProductQuantityToVerify}    ${ProductQuantityToVerify2}    ${ProductTotalPriceToVerify}    ${ProductTotalPriceToVerify2}

    # Select Country from the dropdown menu and check term checkbox and then finish
    DefinedKeywords.Select country and agree to terms and finish

