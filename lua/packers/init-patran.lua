local pantran = require("pantran")
-- vim.keymap.set("n", "<leader>tr", pantran.motion_translate, opts)
-- vim.keymap.set("n", "<leader>trr", function()
-- 	return pantran.motion_translate() .. "_"
-- end, opts)

pantran.setup({
	default_engine = "argos",
	engines = {
		argos = {
			-- Default languages can be defined on a per engine basis. In this case
			-- `:lua require("pantran.async").run(function()
			-- vim.pretty_print(require("pantran.engines").yandex:languages()) end)`
			-- can be used to list available language identifiers.
			default_source = "auto",
			default_target = "zh",
		},
	},
})
