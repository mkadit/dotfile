-- vim.cmd('packadd packer.nvim')
local packer = require "packer"
local use = packer.use

packer.init { display = { open_cmd = "leftabove 80vnew [packer]" } }

packer.startup {
    function()
        use "wbthomason/packer.nvim"

        -- Telescope
        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                "nvim-lua/popup.nvim",
                "nvim-lua/plenary.nvim",
                "nvim-telescope/telescope-fzy-native.nvim",
                "nvim-telescope/telescope-media-files.nvim",
            },
        }

        -- nvim-lsp
        use { "neovim/nvim-lspconfig" }
        use { "mfussenegger/nvim-jdtls" }
        use { "jose-elias-alvarez/nvim-lsp-ts-utils" }
        use { "JoosepAlviste/nvim-ts-context-commentstring" }
        use "williamboman/nvim-lsp-installer"
        use "jose-elias-alvarez/null-ls.nvim"
        use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }
        use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }

        use {
            "hrsh7th/nvim-cmp",
            requires = {
                "kristijanhusak/vim-dadbod-completion",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-vsnip",
                "hrsh7th/vim-vsnip",
                "kdheepak/cmp-latex-symbols",
                "saadparwaiz1/cmp_luasnip",
                "L3MON4D3/LuaSnip",
                "onsails/lspkind-nvim",
            },
        }

        -- debugger
        use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

        -- docker
        use { "skanehira/denops-docker.vim", requires = { "vim-denops/denops.vim" } }

        -- lsp extension
        use "simrat39/rust-tools.nvim"

        -- autopair
        use "windwp/nvim-autopairs"
        -- use 'windwp/nvim-ts-autotag'
        -- use 'AndrewRadev/tagalong.vim'

        -- markdown
        use "junegunn/vim-easy-align"
        use "plasticboy/vim-markdown"

        -- Comments
        use "b3nj5m1n/kommentary"

        -- treesitter
        use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

        -- Git
        use "tpope/vim-fugitive"
        use "tpope/vim-rhubarb"
        use "shumphrey/fugitive-gitlab.vim"
        use "rbong/vim-flog"
        use "TimUntersberger/neogit"
        use "sindrets/diffview.nvim"

        -- Gist
        use { "mattn/vim-gist", requires = { "mattn/webapi-vim" } }

        -- Better quickfix
        use "kevinhwang91/nvim-bqf"

        -- Text Objects
        use "tpope/vim-surround"
        use "wellle/targets.vim"

        -- tpope enhancement
        use "tpope/vim-repeat"
        use "tpope/vim-unimpaired"

        -- File Manager
        use "vifm/vifm.vim"

        -- Useful things
        -- use "folke/zen-mode.nvim"
        use "Pocco81/TrueZen.nvim"

        -- formatter
        use "sbdchd/neoformat"
        -- use "mhartington/formatter.nvim"

        -- tree explorer
        use {
            "kyazdani42/nvim-tree.lua",
            requires = { "kyazdani42/nvim-web-devicons" },
        }

        -- Aesthetics
        use {
            "NTBBloodbath/galaxyline.nvim",
            requires = "kyazdani42/nvim-web-devicons",
        }

        -- use "romgrk/barbar.nvim"
        -- use "nanozuki/tabby.nvim"
        use "noib3/nvim-cokeline"
        use "liuchengxu/vista.vim"
        use "lambdalisue/nerdfont.vim"
        use "RRethy/nvim-base16"
        use "sainnhe/sonokai"

        -- Colorizer
        use "norcalli/nvim-colorizer.lua"

        -- Session and startpage
        use "mhinz/vim-startify"

        -- Reminder keymap
        use "folke/which-key.nvim"

        -- emmet
        use "mattn/emmet-vim"

        -- undotree
        use "mbbill/undotree"

        -- database
        use { "kristijanhusak/vim-dadbod-ui", requires = { "tpope/vim-dadbod" } }

        -- documentation
        use { "kkoomen/vim-doge", run = ":call doge#install()" }

        -- rooter
        use "airblade/vim-rooter"

        -- etc
        use "dstein64/vim-startuptime"
        use "lambdalisue/suda.vim"
        use "RishabhRD/popfix"
        use "RishabhRD/nvim-cheat.sh"
        use "famiu/nvim-reload"
        use {
            "NTBBloodbath/rest.nvim",
            requires = { "nvim-lua/plenary.nvim" },
        }
        use "kwkarlwang/bufresize.nvim"

        -- TODO: Remove impatent after neovim/pull/15436 merged
        use "lewis6991/impatient.nvim"
    end,
    config = {
        compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    },
}

return packer
