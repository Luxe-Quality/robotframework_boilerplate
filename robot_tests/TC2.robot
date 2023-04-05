*** Settings ***
Library     SeleniumLibrary
Suite Setup		Navigate to site
Suite Teardown	Close All Browsers

*** Test Cases ***
Temperature Converter Page Test
    Verify Page Loads Successfully
    Convert Celsius to Fahrenheit
    Convert Fahrenheit to Celsius
    Switch Temperature Scales Successfully
    Show Error Message on Invalid Input


*** Keywords ***
Navigate to site
	Open Browser	https://www.theonlineconverter.co.uk/temperature-converter//		Chrome

Verify Page Loads Successfully
    Title Should Be     Convert Temeperature | Degrees Celsius to Fahrenheit | Online Converter
    Page Should Contain Element      css=h1      Temperature Converter
    Page Should Contain Element      css=[name="userInput"]
    Page Should Contain Element      css=[name="convertFrom"]
    Page Should Contain Element      css=[name="convertTo"]
    Page Should Contain Element      css=#convertBtn
    Page Should Contain Element      css=#answer

Convert Celsius to Fahrenheit
    Convert Temperature   25    degree Celsius    degree Fahrenheit    77

Convert Fahrenheit to Celsius
    Convert Temperature  77    degree Fahrenheit    degree Celsius    25

Switch Temperature Scales Successfully
    Convert Temperature     300    kelvin    degree Celsius    26.85
    select from list by label    css=[name="convertTo"]  degree Fahrenheit
    Element Should Contain  css=#answer > p    80.33

Show Error Message on Invalid Input
    Convert Temperature    abc    degree Celsius    degree Fahrenheit    0

Convert Temperature
    [Arguments]    ${input_value}    ${from_unit}    ${to_unit}    ${expected_result}
    Input Text     css=[name="userInput"]    ${input_value}
    select from list by label    css=[name="convertFrom"]    ${from_unit}
    select from list by label    css=[name="convertTo"]    ${to_unit}
    Click Button    css=#convertBtn
    Wait Until Page Contains Element    css=#answer > p
    Element Should Contain    css=#answer > p    ${expected_result}