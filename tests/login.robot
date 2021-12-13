*** Settings ***
Documentation   A test suite with tests for login
...
Resource        resources.robot

*** Test Cases ***
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
    # close browser                    
    [Teardown]  Close Browser

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
    # close browser                    
    [Teardown]  Close Browser

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
    # close browser                    
    [Teardown]  Close Browser    

Problem Login
    # open browser to login page
    Open Browser To Login Page 
    # input username
    Input Username  ${PROBLEM USER}
    # input password     
    Input Pass  ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # should be open in products page
    Product Page Should Be Open
    # error in all images
    Product Page Images Should Be Broken
    # close browser                    
    [Teardown]  Close Browser    