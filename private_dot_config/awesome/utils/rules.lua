local ruled = require('ruled')
local awful = require('awful')
local beautiful = require('beautiful')

ruled.client.connect_signal("request::rules", function()
   -- All clients will match this rule.
   ruled.client.append_rule {
      id         = "global",
      rule       = { },
      properties = {
         border_width = beautiful.border_width,
         border_color = beautiful.border_normal,
         focus = awful.client.focus.filter,
         raise = true,
         -- screen = awful.screen.preferred,
         screen = awful.screen.focused,
         size_hints_honor = false,
         honor_workarea = true,
         honor_padding = true,
         maximized = false,
         titlebars_enabled = beautiful.titlebars_enabled,
         maximized_horizontal = false,
         maximized_vertical = false,
         -- placement = awful.placement.centered,
        placement = awful.placement.no_overlap +
            awful.placement.no_offscreen
      }
   }

   -- Add titlebars to normal clients and dialogs
   ruled.client.append_rule {
      id         = "titlebars",
      rule_any   = { type = { "normal", "dialog" } },
      properties = { titlebars_enabled = true }
   }

   -- Floating clients.
   ruled.client.append_rule {
      id       = "floating",
      rule_any = {
            instance = {"copyq", "pinentry"},
            class = {
                "Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv",
                "Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer", "mpv"
            },
            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name = {
                "Event Tester" -- xev.
            },
            role = {
                "AlarmWindow", -- Thunderbird's calendar.
                "ConfigManager", -- Thunderbird's about:config.
                "pop-up" -- e.g. Google Chrome's (detached) Developer Tools.
            }
      },
      properties = { floating = true, titlebars_enabled = false }
   }


end)
