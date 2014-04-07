# -*- encoding: utf-8 -*-
require 'appscript'

itunes = Appscript.app("iTunes")
r = Regexp.new("PowerPoint|Impress|Chrome|Viewer|Preview")

while true
  active_app = `osascript -e 'tell application "System Events" \n set front_app to name of (path to frontmost application) \n end tell'`
  if nil != ( r =~ active_app )
    begin
      itunes.pause
      code = ( "0b" + itunes.current_track.name.get ).oct if nil == code
      case ( code - ( "0b" + itunes.current_track.name.get ).oct + 3 ) % 3
      when 1
        `osascript -e 'tell application "System Events" \n key code 123 \n end tell'`
      when 2
        `osascript -e 'tell application "System Events" \n key code 124 \n end tell'`
      end
      code = ( "0b" + itunes.current_track.name.get ).oct
    rescue
    end
  end
  sleep 0.1
end
