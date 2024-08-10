-- Neovim API aliases
local cmd = vim.cmd
local exec = vim.api.nvim_exec
local fn = vim.fn
local g = vim.g
local opt = vim.opt
-- General configuration
g.mapleader = ";"
-- UI
opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false

opt.termguicolors = false 
vim.cmd.colorscheme "catppuccin-macchiato"
