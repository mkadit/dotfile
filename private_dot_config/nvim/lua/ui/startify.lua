local g = vim.g
local api = vim.api
g.startify_custom_header = 'startify#center(g:ascii)'

g.ascii = {

    '███╗   ███╗██╗  ██╗ █████╗ ██████╗ ██╗████████╗',
    '████╗ ████║██║ ██╔╝██╔══██╗██╔══██╗██║╚══██╔══╝',
    '██╔████╔██║█████╔╝ ███████║██║  ██║██║   ██║',
    '██║╚██╔╝██║██╔═██╗ ██╔══██║██║  ██║██║   ██║',
    '██║ ╚═╝ ██║██║  ██╗██║  ██║██████╔╝██║   ██║',
    '╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝   ╚═╝'

}

g.startify_session_dir = '~/.config/nvim/session'
g.startify_session_delete_buffers = 1
g.startify_session_persistence = 1
g.startify_enable_special = 0

api.nvim_exec(
    'let startify_lists = [ { \'type\': \'sessions\',  \'header\': [\'   Sessions\'] },    { \'type\': \'bookmarks\', \'header\': [\'   Bookmarks\'] },                                                                   ]',
    true)

api.nvim_exec(
    'let startify_bookmarks = [ { \'i\': \'~/.config/nvim/init.lua\' }, { \'f\': \'~/.config/vifm/vifmrc\' }, { \'d\': \'~/.local/src/script/install.sh\'},{ \'b\': \'~/.local/bin/backup\'},  { \'o\': \'~/Documents/records/notes\' },{ \'s\': \'~/.local/src/st/config.def.h\' }, { \'n\': \'~/Documents/records/home/note.norg\' }, { \'z\': \'~/.zshrc\' }]  ' , true)
