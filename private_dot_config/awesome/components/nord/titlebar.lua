local beautiful = require('beautiful')
local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')

local function shapemanager(c)
   c.shape = function(cr, w, h)
      if not c.fullscreen and not c.maximized then
         gears.shape.rounded_rect(cr, w, h, beautiful.border_radius or 10)
      else
         gears.shape.rounded_rect(cr, w, h, 0)
      end
   end
end

client.connect_signal("manage", function(c)
   if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
      awful.placement.no_offscreen(c)
   end
   shapemanager(c)
end)

client.connect_signal("request::geometry", function(c) shapemanager(c) end)
client.connect_signal("request::activate", function(c) shapemanager(c) end)

client.connect_signal("request::titlebars", function(c)
   local buttons = gears.table.join(
      awful.button({},1,function()
         c:emit_signal("request::activate", "titlebar", {raise = true})
         awful.mouse.client.move(c)
      end),
      awful.button({},3,function()
         c:emit_signal("request::activate", "titlebar", {raise = true})
         awful.mouse.client.resize(c)
      end)
   )

    awful.titlebar(c).widget = {
        { -- Left
            -- awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton(c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton(c),
            awful.titlebar.widget.ontopbutton(c),
            awful.titlebar.widget.closebutton(c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }


end)

