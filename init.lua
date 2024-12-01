-- Lazy plugin manager pre-config local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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
vim.keymap.set("v", "<Space>", "<Nop>", {
    noremap = true
})

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

vim.cmd("nmap <leader>rw <Cmd>lua require('vscode').action('workbench.action.reloadWindow')<CR>") -- Reload Window

vim.cmd("nmap <leader>zm <Cmd>lua require('vscode').action('workbench.action.toggleZenMode')<CR>") -- Zen Mode

vim.cmd("nmap <leader>cc :e ~/.config/nvim/init.lua<cr>") -- open init.lua config file

vim.cmd("nmap <leader><leader> <Cmd>lua require('vscode').action('editor.action.formatDocument')<CR>") -- Format Document

-- Tabs
vim.cmd("nmap <leader>ww <Cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<CR>") -- close tab
vim.cmd("nmap <leader>pp <Cmd>lua require('vscode').action('workbench.action.previousEditor')<CR>") -- Previous Tab
vim.cmd("nmap ˙  <Cmd>lua require('vscode').action('workbench.action.previousEditor')<CR>") -- Previous Tab
vim.cmd("nmap >nn <Cmd>lua require('vscode').action('workbench.action.nextEditor')<CR>") -- next Tab
vim.cmd("nmap ¬ <Cmd>lua require('vscode').action('workbench.action.nextEditor')<CR>") -- next Tab

-- Fold
vim.cmd("nmap <leader>zz <Cmd>lua require('vscode').action('editor.toggleFold')<CR>") -- Toggle Fold
vim.cmd("nmap <leader>za <Cmd>lua require('vscode').action('editor.unfoldAll')<CR>") -- Toggle All Fold

-- Code Navigation
vim.cmd("nmap <leader>en <Cmd>lua require('vscode').action('editor.action.marker.nextInFiles')<CR>") -- Go to Next Problem
vim.cmd("nmap <leader>ep <Cmd>lua require('vscode').action('editor.action.marker.prevInFiles')<CR>") -- Go to Previous Problem

vim.cmd("nmap <leader>uu <Cmd>lua require('vscode').action('editor.action.referenceSearch.trigger')<CR>") -- Go to References
vim.cmd("nmap <leader>gl <Cmd>lua require('vscode').action('workbench.action.gotoLine')<CR>") -- Go to Line

vim.cmd("nmap <leader>so <Cmd>lua require('vscode').action('outline.focus')<CR>") -- Go to Outline
vim.cmd("nmap <leader>ss <Cmd>lua require('vscode').action('workbench.action.gotoSymbol')<CR>") -- Search Symbol

vim.cmd("nmap <leader>ff <Cmd>lua require('vscode').action('workbench.action.findInFiles')<CR>") -- Search In Files
vim.cmd("nmap <leader>fr <Cmd>lua require('vscode').action('workbench.action.replaceInFiles')<CR>") -- Search In Files

vim.cmd("nmap <leader>h <Cmd>lua require('vscode').action('editor.action.showHover')<CR>") -- Show hover
vim.cmd("nmap <A-S-k> <Cmd>lua require('vscode').action('editor.action.showHover')<CR>") -- Show hover
vim.cmd("nmap <C-S-k> <Cmd>lua require('vscode').action('editor.action.showHover')<CR>") -- Show hover
vim.cmd("nmap  <Cmd>lua require('vscode').action('editor.action.showHover')<CR>") -- Show hover

-- Splits
vim.cmd("nmap <leader>we <Cmd>lua require('vscode').action('workbench.action.minimizeOtherEditors')<CR>"); -- Expand split mode
vim.cmd("nmap <leader>wr <Cmd>lua require('vscode').action('workbench.action.evenEditorWidths')<CR>"); -- Reset split default size

vim.keymap.set("n", "∆", function() -- Alt-J (right alt on windows)
    require('vscode').action('workbench.action.focusPreviousGroup') -- Focus previous split
end, {
    noremap = true,
    silent = true
})

vim.keymap.set("n", "˚", function() -- Alt-K (right alt on windows)
    require('vscode').action('workbench.action.focusNextGroup') -- Focus next split
end, {
    noremap = true,
    silent = true
})

vim.keymap.set("n", "<leader>wv", function()
    require('vscode').action('workbench.action.moveEditorToNextGroup') -- Create vertical split
end, {
    noremap = true,
    silent = true
})
vim.keymap.set("n", "<leader>ww", function()
    require('vscode').action('workbench.action.moveEditorToPreviousGroup') -- Create vertical split
end, {
    noremap = true,
    silent = true
})
vim.keymap.set("n", "<leader>wh", function()
    require('vscode').action('workbench.action.splitEditorToBelowGroup') -- Creae horizontal split
end, {
    noremap = true,
    silent = true
})

-- Refactoring
vim.cmd("nmap <leader>rn <Cmd>lua require('vscode').action('editor.action.rename')<CR>") -- Rename Symbol
vim.cmd("nmap <leader>rr <Cmd>lua require('vscode').action('editor.action.quickFix')<CR>") -- Refactor List
vim.cmd("nmap <leader>sw <Cmd>lua require('vscode').action('surround.with')<CR>") -- Surround extension is needed

-- Lines
vim.cmd("nmap <C-j> <Cmd>lua require('vscode').action('editor.action.moveLinesDownAction')<CR>") -- Move Line Down
vim.cmd("nmap <C-k> <Cmd>lua require('vscode').action('editor.action.moveLinesUpAction')<CR>") -- Move Line Up
vim.cmd("nmap <C-S-j> <Cmd>lua require('vscode').action('editor.action.copyLinesDownAction')<CR>") -- Duplicate Line

-- Previous / Next position
vim.cmd("nmap <S-k> <Cmd>lua require('vscode').action('workbench.action.navigateForward')<CR>")
vim.cmd("nmap <S-j> <Cmd>lua require('vscode').action('workbench.action.navigateBack')<CR>")

-- Avoid unfold on navigation
vim.cmd("nmap j gj")
vim.cmd("nmap k gk")

-- Vim keymap
vim.keymap.set("v", "s", "<Nop>", {
    noremap = true,
    silent = true
}) -- allow surround with in visual mode

vim.keymap.set("v", "p", "P") -- avoid clipboard replacement when parsing on visual mode
vim.keymap.set("n", "U", "<C-r>") -- Better redo keymap
vim.keymap.set("n", "<Esc>", ":nohlsearch<cr>") -- Escape to disable search highlighting
vim.keymap.set("n", "m", "@") -- Use "m" to replay macros

vim.keymap.set("n", "\\", '"_') -- Black whole register

-- Mode normal et visuel combiné
vim.keymap.set({'n', 'v'}, 'W', '[w', {
    noremap = true,
    silent = true
})
vim.keymap.set({'n', 'v'}, 'E', ']e', {
    noremap = true,
    silent = true
})
vim.keymap.set({'n', 'v'}, 'B', '[b', {
    noremap = true,
    silent = true
})
vim.keymap.set({'n', 'v'}, 'ge', ']b', {
    noremap = true,
    silent = true

})

vim.keymap.del("n", "<C-w>")

-- Pre-enregistrer la macro dans le registre m
vim.cmd('let @m = "viwP"')
