-- string used to search through open tabs
set url_search to "TODO"
-- full url to open if nothing close already opened
set url_full to "TODO"

tell application "Google Chrome" to activate
tell application "System Events"
	keystroke "a" using {command down, shift down}
	delay 1
	keystroke url_search
	keystroke return
end tell
delay 2
tell application "Google Chrome"
	set current_url to URL of active tab of front window
end tell
if current_url does not contain url_search then
	tell application "Google Chrome"
		open location url_full
	end tell
end if