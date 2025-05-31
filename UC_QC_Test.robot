*** Settings ***
Force Tags    UC-MC
Library    AppiumLibrary
Library    Process
Resource   ./Setup.txt

Suite Setup    Run Keywords    Open AntennaPod
...                     AND    Add Poscast    CNN 5 Things

Suite Teardown    Run Process    adb    shell    pm    clear    ${PACKAGE_NAME}

*** Variables ***
${REMOTE_URL}     http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME}    android
${PLATFORM_VERSION}    16.0
${DEVICE_NAME}    emulator-5554
${PACKAGE_NAME}     de.danoeh.antennapod.debug
${Activity_NAME}        de.danoeh.antennapod.activity.MainActivity

*** Test Cases ***
# T
    # Log    123
    # Run Process    adb    shell    pm    clear    de.danoeh.antennapod.debug

Play_Podcast_By_Download
    [Tags]    TC-MC-01-01
    [Setup]  Run Keywords    Select Podcast On Home Page    CNN 5 Things
    ...               AND    Click First Episode In Podcast
    ...               AND    Click Download Button
    ...               AND    Click Play Button
    ...               AND    Click Podcast Below
    Verify Pause Button Is Visible In Podcast Player Page
    [Teardown]    Run Keywords    Click Back Button In Podcast Player Page
    ...                    AND    Click Delete Button
    ...                    AND    Click Home Page Button
    ...                    AND    Swipe Down To Close Podcast

Play_Podcast_By_Stream
    [Tags]    TC-MC-01-02
    [Setup]  Run Keywords    Select Podcast On Home Page    CNN 5 Things
    ...               AND    Click First Episode In Podcast
    ...               AND    Click Stream Button
    ...               AND    Click Podcast Below
    Verify Pause Button Is Visible In Podcast Player Page
    [Teardown]    Run Keywords    Click Back Button In Podcast Player Page
    ...                    AND    Click Pause Button
    ...                    AND    Click Home Page Button
    ...                    AND    Swipe Down To Close Podcast

Pause_Podcast
    [Tags]    TC-MC-02
    [Setup]  Run Keywords    Select Podcast On Home Page    CNN 5 Things
    ...               AND    Click First Episode In Podcast
    ...               AND    Click Stream Button
    ...               AND    Click Podcast Below
    ...               AND    Click Pause Button In Podcast Player Page
    Verify Play Button Is Visible In Podcast Player Page
    [Teardown]    Run Keywords    Click Back Button In Podcast Player Page
    ...                    AND    Click Home Page Button
    ...                    AND    Swipe Down To Close Podcast

Resume_Podcast
    [Tags]    TC-MC-03
    [Setup]  Run Keywords    Select Podcast On Home Page    CNN 5 Things
    ...               AND    Click First Episode In Podcast
    ...               AND    Click Stream Button
    ...               AND    Click Podcast Below
    ...               AND    Click Pause Button In Podcast Player Page
    ...               AND    Click Play Button In Podcast Player Page
    Verify Pause Button Is Visible In Podcast Player Page
    [Teardown]    Run Keywords    Click Back Button In Podcast Player Page
    ...                    AND    Click Pause Button
    ...                    AND    Click Home Page Button
    ...                    AND    Swipe Down To Close Podcast

Stop_Podcast_By_Swiping_Down_Podcast
    [Tags]    TC-MC-04
    [Setup]  Run Keywords    Select Podcast On Home Page    CNN 5 Things
    ...               AND    Click First Episode In Podcast
    ...               AND    Click Stream Button
    Swipe Down To Close Podcast    #Verify is inside the keyword
    [Teardown]    Click Home Page Button

Fast_Forward_Podcast
    [Tags]    TC-MC-05-01
    [Setup]  Run Keywords    Select Podcast On Home Page    CNN 5 Things
    ...               AND    Click First Episode In Podcast
    ...               AND    Click Stream Button
    ...               AND    Click Podcast Below
    ...               AND    Click Pause Button In Podcast Player Page
    Verify Fast Forward Podcast Is Correct
    [Teardown]    Run Keywords    Click Back Button In Podcast Player Page
    ...                    AND    Click Home Page Button
    ...                    AND    Swipe Down To Close Podcast

Rewind_Podcast
    [Tags]    TC-MC-05-02
    [Setup]  Run Keywords    Select Podcast On Home Page    CNN 5 Things
    ...               AND    Click First Episode In Podcast
    ...               AND    Click Stream Button
    ...               AND    Click Podcast Below
    ...               AND    Click Pause Button In Podcast Player Page
    Verify Rewind Podcast Is Correct
    [Teardown]    Run Keywords    Click Back Button In Podcast Player Page
    ...                    AND    Swipe Down To Close Podcast

Fast_Forward_Podcast_To_Specific_Time
    [Tags]    TC-MC-06
    [Setup]  Run Keywords    Select Podcast On Home Page    CNN 5 Things
    ...               AND    Click First Episode In Podcast
    ...               AND    Click Stream Button
    ...               AND    Click Podcast Below
    ...               AND    Click Pause Button In Podcast Player Page
    Verify Fast Forward Podcast To Specific Time Is Correct
    [Teardown]    Run Keywords    Click Back Button In Podcast Player Page
    ...                    AND    Swipe Down To Close Podcast
    ...                    AND    Click Home Page Button