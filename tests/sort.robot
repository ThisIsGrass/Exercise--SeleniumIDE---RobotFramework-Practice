*** Settings ***
Documentation   A test suite with tests for sort
...
Resource        resources.robot

*** Test Cases ***
Sort Product Name (A to Z)
    Valid Login
    Select From List By Value   ${DROPDOWN}     ${A TO Z}
    Element Text Should Be      ${FIRST ITEM}   ${FIRST ALPHA}
    Element Text Should Be      ${LAST ITEM}    ${LAST ALPHA}
    [Teardown]  Close Browser

Sort Product Name (Z to A)
    Valid Login
    Select From List By Value   ${DROPDOWN}     ${Z TO A}
    Element Text Should Be      ${FIRST ITEM}   ${LAST ALPHA}
    Element Text Should Be      ${LAST ITEM}    ${FIRST ALPHA}
    [Teardown]  Close Browser

Sort Product Name (Hi to Lo)
    Valid Login
    Select From List By Value   ${DROPDOWN}     ${LO TO HI}
    Element Text Should Be      ${FIRST ITEM}   ${LOW PRICE}
    Element Text Should Be      ${LAST ITEM}    ${HIGH PRICE}
    [Teardown]  Close Browser

Sort Product Name (Lo to Hi)
    Valid Login
    Select From List By Value   ${DROPDOWN}     ${HI TO LO}
    Element Text Should Be      ${FIRST ITEM}   ${HIGH PRICE}
    Element Text Should Be      ${LAST ITEM}    ${LOW PRICE}
    [Teardown]  Close Browser
