local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<Leader>g", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<Leader>g", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, opts)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

-- if you want to set up formatting on save, you can use this as a callback
-- add to your shared on_attach callback
local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
	lspconfig[server].setup({
		on_attach = on_attach,
	})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").html.setup({
	capabilities = capabilities,
})

require("lspconfig").cssls.setup({
	capabilities = capabilities,
})
