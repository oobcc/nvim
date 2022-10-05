local wk = require("which-key")
-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

-- all of the mappings below are equivalent

-- method 2
--
local fy = require("fy")
local pantran = require("pantran")

fy.setup({
	appid = "20190129000260128",
	keys = "QfFOhDlVbHwLZr79po4o",
})

local function printPath()
	print(vim.api.nvim_buf_get_name(0))
end

wk.register({
	["<leader>"] = {
		p = {
			p = { printPath, "printPath" },
		},
		f = {
			name = "telescope + fy",
			f = { "<cmd>Telescope find_files<cr>", "Find File" },
			r = { "<cmd>Telescope live_grep<cr>", "Find File By Word" },
			n = { "<cmd>Telescope buffers<cr>", "Find File By buffers" },
			y = { fy.translation, "fy" },
		},
		T = { '<CMD>lua require("FTerm").toggle()<CR>', "open term" },
		t = {
			name = "tree",
			r = {
				"<cmd>NvimTreeToggle<CR>",
				"open tree",
			},
		},
	},
})

wk.register({
	["<leader>"] = {
		T = { '<CMD>lua require("FTerm").toggle()<CR>', "open term" },
	},
}, {
	mode = "t", -- NORMAL mode
})

-- wk.register({
-- 	j = { "<Plug>(accelerated_jk_gj)" },
-- 	k = { "<Plug>(accelerated_jk_gj)" },
-- 	h = { "<Plug>(accelerated_jk_gj)" },
-- 	l = { "<Plug>(accelerated_jk_gj)" },
-- })

--wk.register({
--	["<leader>"] = {
--		t = {
--			name = "translate",
--			e = { pantran.motion_translate, "translate" },
--		},
--	},
--}, {
--	mode = "x",
--})
