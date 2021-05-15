local awful = require('awful')
local conf = awful.util.getdir('config')
local crayon = conf .. '/icons/crayon/'
local linebit = conf .. '/icons/linebit/'
local drops = conf .. '/icons/drops/'

local icon = {}

icon.gylph = {
   cpu = ' ',
   temp = ' ',
   firefox = '',
   plug = ' ',
   music = ' ',
   mail = '',
   heart = ' ',
   star = ' ',
   signal = ' ',
   power = ' ',
   setting = ' ',
   trash = ' ',
   picture = '',
   edit = '',
   git = ' ',
   launcher = ' ',
   terminal = ' ',
   code = ' ',
   folder_open = ' ',
   github = ' ',
   home = ' ',
   box = ' ',
   wifi = ' ',
   telegram = ' ',
   user = ' ',
   telegram_circle = ' ',
   moon = ' ',
   sun = ' ',
   calendar = '',
   volume = ' ',
   storage = '',
   dot = '',
   reboot = ' ',
   logout = ' ',
}

icon.png = {
   firefox = crayon .. 'firefox.png',
   terminal = crayon .. 'terminal.png',
   file_manager = crayon .. 'file_manager.png',
   launcher = crayon .. 'launcher.png',
   telegram = crayon .. 'telegram.png',
   music = crayon .. 'music.png',
   calendar = linebit .. 'ncloud.png',
   fire = linebit .. 'temperature.png',
   ram = crayon .. 'ram.png',
   music_player = linebit .. 'music.png',
   heart = linebit .. 'cpu.png',
   volume = linebit .. 'volume.png',
   brightness = crayon .. 'brightness.png',
   storage = linebit .. 'files.png',
   wifi = linebit .. 'whatever.png',
   battery = linebit .. 'battery.png',
   mem = linebit .. 'ram.png',
   w1 = linebit .. 'home.png',
   w2 = linebit .. 'snow.png',
   w3 = linebit .. 'star.png',
   w4 = linebit .. 'sun.png',
   w5 = linebit .. 'mist.png',
}

return icon
