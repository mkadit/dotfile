vim.cmd [[ packadd vim-jetpack ]]
-- vim.g["jetpack#optimization"] = 1

local jetpack = require "jetpack"
jetpack.setup {
  { "tani/vim-jetpack", opt = true },
  { "dstein64/vim-startuptime", opt = true },

  -- Interface
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "Pocco81/TrueZen.nvim",
  "kyazdani42/nvim-web-devicons",
  "nanozuki/tabby.nvim",
  "RRethy/nvim-base16",
  "ThemerCorp/themer.lua",
  "folke/which-key.nvim",
  "kwkarlwang/bufresize.nvim",
  "RishabhRD/popfix",
  "lewis6991/gitsigns.nvim",
  "j-hui/fidget.nvim",

  -- Telescope
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-fzy-native.nvim",
  -- "nvim-telescope/telescope-media-files.nvim",

  -- LSP
  "neovim/nvim-lspconfig",
  "jose-elias-alvarez/null-ls.nvim",
  "williamboman/nvim-lsp-installer",
  --- LSP extension (specific language)
  "mfussenegger/nvim-jdtls",
  -- "jose-elias-alvarez/typescript.nvim",
  -- "JoosepAlviste/nvim-ts-context-commentstring",
  "simrat39/rust-tools.nvim",
  "plasticboy/vim-markdown",
  --- LSP feature enrichment
  "folke/trouble.nvim",
  "folke/todo-comments.nvim",
  "stevearc/aerial.nvim",

  -- Completion
  "hrsh7th/nvim-cmp",
  "kristijanhusak/vim-dadbod-completion",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "kdheepak/cmp-latex-symbols",
  "onsails/lspkind-nvim",

  -- Editor
  "akinsho/toggleterm.nvim",
  "wellle/targets.vim",
  "tpope/vim-repeat",
  "tpope/vim-unimpaired",
  "mhinz/vim-startify",
  "kevinhwang91/nvim-bqf",
  "norcalli/nvim-colorizer.lua",
  "mattn/emmet-vim",
  "mbbill/undotree",
  "NTBBloodbath/rest.nvim",
  "kyazdani42/nvim-tree.lua",
  "junegunn/vim-easy-align",
  "danymat/neogen",
  "ThePrimeagen/harpoon",
  ---mini.nvim
  "echasnovski/mini.nvim",

  -- Treesitter
  "nvim-treesitter/nvim-treesitter",
  "p00f/nvim-ts-rainbow",
  "nvim-treesitter/nvim-treesitter-textobjects",

  -- Git
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "shumphrey/fugitive-gitlab.vim",
  "sindrets/diffview.nvim",
  "mattn/vim-gist",
  "mattn/webapi-vim",

  -- Debugger
  "rcarriga/nvim-dap-ui",
  "mfussenegger/nvim-dap",

  -- Database
  "kristijanhusak/vim-dadbod-ui",
  "tpope/vim-dadbod",

  --ETC
  "vifm/vifm.vim",
  "sbdchd/neoformat",
  "lambdalisue/suda.vim",
  "airblade/vim-rooter",

  -- Neorg
  "nvim-neorg/neorg",
  "esquires/neorg-gtd-project-tags",
  "nvim-neorg/neorg-telescope",
  "max397574/neorg-kanban",
}

-- Make sure to install all dependencies

vim.cmd [[

for name in jetpack#names()
  if !jetpack#tap(name)
    call jetpack#sync()
    break
  endif
endfor

]]
