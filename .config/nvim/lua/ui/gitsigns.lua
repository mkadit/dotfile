require("gitsigns").setup {
  signs = {
    add          = { hl = "SignAdd",    text = "▎" },
    change       = { hl = "SignChange", text = "▎" },
    delete       = { hl = "SignDelete", text = "🭻" },
    topdelete    = { hl = "SignDelete", text = "🭶" },
    changedelete = { hl = "SignChange", text = "▎" },
  },
  current_line_blame = false,
  sign_priority = 5,
  update_debounce = 500,
  status_formatter = nil, -- Use default
}
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  sign_priority = 5,
  update_debounce = 500,
  status_formatter = nil, -- Use default
}
