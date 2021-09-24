pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")
require('utils.error_handling')


local home = os.getenv('HOME')
-- Load theme
local current_theme = home .. '/.config/awesome/themes/nord/theme.lua'
beautiful.init(current_theme)

-- utils
require('utils.notification')
require('utils.autostart')
require('utils.layout')
require('utils.keybind')
require('utils.rules')

-- components
require('components.nord.menu')
require('components.nord.bar')
require('components.nord.titlebar')

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
   c:activate { context = "mouse_enter", raise = false }
end)

-- FIX: Fix chrome always start in floating mode
