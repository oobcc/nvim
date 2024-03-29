local cmd = vim.cmd
--vim.opt.termguicolors = true
cmd("set nobackup")

-- cmd("set background=dark")
cmd("set t_Co=256")
cmd("set noswapfile")
vim.g.everforest_background = "medium"
vim.g.everforest_better_performance = 1
cmd("colorscheme nord")
-- cmd("set foldcolumn=3")

-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	callback = function()
-- 		vim.lsp.buf.formatting()
-- 	end,
-- })
--
vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = function()
		if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
			vim.cmd("quit")
		end
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format()
	end,
})
