local breadcrumbs = require "breadcrumbs"
-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "everblush",

  hl_override = {
  	Comment = { italic = true },
  	["@comment"] = { italic = true },
    NvimTreeCursorLine = { bg = "#262626" },
  },
}

M.ui = {
  winbar={
    breadcrumbs=true
  },
  tabufline = {
    enabled=false
  },
  telescope = {
    style = "bordered",
  },
  statusline = {
    theme = "default",
    separator_style = "round", -- default, round, block, arrow
  },
  cmp = {
    lspkind_text = true,
    style = "flat_dark", -- default/flat_light/flat_dark/atom/atom_colored     
  },
}
M.lsp = {
  signature = true,
}

M.nvdash = {
     load_on_startup = true, 
     header = {
         "  ░██████  ░██    ░██ ",
         " ░██   ░██ ░██    ░██ ",
         "░██        ░██    ░██ ",
         "░██        ░██    ░██ ",
         "░██         ░██  ░██  ",
         " ░██   ░██   ░██░██   ",
         "  ░██████     ░███    ",
         "                      ",
     },
}

return M

