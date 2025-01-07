-- Session Manager

return {
	"olimorris/persisted.nvim",
	lazy = false, -- make sure the plugin is always loaded at startup
	config = function()
		require("persisted").setup({
			autoload = true,
		})
		require("telescope").load_extension("persisted")
		vim.keymap.set("n", "<leader>gPl", "<cmd>SessionToggle<CR>", { desc = "Load Persisted Session" })
		vim.keymap.set("n", "<leader>gPs", "<cmd>SessionSave<CR>", { desc = "Save Persisted Session" })
		vim.keymap.set("n", "<leader>fS", "<cmd>Telescope persisted<CR>", { desc = "Load Session with Picker" })
	end,
}
