 return {
   "nvim-treesitter/nvim-treesitter",
   lazy = false,
   branch = "master",
   event = { "BufReadPost", "BufNewFile" },
   cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
   build = ":TSUpdate",
   config = function(_, opts)
     require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "query",
        "regex",
        "toml",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
	"rust"
      },
       highlight = {
         enable = true,
         use_languagetree = true,
       },
       indent = { enable = true },
       folds = { enable = true },
     }
   end,
 }
