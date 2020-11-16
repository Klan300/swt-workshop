*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}   https://facebook.com
${BROWSER}   Chrome
${EMAIL}    admin
${PASSWORD}    admin123
${USERNAME}    Admin


*** Test Cases ***
Test search keyword and verify search result on google
    search url facebook
    enter email and password
    press enter
    Check name
    Click to Enter Status
    Write Status
    Post

*** Keywords ***
search url facebook
    ${options}=    Evaluate    sys.modules['selenium.webdriver.chrome.options'].Options()    sys
    Call Method    ${options}    add_argument    --disable-notifications
    ${driver}=     Create Webdriver    Chrome    options=${options}
    Go To   ${URL}

enter email and password
    Input Text    name:email    ${EMAIL}
    Input Password    name:pass    ${PASSWORD}
    
press enter
    Click Element    id:u_0_b

Check name
    Wait Until Page Contains    facebook
    Page Should Contain    ${USERNAME}

Click to Enter Status
    Click Element    xpath: //*[contains(text(), "คุณคิดอะไรอยู่ ธัญ")]
    Wait Until Page Contains    คุณคิดอะไรอยู่ ธัญ

Write Status
    Wait Until Page Contains    เพิ่มลงในโพสต์ของคุณ
    Press Keys    None   สวัสดี RobotFramework
    

Post
    Click Element    xpath: //div[contains(text(), "โพสต์")]
    Close Browser


   