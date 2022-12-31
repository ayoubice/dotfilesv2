
-- NERDTREE
-- vim.g.NERDTreeMinimalUI = 1
-- vim.g.NERDTreeDirArrows = 1
-- vim.g.NERDTreeWinSize = 60

vim.keymap.set("n", "<C-\\>", function ()
				vim.cmd(':NERDTreeToggle')
end)
