return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local function attach(bufnr)
			vim.g.tree_initial_cwd = vim.fn.getcwd()
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			--
			vim.keymap.set("n", "_", function()
				api.tree.change_root(vim.g.tree_initial_cwd)
			end, opts("Reset to CWD"))
		end

		require("nvim-tree").setup({
			on_attach = attach,
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 50,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
		})

		vim.keymap.set("n", "\\\\", "<Cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
	end,
}
