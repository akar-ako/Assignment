*** Settings ***
Library    SeleniumLibrary
Variables    ../Variables.py


*** Keywords ***

Add the ordered product number to the card
    # Add 5 items to cart
    ${NumberOfClicks}=    Evaluate    ${OrderedProductNumber} - ${num2}
    FOR  ${i}  IN RANGE  ${NumberOfClicks}
        Click Element  ${ProductPlusIcon}
        sleep    0.5s
    END

verify if product quantities are equal then click add to card
    # Get the input field value
    ${InputElementQuantity}=    Get Value    ${InputElement}
    #check if product quantity input is equal to ordered number then click add to card
    Run Keyword If    "${InputElementQuantity}" == "${OrderedProductNumber}"    Click Element    ${AddToCartIcon}
    sleep    2s

Open the card and get product values to verify
    # Open Card and Get the product info on home page to verify
    Click Element  ${CartIcon}
    sleep    3s
    ${ProductNameToVerify}    get text    ${ProductNameElementPath}
    ${ProductPriceToVerify}    get text    ${ProductPriceElementPath}
    ${ProductQuantityToVerify}    get text    ${ProductQuantityElementPath}
    ${ProductQuantityToVerify}=    Evaluate    """${ProductQuantityToVerify}"""[:1]
    ${ProductTotalPriceToVerify}    get text   ${ProductTotalPriceElementPath}
#     ${product_values}=    Create List    ${ProductNameToVerify}    ${ProductPriceToVerify}    ${ProductQuantityToVerify}    ${ProductTotalPriceToVerify}
#     [Return]    ${product_values}
    [Return]    ${ProductNameToVerify}    ${ProductPriceToVerify}    ${ProductQuantityToVerify}    ${ProductTotalPriceToVerify}

Proceed to checkout and get the product info on card page to verify
    # Proceed to checkout
    Click Element  ${ProceedToCheckoutButton}
    sleep    3s
    # Get the product info on card page to verify
    ${ProductNameToVerify2}    get text    ${ProductNameElementPath2}
    ${ProductPriceToVerify2}    get text    ${ProductPriceElementPath2}
    ${ProductQuantityToVerify2}    get text   ${ProductQuantityElementPath2}
    ${ProductTotalPriceToVerify2}    get text   ${ProductTotalPriceElementPath2}
     ${product_values2}=    Create List    ${ProductNameToVerify2}    ${ProductPriceToVerify2}    ${ProductQuantityToVerify2}    ${ProductTotalPriceToVerify2}
     [Return]    ${product_values2}

verify if values are equal
    # Check the product values from both side are equal or not
    [Arguments]    ${ProducNameToVerify}    ${ProducNameToVerify2}    ${ProducPriceToVerify}    ${ProducPriceToVerify2}    ${ProducQuantityToVerify}    ${ProducQuantityToVerify2}    ${ProducTotalPriceToVerify}    ${ProducTotalPriceToVerify2}
    Run Keyword If    "${ProducNameToVerify}" == "${ProducNameToVerify2}" and "${ProducPriceToVerify}" == "${ProducPriceToVerify2}" and "${ProducQuantityToVerify}" == "${ProducQuantityToVerify2}" and "${ProducTotalPriceToVerify}" == "${ProducTotalPriceToVerify2}"    call if product values are equal
    ...    ELSE    call if product values are not equal

call if product values are equal
    # Place order
    click button    //*[@id="root"]/div/div/div/div/button
    sleep    1s


call if product values are not equal
    # If product values are not equal the test will fail
    Fail    Test failed: Values are not equal

Select country and agree to terms and finish
    # Select Iraq in country dropdown
    Select From List By Value  ${CountriesDropdown}  ${SelectedCountry}
    sleep    1s
    # Agree to terms and finish
    Click Element  ${TermsCheckBox}
    sleep    1s

    Click Element  ${ProceedButton}
    sleep    2s