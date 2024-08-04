return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<localLeader>l", group = "vimtex" },
      },
    },
  },

  {
    "lervag/vimtex",
    lazy = false, -- lazy-loading will disable inverse search
    config = function()
      vim.api.nvim_create_autocmd({ "FileType" }, {
        group = vim.api.nvim_create_augroup("lazyvim_vimtex_conceal", { clear = true }),
        pattern = { "bib", "tex" },
        callback = function()
          vim.wo.conceallevel = 2
        end,
      })

      vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
      vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
    end,
  },

  -- Correctly setup lspconfig for LaTeX 🚀
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        texlab = {
          keys = {
            { "<Leader>K", "<plug>(vimtex-doc-package)", desc = "Vimtex Docs", silent = true },
          },
        },
        ltex = {

          filetypes = {
            "norg",
            -- "text",
            "gitcommit",
            "markdown",
            "org",
            "rst",
            "rnoweb",
            -- "tex",
            "pandoc",
            "quarto",
            "rmd",
          },
        },
      },
    },
  },
}
