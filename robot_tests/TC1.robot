*** Settings ***
Library			SeleniumLibrary
Suite Setup		Navigate to site
Suite Teardown	Close All Browsers

*** Variables ***
${FIRST_NAME}   John
${LAST_NAME}    Doe
${EMAIL}    someemail@mail.com
${PASSWORD}    123456

*** Test Cases ***
LoginTest
	Click Element    css=.nav.float-end .dropdown
	Click Link    css=a[href*="register"]
	Set values in form    ${FIRST_NAME}    ${LAST_NAME}    ${EMAIL}    ${PASSWORD}
	Click Element    css=input[name="agree"]
	Click Button    css=[type="submit"]
	Sleep    5s    # Pauses for 5 seconds


*** Keywords ***
Navigate to site
	Open Browser	https://demo.opencart.com/		Chrome    executable_path=../drivers/chromedriver.exe


Set values in form
	[Arguments]		${FIRST_NAME}	${LAST_NAME}    ${EMAIL}	${PASSWORD}
	Input Text    css=input[name="firstname"]    ${FIRST_NAME}
	Input Text    css=input[name="lastname"]    ${LAST_NAME}
	Input Text    css=input[name="email"]    ${EMAIL}
	Input Text    css=input[name="password"]    ${PASSWORD}

