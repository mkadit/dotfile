local awful = require('awful')
-- local wallpaper = "xwallpaper --zoom " .. os.getenv('HOME') ..  '/.local/share/bg'
local wallpaper = os.getenv('HOME') .. '/.local/bin/setbg'
do
   local cmds = {
      -- "redshift",
      -- "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1",
      -- 'lxsession -an',
      "mpd",
      "dunst",
      "clipmenud",
      "picom",
      "xset r rate 300 50",
	  "unclutter --timeout 10",
      wallpaper,
   }
   for _,i in pairs(cmds) do
      awful.spawn.with_shell(i .. "&")
   end
end
