-- 📦 Bootstrap Lazy.nvim (Plugin Manager)
-- If Lazy.nvim is not found, clone it from the official GitHub repository
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- Use the latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath) -- Prepend lazy.nvim to runtime path

-- ⚙️ Basic options setup (e.g. tab width, line numbers, etc.)
require("vim-options")

-- 🔌 Load all plugins listed in lua/plugins/*
-- "plugins" is a module or directory passed to lazy.setup
require("lazy").setup("plugins", {})
