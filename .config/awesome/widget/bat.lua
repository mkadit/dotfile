local wibox = require('wibox')
local vc = require('vicious')
local icon = require('utils.icon')

local bat = {}
local w = wibox.widget.textbox()
vc.cache(vc.widgets.bat)

bat.text = vc.register(w, vc.widgets.bat, "$2 %", 3, "BAT0")
bat.icon = {
   {
      image = icon.png.battery,
      widget = wibox.widget.imagebox,
   },
   widget = wibox.layout.fixed.horizontal,
}

return bat
