*** Settings ***
Library           SeleniumLibrary

# Test Suite and Test Case setup    
Suite Setup       Log    ===> Test Suite setup    
Suite Teardown    Log    ===> Test Suite teardown
Test Setup        Log    ===> Test Case setup
Test Teardown     Log    ===> Test Case teardown

Default Tags      sanity

*** Test Cases ***
MyFirstTest
    Log    Hello World 1...

My2ndTest
    [Tags]    Smoke
    Log    Hello World 2...

My3rdTest
    Log    Hello World 3...

My4thTest
    Log    Hello World 4...


# FirstSeleniumTest
    # Open Browser    https://google.com    chrome
    # # Wait for 5 secs for browser to load
    # Set Browser Implicit Wait    5
    # Input Text      name=q                Automation Step By Step
    # # The following is to Escape the Chrome suggestions that may overlap the SEARCH button
    # Press Keys      name=q                ENTER
    # # Click Button    name=btnK    
    # Sleep    2         
    # Close Browser
    # Log             Test Complete : FirstSeleniumTest
    
# SampleLoginTest
    # [Documentation]    This is a sample login test
    # Open Browser       https://opensource-demo.orangehrmlive.com/     Chrome
    # Set Browser Implicit Wait    3
    # Input Text         id=txtUsername                                 Admin
    # Input Text         id=txtPassword                                 admin123
    # Click Button       id=btnLogin
    # Click Element      id=welcome
    # Click Element      link=Logout
    # Close Browser
    # Log                Test Complete : SampleLoginTest


# SampleAlphaLoginTest
    # [Documentation]    This is a sample login test to the Alpha system
    # Open Browser       ${URL}          Chrome
    # Set Browser Implicit Wait    3
    # Click Button       id=details-button
    # Click Element      id=proceed-link
    # LoginKW
    # Sleep              2    
    # Click Element      link=[Logout]
    # Sleep              2    
    # Close Browser
    # Log                Test Complete : SampleAlphaLoginTest
    
    # # The following refers to ENVIRONMENT variable. Open DOS Cmd Windows
    # # C:\Users\qtonthat>echo %username%
    # # qtonthat
    # # C:\Users\qtonthat>echo %os%
    # # Windows_NT
    # Log                This test was executed by %{username} on %{os}
    
    # # The following refers to Built-In variables. Open Google and serach for Robot Framework Userguide
    # # 
    # Log                The test suite is located at ${CURDIR}               
    
*** Variables ***
# Scalar variables
${URL}            https://10.155.6.174/CommPilot/Login/

# List variables
@{CREDENTIALS}    testEnterpriseRoAdmin    Cisco#roAdmin123!

# Dictionary variables
&{LOGINDATA}      userid=testEnterpriseRoAdmin    password=Cisco#roAdmin123! 

*** Keywords ***
# User-defined keywords
LoginKW
    Input Text         name=EnteredUserID                             &{LOGINDATA}[userid]
    sleep              5
    Input Password     name=Password                                  &{LOGINDATA}[password]
    Click Element      link=Login







