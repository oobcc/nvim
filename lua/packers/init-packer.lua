return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("olimorris/onedarkpro.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("nvim-treesitter/nvim-treesitter")
	use("sainnhe/everforest")
	use("folke/tokyonight.nvim")
	use("navarasu/onedark.nvim")

	use({
		"ojroques/nvim-hardline",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use("hrsh7th/cmp-nvim-lsp-signature-help")

	use({
		"rafamadriz/friendly-snippets",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	})
	use("L3MON4D3/LuaSnip") -- Snippets plugin

	use("hrsh7th/cmp-path")
	--use("ray-x/lsp_signature.nvim")
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
			local status, cmp = pcall(require, "cmp")
			if not status then
				vim.cmd([[packadd nvim-cmp]])
				cmp = require("cmp")
			end
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
		end,
	})

	-- rust
	use("simrat39/rust-tools.nvim")

	-- Debugging
	use("nvim-lua/plenary.nvim")
	use("mfussenegger/nvim-dap")

	use({
		"noib3/nvim-cokeline",
		requires = "kyazdani42/nvim-web-devicons", -- If you want devicons
		config = function()
			require("cokeline").setup()
		end,
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})
	use("numToStr/Comment.nvim")
	use({
		"ethanholz/nvim-lastplace",
		config = function()
			require("nvim-lastplace").setup()
		end,
	})

	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({

				autotag = {
					enable = true,
				},
			})
		end,
	})
	use("folke/lua-dev.nvim")

	-- ui
	use("stevearc/dressing.nvim")

	use({
		"yamatsum/nvim-cursorline",
		config = function()
			require("nvim-cursorline").setup({
				cursorline = {
					enable = true,
					timeout = 1000,
					number = false,
				},
				cursorword = {
					enable = true,
					min_length = 3,
					hl = { underline = true },
				},
			})
		end,
	})
	use({
		"kosayoda/nvim-lightbulb",
		requires = "antoinemadec/FixCursorHold.nvim",
		config = function()
			require("nvim-lightbulb").setup({ autocmd = { enabled = true } })
		end,
	})

	use("rcarriga/nvim-notify")

	-- use({
	-- 	"j-hui/fidget.nvim",
	-- 	config = function()
	-- 		require("fidget").setup({})
	-- 	end,
	-- })

	use("numToStr/FTerm.nvim")

	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})
	use({
		"machakann/vim-highlightedyank",
		config = function()
			vim.g.highlightedyank_highlight_duration = 500
			vim.g.highlightedyank_highlight_in_visual = 0
			vim.cmd("highlight HighlightedyankRegion cterm=reverse gui=reverse")
		end,
	})
	use("jose-elias-alvarez/null-ls.nvim")
	use({
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup({
				enabled = true, -- enable this plugin (the default)
				enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
				highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
				highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
				show_stop_reason = true, -- show stop reason when stopped for exceptions
				commented = false, -- prefix virtual text with comment string
				only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
				all_references = false, -- show virtual text on all all references of the variable (not only definitions)
				filter_references_pattern = "<module", -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
				-- experimental features:
				virt_text_pos = "eol", -- position of virtual text, see `:h nvim_buf_set_extmark()`
				all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
				virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
				virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
				-- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
			})
		end,
	})
	use("rcarriga/nvim-dap-ui")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("mfussenegger/nvim-jdtls")
	use({
		"ziontee113/icon-picker.nvim",
		config = function()
			require("icon-picker").setup({
				disable_legacy_commands = true,
			})
		end,
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				-- for example, context is off by default, use this to turn it on
				show_current_context = true,
				show_current_context_start = true,
			})
		end,
	})
	use("RRethy/vim-illuminate")
	use({
		"SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-gps").setup()
		end,
	})
	use("potamides/pantran.nvim")
	use({
		"arkav/lualine-lsp-progress",
		config = function()
			require("lualine").setup({
				sections = {
					lualine_c = {
						"lsp_progress",
					},
				},
			})
		end,
	})
	--use({ "glepnir/dashboard-nvim" })
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({ "kevinhwang91/nvim-bqf" })
	use({ "jbyuki/one-small-step-for-vimkind" })
	use({ "rainbowhxch/accelerated-jk.nvim" })
	use({ "amaomaoa/md5.lua", "amaomaoa/fy", "amaomaoa/json.lua" })

	use({
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient")
		end,
	})
	use({
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})
end)
