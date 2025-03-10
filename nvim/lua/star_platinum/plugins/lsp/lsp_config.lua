return {
	"neovim/nvim-lspconfig",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			opts.desc = "Go to Declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

			opts.desc = "See Code Actions"
			keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

			opts.desc = "Rename Object"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

			opts.desc = "See Code Actions"
			keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

			opts.desc = "Show Line Diagnostics"
			keymap.set("n", "<leader>od", vim.diagnostic.open_float, opts)

			opts.desc = "Go To Previous Diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

			opts.desc = "Go To Next Diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

			opts.desc = "Hover Definition"
			keymap.set("n", "gh", vim.lsp.buf.hover, opts)

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
		end
		local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()
		local inlay_hints = { enabled = true }

		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			inlay_hints = inlay_hints,
		})

		lspconfig["jsonls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			inlay_hints = inlay_hints,
		})

		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			inlay_hints = inlay_hints,
		})

		lspconfig["svelte"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			inlay_hints = inlay_hints,
			filetypes = { "svelte" },
		})

		lspconfig["ts_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			inlay_hints = inlay_hints,
		})

		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
			inlay_hints = inlay_hints,
		})

		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			inlay_hints = inlay_hints,
		})

		lspconfig["rust_analyzer"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "rust", "rs" },
			inlay_hints = inlay_hints,
		})

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			inlay_hints = inlay_hints,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		lspconfig["jsonls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			inlay_hints = inlay_hints,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
