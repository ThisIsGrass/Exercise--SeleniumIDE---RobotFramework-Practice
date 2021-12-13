*** Settings ***
Documentation   A test suite with reusable keywords and variables
...
Library         SeleniumLibrary

*** Variables ***
${SERVER}               www.saucedemo.com
${BROWSER}              chrome
${DELAY}                0
${VALID USER}           standard_user
${LOCKED OUT USER}      locked_out_user
${PROBLEM USER}         problem_user
${VALID PASSWORD}       secret_sauce
${INVALID PASSWORD}     mcflurry
${LOGIN URL}            https://${SERVER}/ 
${HOME URL}             https://${SERVER}/inventory.html
${DROPDOWN}             css=*[data-test="product_sort_container"]
${FIRST ITEM}           css=.inventory_item:first-child .inventory_item_name
${LAST ITEM}            css=.inventory_item:last-child .inventory_item_name
${A TO Z}               az
${Z TO A}               za
${HI TO LO}             hilo
${LO TO HI}             lohi
${FIRST ALPHA}          Sauce Labs Backpack
${LAST ALPHA}           Test.allTheThings() T-Shirt (Red)
${LOW PRICE}            Sauce Labs Onesie
${HIGH PRICE}           Sauce Labs Fleece Jacket
${ERROR IMAGE}          ${LOGIN URL}static/media/sl-404.168b1cce.jpg
${SOURCE ATTRIBUTE}     src
${IMAGE ONE}            css=#item_0_img_link > .inventory_item_img
${IMAGE TWO}            css=#item_1_img_link > .inventory_item_img
${IMAGE THREE}          css=#item_2_img_link > .inventory_item_img
${IMAGE FOUR}           css=#item_3_img_link > .inventory_item_img
${IMAGE FIVE}           css=#item_4_img_link > .inventory_item_img
${IMAGE SIX}            css=#item_5_img_link > .inventory_item_img

*** Keywords ***
Open Browser To Login Page 
    # open browser
    Open browser    ${LOGIN URL}  ${BROWSER}
    # set window size
    Maximize Browser Window
    Set Selenium Speed  ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open    
    # check if in login 
    Page Should Contain Element     login-button   

Product Page Should Be Open    
    Element Text Should Be  class:title     PRODUCTS

Product Page Images Should Be Broken
    Element Attribute Value Should Be   ${IMAGE ONE}    ${SOURCE ATTRIBUTE}     ${ERROR IMAGE}
    Element Attribute Value Should Be   ${IMAGE TWO}    ${SOURCE ATTRIBUTE}     ${ERROR IMAGE}
    Element Attribute Value Should Be   ${IMAGE THREE}  ${SOURCE ATTRIBUTE}     ${ERROR IMAGE}
    Element Attribute Value Should Be   ${IMAGE FOUR}   ${SOURCE ATTRIBUTE}     ${ERROR IMAGE}
    Element Attribute Value Should Be   ${IMAGE FIVE}   ${SOURCE ATTRIBUTE}     ${ERROR IMAGE}
    Element Attribute Value Should Be   ${IMAGE SIX}    ${SOURCE ATTRIBUTE}     ${ERROR IMAGE}

Input Username
    [Arguments]     ${username}
    Input Text  user-name   ${username}

Input Pass
    [Arguments]     ${password}
    Input Password  password   ${password}

Submit Credentials
    Click Button    login-button

Error Message Shown
    [Arguments]     ${error}
    Element Text Should Be  css:*[data-test="error"]    ${error}

Valid Login
    # open browser to login page
    Open Browser To Login Page 
    # input username
    Input Username  ${VALID USER}
    # input password     
    Input Pass  ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # should be open in products page
    Product Page Should Be Open

Locked Out Login
    # open browser to login page
    Open Browser To Login Page 
    # input username
    Input Username  ${LOCKED OUT USER}
    # input password     
    Input Pass  ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # Error message is "Epic sadface: Sorry, this user has been locked out."
    Error Message Shown     Epic sadface: Sorry, this user has been locked out.

Invalid Login
    # open browser to login page
    Open Browser To Login Page 
    # input username
    Input Username  ${VALID USER}
    # input password     
    Input Pass  ${INVALID PASSWORD}
    # click login button
    Submit Credentials
    # Error message is "Epic sadface: Username and password do not match any user in this service"
    Error Message Shown     Epic sadface: Username and password do not match any user in this service