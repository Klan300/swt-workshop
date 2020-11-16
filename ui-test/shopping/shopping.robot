*** Settings ***
Library    SeleniumLibrary
Suite Teardown     Close All Browsers

*** Variables ***
${URL}   https://www.dminer.in.th/Product-list.html
${BROWSER}   Chrome
${Quantity}    1
${CARDNUMBER}   4179700591590995
${CVV}   752
${MONTH}    7
${YEAR}     20

*** Test Cases ***
User ซื้อของเล่นให้ลูกสาว
    แสดงสินค้า
    แสดงรายละเอียดสินค้า
    ระบุจำนวนสินค้าที่ซื้อ
    นำสินค้าใส่ตะกร้า
    ยืนยันการสั่งซื้อและชำระเงินด้วยCreditCard
    ขอบคุณ

*** Keywords ***
แสดงสินค้า
    Open BROWSER    ${URL}     ${BROWSER}   
    Element Should Contain    id:productName-1    expected=43 Piece Dinner Set
    Element Should Contain    id:productPrice-1    expected=12.95 USD

แสดงรายละเอียดสินค้า
    Click Button    id:viewMore-1
    Wait Until Page Contains    Quantity
    Element Should Contain    id:productName    expected=43 Piece dinner Set
    Element Should Contain    id:productBrand    expected=CoolKidz
    Element Should Contain    id:productPrice    expected=12.95 USD

ระบุจำนวนสินค้าที่ซื้อ
    Input Text    id:productQuantity    ${Quantity}

นำสินค้าใส่ตะกร้า
    Click Button    id:addToCart
    Wait Until Page Contains    ยืนยันคำสั่งซื้อและชำระเงิน

ยืนยันการสั่งซื้อและชำระเงินด้วยCreditCard
    Element Attribute Value Should Be    id:productQuantity-1  attribute=value  expected=${Quantity}
    Element Should Contain    id:receiverName    expected=ณัฐญา ชุติบุตร
    Element Should Contain    id:recevierAddress    expected=405/37 ถ.มหิดล ต.ท่าศาลา อ.เมือง จ.เชียงใหม่ 50000
    Element Should Contain    id:recevierPhonenumber    expected=0970809292
    Element Should Contain    id:productName-1    expected=43 Piece dinner Set
    Element Should Contain    id:productPrice-1    expected=12.95
    Click Button    id:confirmPayment
    Wait Until Element Contains    id:Payment   ยืนยันการชำระเงิน
    Input Text    id:cardNumber    ${CARDNUMBER}
    Input Text    id:expiredMonth    ${MONTH}
    Input Text    id:expiredYear    ${YEAR}
    Input Text    id:cvv    ${Quantity}
    Input Text    id:cardName    Karnwat Wongudom
    Click Button    id:Payment

ขอบคุณ
    Wait Until Page Contains    กลับไปหน้าหลัก 
    Element Should Contain  id:notify   expected=วันเวลาที่ชำระเงิน 1/3/2563 13:30:00 หมายเลขคำสั่งซื้อ 8004359103 คุณสามารถติดตามสินค้าผ่านช่องทาง Kerry ด้วยหมายเลข 1785261900




