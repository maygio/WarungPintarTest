*** Settings ***
Library        Selenium2Library

*** Variables ***
${URL}                            https://www.ebay.com/        
${Electronics}                    //*[@class='hl-cat-nav__js-tab']//descendant::a[contains(text(),"Electronics")]
${CellPhones}                     //li/descendant::a[contains(text(), "Cell Phones, Smart Watches & Accessories")]
${Smartphones}                    //li/descendant::a[contains(text(), "Cell Phones & Smartphones")]
${AllFilters}                     //button[contains(text(),"All Filters")]
${ScreenSize}                     //div[@id="c3-mainPanel-Screen%20Size"]
${Price}                          //div[@id="c3-mainPanel-price"]
${ItemLocation}                   //div[@id="c3-mainPanel-location"]
${FilterSelectedNotSpecified}     //div[@id="c3-tray-tray"]/descendant::span[1]
${FilterSelected10until100k}      //div[@id="c3-tray-tray"]/descendant::span[2]
${FilterSelectedCountry}          //div[@id="c3-tray-tray"]/descendant::span[3]
${SelectNotSpecified}             //*[@id="c3-subPanel-Screen%20Size_Not%20Specified_cbx"]
${InputMinimumPrice}              //div[@class="x-textrange"]/descendant::input[1]
${InputMaximumPrice}              //div[@class="x-textrange"]/descendant::input[2]
${SelectAsia}                     //div[@id="c3-subPanel-location_Asia"]
${ValueMinimumPrice}              10                     
${ValueMaximumPrice}              100000
${Verified3FiltersSelected}       //button[@class="x-tray__filter"]


*** Keywords ***
Go to ebay
    Open browser                      ${URL}        chrome
    Set Selenium Implicit Wait        5
    Maximize Browser Window           

Navigate to Search by category > Electronics > Cell Phones & accessories
    Click Element                     ${Electronics}
    Click Element                     ${CellPhones}

After the page loads, click Cell Phones & Smartphones in the left hand side navigation section.
    Click Element                     ${Smartphones}

Now, click - More refinements (appears on the left at the end of all filters).
    Execute Javascript                window.scrollTo(0, 1000)
    Click Element                     ${AllFilters}

Add 3 filters - screen size, Price and Item location appearing in the pop-up and click apply.
    Sleep                             5
    Click Element                     ${ScreenSize}
    ${TextNotSpecified}=              Get text                    ${SelectNotSpecified}
    Set Global Variable               ${TextNotSpecified}                    
    Click Element                     ${SelectNotSpecified}
    Sleep                             2
    Scroll Element Into View          ${Price}
    Click Element                     ${Price}
    Input text                        ${InputMinimumPrice}        ${ValueMinimumPrice}
    Input text                        ${InputMaximumPrice}        ${ValueMaximumPrice}
    Sleep                             2
    Scroll Element Into View          ${ItemLocation}
    Click Element                     ${ItemLocation}
    ${TextAsia}=                      Get text                    ${SelectAsia}
    Set Global Variable               ${TextAsia}                        
    Click Element                     ${SelectAsia}

Verify that the filter tags are applied also counting tags are applied that equals with integer result
    Element text should be        ${Verified3FiltersSelected}        (3) Filter(s) selected
    Element text should be        ${FilterSelectedNotSpecified}      Not Specified
    Element text should be        ${FilterSelected10until100k}       IDR10 - IDR100000
    Element text should be        ${FilterSelectedCountry}           Asia

Close the Browser
    Close Browser