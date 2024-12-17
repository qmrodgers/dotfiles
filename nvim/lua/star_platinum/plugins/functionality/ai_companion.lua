local prefix = "<leader>a"
local user = vim.env.USER or "User"

vim.api.nvim_create_autocmd("User", {
	pattern = "CodeCompanionChatAdapter",
	callback = function(args)
		if args.data.adapter == nil or vim.tbl_isempty(args.data) then
			return
		end
		vim.g.llm_name = args.data.adapter.name
	end,
})
local config = {
	{
		"olimorris/codecompanion.nvim",
		cmd = {
			"CodeCompanion",
			"CodeCompanionActions",
			"CodeCompanionToggle",
			"CodeCompanionAdd",
			"CodeCompanionChat",
		},
		opts = {
			strategies = {
				chat = {
					adapter = "copilot",
					roles = {
						llm = "  CodeCompanion",
						user = " " .. user:sub(1, 1):upper() .. user:sub(2),
					},
					keymaps = {
						close = { modes = { n = "q", i = "<C-e>" } },
						stop = { modes = { n = "<C-c>" } },
					},
				},
				inline = { adapter = "copilot" },
				agent = { adapter = "copilot" },
			},
			display = {
				chat = {
					show_settings = true,
					render_headers = false,
				},
			},
		},
		keys = {
			{ prefix .. "a", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "Action Palette" },
			{ prefix .. "c", "<cmd>CodeCompanionChat<cr>", mode = { "n", "v" }, desc = "New Chat" },
			{ prefix .. "A", "<cmd>CodeCompanionAdd<cr>", mode = "v", desc = "Add Code" },
			{ prefix .. "i", "<cmd>CodeCompanion<cr>", mode = "n", desc = "Inline Prompt" },
			{ prefix .. "C", "<cmd>CodeCompanionToggle<cr>", mode = "n", desc = "Toggle Chat" },
		},
	},
}
if vim.fn.has("win32") == 1 then
else
	local prefix = "<leader>a"
	local user = vim.env.USER or "User"

	vim.api.nvim_create_autocmd("User", {
		pattern = "CodeCompanionChatAdapter",
		callback = function(args)
			if args.data.adapter == nil or vim.tbl_isempty(args.data) then
				return
			end
			vim.g.llm_name = args.data.adapter.name
		end,
	})
end
return config