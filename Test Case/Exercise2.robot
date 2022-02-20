*** Settings ***
Resource       ../Resource/PageObject2.robot

*** Test Cases ***
Exercise2
    Go to ebay
    Type any search string in the search bar. For example: MacBook.
    Change the Search category. For example: Computers/Tablets & Networking and click Search.
    Verify that the page loads completely.
    Verify that the first result name matches with the search string
    Close the browser