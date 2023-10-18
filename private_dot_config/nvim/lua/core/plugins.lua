local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- import all plugins
    { import = "plugins" },

    -- add LazyVim and import its plugins
    -- { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import any extras modules here
    -- { import = "plugins.extras.ui.mini-animate" },
    { import = "plugins.extras.none-ls" },
    { import = "plugins.extras.neotest" },
    { import = "plugins.extras.dap" },
    { import = "plugins.extras.dadbod" },
    { import = "plugins.extras.neorg" },
    -- { import = "plugins.extras.org" },
    { import = "plugins.extras.leetcode" },
    { import = "plugins.extras.devdocs" },
    { import = "plugins.extras.zen" },

    -- language
    { import = "plugins.extras.lang.go" },
    { import = "plugins.extras.lang.python" },
    { import = "plugins.extras.lang.tailwind" },
    -- { import = "plugins.extras.lang.java" },
    { import = "plugins.extras.lang.typescript" },
    { import = "plugins.extras.lang.docker" },
    { import = "plugins.extras.lang.tex" },
    { import = "plugins.extras.lang.clang" },
    { import = "plugins.extras.lang.rust" },
    -- { import = "plugins.extras.lang.terraform" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "nordic", "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
