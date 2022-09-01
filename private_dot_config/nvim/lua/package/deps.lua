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
  -- LSP Installer
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  --- LSP extension (specific language)
  "mfussenegger/nvim-jdtls",
  -- "jose-elias-alvarez/typescript.nvim",
  -- "JoosepAlviste/nvim-ts-context-commentstring",
  "simrat39/rust-tools.nvim",
  "plasticboy/vim-markdown",
  { "ray-x/go.nvim", ft = "go" },
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
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "kdheepak/cmp-latex-symbols",
  "onsails/lspkind-nvim",

  -- Editor
  "akinsho/toggleterm.nvim",
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
  -- Testing
  "nvim-neotest/neotest",
  "nvim-neotest/neotest-python",
  "nvim-neotest/neotest-go",
  "nvim-neotest/neotest-vim-test",
  "vim-test/vim-test",
  -- better folding
  "kevinhwang91/nvim-ufo",
  "kevinhwang91/promise-async",
  ---mini.nvim
  "echasnovski/mini.nvim",
  -- "b3nj5m1n/kommentary",

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
  "ThePrimeagen/git-worktree.nvim",

  -- Debugger
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "theHamsta/nvim-dap-virtual-text",
  "leoluz/nvim-dap-go",

  -- Database
  "kristijanhusak/vim-dadbod-ui",
  "tpope/vim-dadbod",

  --ETC
  "vifm/vifm.vim",
  "sbdchd/neoformat",
  "lambdalisue/suda.vim",
  "airblade/vim-rooter",
  "antoinemadec/FixCursorHold.nvim",
  "nathom/filetype.nvim",
  "potamides/pantran.nvim",

  -- Neorg
  "nvim-neorg/neorg",
  "esquires/neorg-gtd-project-tags",
  "nvim-neorg/neorg-telescope",
  "max397574/neorg-kanban",
}

-- Make sure to install all dependencies
-- vim.o.runtimepath= '~/.local/share/nvim/site/pack/jetpack/src/himalaya/vim'
-- " runtime path for himalaya plugin
-- let &runtimepath.=','.'~/.local/share/nvim/site/pack/jetpack/src/himalaya/vim'

vim.cmd [[

for name in jetpack#names()
  if !jetpack#tap(name)
    call jetpack#sync()
    break
  endif
endfor

]]
