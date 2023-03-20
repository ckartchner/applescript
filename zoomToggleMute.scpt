# Raise mtg window to front and toggle mute
set mtgTitle to "Zoom Meeting"
tell application "System Events"
    if exists window 1 of process "zoom.us" then
        # If multiple zoom windows switch to the one titled mtgTitle
        if exists (window mtgTitle of process "zoom.us")
            tell process "zoom.us"
                set frontmost to true
                perform action "AXRaise" of (first window whose title is mtgTitle)
            end tell
        end if
        tell application process "zoom.us"
            if exists (menu 1 of menu bar item "Meeting" of menu bar 1) then
                tell application "System Events"
                    keystroke "a" using {command down, shift down}
                end tell
            end if
        end tell
    end if
end tell