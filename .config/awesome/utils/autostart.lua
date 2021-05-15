local awful = require('awful')
local wallpaper = "xwallpaper --zoom " .. os.getenv('HOME') ..  '/.local/share/bg'
do
   local cmds = {
      -- "redshift",
      -- "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1",
      "mpd",
      "dunst",
      "clipmenud",
      "picom",
      "xset r rate 300 50",
      wallpaper
       -- "sh /home/nako/screen.sh"
   }
   for _,i in pairs(cmds) do
      awful.spawn.with_shell(i .. "&")
   end
end
