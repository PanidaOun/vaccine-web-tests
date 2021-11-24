*** Settings ***
Documentation   Some test using seleniumlibrary
Library          SeleniumLibrary

*** Variables ***
# variable names can contain spaces
${URL}    https://vaccine-haven.herokuapp.com/
${BROWSER}      chrome
${CITIZEN_ID}    9621054551322     
${SITE}    OGYHSite
${VACCINE}    Pfizer

*** Test Cases ***
#  Verify 2 items on the home page
Test Home page if contain My info button(check info)
	Open Browser to Home Page
	Check has info button
Test Home page if contain register button
    Open Browser to Home Page
    Check has register button

#  Test create reservation, Verify that the registration was created.
Test if can create a reservation
    Open Browser to Home Page
    Create reservation
    Check create reservation

#  Test cancel reservation
Test if can cancel a reservation
    Open Browser to Home Page
    Cancel reservation
    Check cancel reservation


*** Keywords ***
# User-defined keywords (actions & expressions)

Open Browser to Home Page
	Open Browser  ${URL}  ${BROWSER}

Check has info button
	Page Should Contain     Your Information
    Page Should Contain Button  Check Info
    Click Button 	 Check Info


Check has register button
	Page Should Contain     Citizen Registration 
    Page Should Contain Button  Register
    Click Button    Register

Create reservation
    Click Button    Reserve Vaccine
    Input Text 	 name:citizen_id    ${CITIZEN_ID}
    click element   xpath=//select[@name="site_name"]

    Mouse over    xpath:/html/body/div[2]/div/div[2]/div/form/div/div/div/div[2]/div[4]/div[1]/select
    Page Should Contain Element    xpath=//select[@name="site_name"]    5s
    Click Element   xpath=//select[@name="site_name"]
    Click Element  xpath=//option[contains(text(),'${SITE}')]

    Mouse over    xpath:/html/body/div[2]/div/div[2]/div/form/div/div/div/div[2]/div[4]/div[2]/select
    Page Should Contain Element    xpath=//select[@name="vaccine_name"]    5s
    Click Element    xpath=//select[@name="vaccine_name"]
    Click Element    xpath=//option[contains(text(),'${VACCINE}')]

    Click Button 	 Submit
Check create reservation
    wait until page contains    Your Information
    Click Button    Check Info
    Input Text 	 name:citizen_id    ${CITIZEN_ID}
    Click Button 	 Submit
    wait until page contains    Vaccine Reservation Information:
    Page Should Contain    Pfizer
    Page Should Contain    OGYHSite

Cancel reservation
    Click Button    Check Info
    Input Text 	 name:citizen_id    ${CITIZEN_ID}
    Click Button 	 Submit
    wait until page contains    Vaccine Reservation Information:
    Click Button 	 Cancel

Check cancel reservation
    wait until page contains    Citizen Page
    Input Text 	 name:citizen_id    ${CITIZEN_ID}
    Click Button 	 Submit
    wait until page contains    Vaccine Reservation Information:
    Page Should Not Contain    Pfizer
    Page Should Not Contain    OGYHSite
