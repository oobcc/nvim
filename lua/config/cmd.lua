local cmd = vim.cmd

cmd("set nobackup")

cmd("set noswapfile")
cmd("colorscheme onedarkpro")
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
