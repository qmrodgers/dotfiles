return {
	"cbochs/grapple.nvim",
	opts = {
		scope = "git", -- also try out "git_branch"
		icons = false, -- setting to "true" requires "nvim-web-devicons"
		status = false,
	},
	keys = {
		{ "<leader>aG", "<cmd>Grapple toggle<cr>", desc = "Tag a file (Add to Grapple)" },
		{ "<leader>ag", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle Grapple Menu" },

		{ "<leader>1", "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
		{ "<leader>2", "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
		{ "<leader>3", "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
		{ "<leader>4", "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },
		{ "<leader>5", "<cmd>Grapple select index=5<cr>", desc = "Select fifth tag" },
		{ "<leader>6", "<cmd>Grapple select index=6<cr>", desc = "Select sixth tag" },
		{ "<leader>7", "<cmd>Grapple select index=7<cr>", desc = "Select seventh tag" },
		{ "<leader>8", "<cmd>Grapple select index=8<cr>", desc = "Select eighth tag" },
		{ "<leader>9", "<cmd>Grapple select index=9<cr>", desc = "Select nineth tag" },
		{ "<leader>0", "<cmd>Grapple select index=0<cr>", desc = "Select tenth tag" },

		{ "<c-s-n>", "<cmd>Grapple cycle_tags next<cr>", desc = "Go to next tag" },
		{ "<c-s-p>", "<cmd>Grapple cycle_tags prev<cr>", desc = "Go to previous tag" },
	},
}
