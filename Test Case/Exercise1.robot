*** Settings ***
Resource       ../Resource/PageObject1.robot

*** Test Cases ***
Exercise1
    Go to ebay
    Navigate to Search by category > Electronics > Cell Phones & accessories
    After the page loads, click Cell Phones & Smartphones in the left hand side navigation section.
    Now, click - More refinements (appears on the left at the end of all filters).
    Add 3 filters - screen size, Price and Item location appearing in the pop-up and click apply.
    Verify that the filter tags are applied also counting tags are applied that equals with integer result
    Close the Browser
