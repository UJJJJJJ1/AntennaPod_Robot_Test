*** Settings ***
Force Tags    UC-MC
Library    AppiumLibrary
Library    Process
Resource   ./allLocalKeywords.txt
Resource    Variables.txt

# Suite Setup    Run Keywords    Open AntennaPod
# ...                     AND    Add Poscast    CNN 5 Things

# Suite Teardown    Run Process    adb    shell    pm    clear    ${PACKAGE_NAME}

*** Test Cases ***
# T
#     Open AntennaPod
#     Log    123
    # Run Process    adb    shell    pm    clear    de.danoeh.antennapod.debug

Play_Podcast_By_Download
    [Tags]    TC-MC-01-01
    [Setup]  Run Keywords    Open AntennaPod
    ...               AND    Add Poscast    CNN 5 Things
    ...               AND    Select Podcast On Home Page    CNN 5 Things
    ...               AND    Click First Episode In Podcast
    ...               AND    Click Download Button
    ...               AND    Click Play Button
    ...               AND    Click Podcast Below
    Verify Pause Button Is Visible In Podcast Player Page
    [Teardown]    Run Keywords    Click Back Button In Podcast Player Page
    ...                    AND    Click Delete Button
    ...                    AND    Click Home Page Button
    ...                    AND    Swipe Down To Close Podcast
    ...                    AND    Delete From Subscribtion    CNN 5 Things
    ...                    AND    Close Application

Play_Podcast_By_Stream
    [Tags]    TC-MC-01-02
    [Setup]  Run Keywords    Open AntennaPod
    ...               AND    Add Poscast    CNN 5 Things
    ...               AND    Select Podcast On Home Page    CNN 5 Things
    ...               AND    Click First Episode In Podcast
    ...               AND    Click Stream Button
    ...               AND    Click Podcast Below
    Verify Pause Button Is Visible In Podcast Player Page
    [Teardown]    Run Keywords    Click Back Button In Podcast Player Page
    ...                    AND    Click Pause Button
    ...                    AND    Click Home Page Button
    ...                    AND    Swipe Down To Close Podcast
    ...                    AND    Delete From Subscribtion    CNN 5 Things
    ...                    AND    Close Application

Pause_Podcast
    [Tags]    TC-MC-02
    [Setup]  Run Keywords    Open AntennaPod
    ...               AND    Add Poscast    CNN 5 Things
    ...               AND    Select Podcast On Home Page    CNN 5 Things
    ...               AND    Click First Episode In Podcast
    ...               AND    Click Stream Button
    ...               AND    Click Podcast Below
    ...               AND    Click Pause Button In Podcast Player Page
    Verify Play Button Is Visible In Podcast Player Page
    [Teardown]    Run Keywords    Click Back Button In Podcast Player Page
    ...                    AND    Click Home Page Button
    ...                    AND    Swipe Down To Close Podcast
    ...                    AND    Delete From Subscribtion    CNN 5 Things
    ...                    AND    Close Application


Resume_Podcast
    [Tags]    TC-MC-03
    [Setup]  Run Keywords    Open AntennaPod
    ...               AND    Add Poscast    CNN 5 Things
    ...               AND    Select Podcast On Home Page    CNN 5 Things
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
    ...                    AND    Delete From Subscribtion    CNN 5 Things
    ...                    AND    Close Application

Stop_Podcast_By_Swiping_Down_Podcast
    [Tags]    TC-MC-04
    [Setup]  Run Keywords    Open AntennaPod
    ...               AND    Add Poscast    CNN 5 Things
    ...               AND    Select Podcast On Home Page    CNN 5 Things
    ...               AND    Click First Episode In Podcast
    ...               AND    Click Stream Button
    Swipe Down To Close Podcast    #Verify is inside the keyword
    [Teardown]    Run Keywords    Click Home Page Button
    ...                    AND    Delete From Subscribtion    CNN 5 Things
    ...                    AND    Close Application

Fast_Forward_Podcast
    [Tags]    TC-MC-05-01
    [Setup]  Run Keywords    Open AntennaPod
    ...               AND    Add Poscast    CNN 5 Things
    ...               AND    Select Podcast On Home Page    CNN 5 Things
    ...               AND    Click First Episode In Podcast
    ...               AND    Click Stream Button
    ...               AND    Click Podcast Below
    ...               AND    Click Pause Button In Podcast Player Page
    Verify Fast Forward Podcast Is Correct
    [Teardown]    Run Keywords    Click Back Button In Podcast Player Page
    ...                    AND    Click Home Page Button
    ...                    AND    Swipe Down To Close Podcast
    ...                    AND    Delete From Subscribtion    CNN 5 Things
    ...                    AND    Close Application

Rewind_Podcast
    [Tags]    TC-MC-05-02
    [Setup]  Run Keywords    Open AntennaPod
    ...               AND    Add Poscast    CNN 5 Things
    ...               AND    Select Podcast On Home Page    CNN 5 Things
    ...               AND    Click First Episode In Podcast
    ...               AND    Click Stream Button
    ...               AND    Click Podcast Below
    ...               AND    Click Pause Button In Podcast Player Page
    Verify Rewind Podcast Is Correct
    [Teardown]    Run Keywords    Click Back Button In Podcast Player Page
    ...                    AND    Swipe Down To Close Podcast
    ...                    AND    Click Home Page Button
    ...                    AND    Delete From Subscribtion    CNN 5 Things
    ...                    AND    Close Application

Fast_Forward_Podcast_To_Specific_Time
    [Tags]    TC-MC-06
    [Setup]  Run Keywords    Open AntennaPod
    ...               AND    Add Poscast    CNN 5 Things
    ...               AND    Select Podcast On Home Page    CNN 5 Things
    ...               AND    Click First Episode In Podcast
    ...               AND    Click Stream Button
    ...               AND    Click Podcast Below
    ...               AND    Click Pause Button In Podcast Player Page
    Verify Fast Forward Podcast To Specific Time Is Correct
    [Teardown]    Run Keywords    Click Back Button In Podcast Player Page
    ...                    AND    Swipe Down To Close Podcast
    ...                    AND    Click Home Page Button
    ...                    AND    Delete From Subscribtion    CNN 5 Things
    ...                    AND    Close Application

Skip To Next Podcast In Queue With No Next Podcast
    [Tags]    TC-MC-07-01
    [Setup]    Run Keywords    Open AntennaPod
    ...                 AND    Add Podcast To Subscriptions
    ...                 AND    Play And Pause Podcast    1
    ...                 AND    Click Back Button In Podcast Information Page
    ...                 AND    Go To Home Page
    Play Podcast In Queue With No Next Podcast
    Verify Skip To Next Podcast With Only One Podcast In Queue Will Back To Home Page
    [Teardown]    Run Keywords    Go To Queue Page
    ...                    AND    Clear Queue
    ...                    AND    Click Home Page Button
    ...                    AND    Close Application

Skip To Next Podcast In Queue With Has Next Podcast
    [Tags]    TC-MC-07-02
    [Setup]    Run Keywords    Open AntennaPod
    ...                 AND    Add Podcast To Subscriptions
    ...                 AND    Add Podcasts To Queue    @{toPlayList}
    ...                 AND    Go To Queue Page
    Play Podcast In Queue With Has Next Podcast
    Verify Skip To Next Podcast With Has Next Podcast Will Is Expected
    [Teardown]    Run Keywords    Click Back Button And Go To Home Page
    ...                    AND    Swipe Down To Close Podcast
    ...                    AND    Go To Queue Page
    ...                    AND    Clear Queue
    ...                    AND    Click Home Page Button
    ...                    AND    Close Application

Adjust Podcast Speed
    [Tags]    TC-MC-08
    [Setup]    Run Keywords    Open AntennaPod
    ...                 AND    Add Podcast To Subscriptions
    ...                 AND    Play And Pause Podcast    1
    ...                 AND    Click Back Button In Podcast Information Page
    ...                 AND    Go To Home Page
    Set Podcast To Specific Speed
    Verify Speed Is Adjusted
    [Teardown]    Run Keywords    Click Back Button In Podcast Page
    ...                    AND    Swipe Down To Close Podcast
    ...                    AND    Close Application