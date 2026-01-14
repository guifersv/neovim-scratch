return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local nvimtree = require "nvim-tree"

    local function on_attach(bufnr)
      local api = require "nvim-tree.api"

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))

      api.config.mappings.default_on_attach(bufnr)
    end

    nvimtree.setup({
      hijack_cursor = true,
      view = {
        width = 30,
        relativenumber = true,
        side = "right",
      },
      renderer = {
        indent_markers = {
          enable = false,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed  = "",
              arrow_open    = "",
              default       = "󰉋",
              open          = "󰝰",
              empty         = "󰉖",
              empty_open    = "󰷏",
              symlink       = "󰉒",
              symlink_open  = "󰉒",
            },
            git = {
              unstaged  = "󰄱",
              staged    = "󰄵",
              unmerged  = "󰘬",
              renamed   = "󰁔",
              untracked = "󰞋",
              deleted   = "󰆴",
              ignored   = "󰈉",
            },
          },
        },
      },
      filters = {
        dotfiles = true,
      },
      on_attach = on_attach,
    })
  end
}
