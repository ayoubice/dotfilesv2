-- NERDTREE
-- vim.g.NERDTreeMinimalUI = 1
-- vim.g.NERDTreeDirArrows = 1
-- vim.g.NERDTreeWinSize = 60

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

local tree_ok, tree = pcall(require, "nvim-tree")
if not tree_ok then
    return
end

tree.setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

vim.keymap.set("n", "<C-\\>", function()
    vim.cmd(':NvimTreeToggle')
end)
