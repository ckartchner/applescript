# If a zoom meeting is open, mute microphone within the app
set mtgTitle to "Zoom Meeting"
tell application "System Events"
    if exists window 1 of process "zoom.us" then
        # If multiple zoom windows switch to the one titled mtgTitle
        tell process "zoom.us"
            set frontmost to true
            perform action "AXRaise" of (first window whose title is mtgTitle)
        end tell
        tell application process "zoom.us"
            if exists (menu 1 of menu bar item "Meeting" of menu bar 1) then
                set meetingMenu to menu 1 of menu bar item "Meeting" of menu bar 1
                set canMute to exists menu item "Mute audio" of meetingMenu
                if canMute then
                    click menu item "Mute audio" of meetingMenu
                end if
            end if
        end tell
    end if
end tell