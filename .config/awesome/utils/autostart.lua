local awful = require('awful')
do
   local cmds = {
      -- "redshift",
      -- "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1",
      "mpd",
      "dunst",
      "clipmenud",
      "picom",
      "xset r rate 300 50",
	  "unclutter --timeout 10",
      'setbg'
   }
   for _,i in pairs(cmds) do
      awful.spawn.with_shell(i .. "&")
   end
end
