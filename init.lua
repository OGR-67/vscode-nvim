-- Lazy plugin manager pre-config
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({{"Failed to clone lazy.nvim:\n", "ErrorMsg"}, {out, "WarningMsg"},
                           {"\nPress any key to exit..."}}, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Vim opt
vim.opt.clipboard = "unnamedplus" -- clipboard sync
-- case sensivity on search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Plugins
require("lazy").setup({
    spec = { -- Install pluggins here
    "tpope/vim-surround", "tpope/vim-repeat"},
    install = {
        colorscheme = {"habamax"}
    },
    checker = {
        enabled = true
    }
})

-- Leader key shortcuts
vim.cmd("nmap <leader>c :e ~/.config/nvim/init.lua<cr>") -- open init.lua config file
vim.cmd("nmap <leader>s :w<cr>") -- better save file command
vim.cmd("nmap <leader>xd <Cmd>lua require('vscode').action('clipboard-manager.history.clear')<CR>") -- clear clipboard history
vim.cmd("nmap <leader>xh <Cmd>lua require('vscode').action('clipboard-manager.editor.pickAndPaste')<CR>") -- pick and paste from history

-- Avoid unfold on navigation
vim.cmd("nmap j gj")
vim.cmd("nmap k gk")

-- Vim keymap
vim.keymap.set("v", "p", "P") -- avoid clipboard replacement when parsing on visual mode
vim.keymap.set("n", "U", "<C-r>") -- Better redo keymap
vim.keymap.set("n", "<Esc>", ":nohlsearch<cr>") -- Escape to disable search highlighting
vim.keymap.set("n", "m", "@") -- Use "m" to replay macros

-- Pre-enregistrer la macro dans le registre m
vim.cmd('let @m = "viwP"')
