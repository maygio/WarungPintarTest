*** Settings ***
Library        Selenium2Library
Library        String

*** Variables ***
${URL}                            https://www.ebay.com/        
${SearchBox}                      //div[@id="gh-ac-box2"]//descendant::input
${SearchValue}                    macbook
${AllCategories}                  //div[@id="gh-cat-box"]//descendant::select
${SearchButton}                   //input[@id="gh-btn"]
${AllListing}                     //div[@class="srp-controls__control--responsive"]/descendant::span[1]
${FirstResult}                    //div[@class="srp-river-results clearfix"]/descendant::li[@class="s-item s-item__pl-on-bottom s-item--watch-at-corner"][1]

*** Keywords ***
Go to ebay
    Open browser      ${URL}           chrome
    Set Selenium Implicit Wait         5
    Maximize Browser Window 

Type any search string in the search bar. For example: MacBook.
    Click Element     ${SearchBox}
    Input text        ${SearchBox}      ${SearchValue}

Change the Search category. For example: Computers/Tablets & Networking and click Search.
    Click Element                ${AllCategories}
    Sleep                        2
    Select From List By Value    ${AllCategories}    58058
    Sleep                        2
    Click Element                ${SearchButton}

Verify that the page loads completely.
    Element should be visible    ${AllListing}

Verify that the first result name matches with the search string
    ${MacBookText}=              Get text                  ${FirstResult}
    ${LowerMacBookText}=         Convert to lower case     ${MacBookText}
    Log to console               ${LowerMacBookText}
    Should contain any           ${LowerMacBookText}        ${SearchValue}

Close the browser
    Close Browser