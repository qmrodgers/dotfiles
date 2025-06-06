return {
	"ziontee113/color-picker.nvim",
	config = function()
		local wk = require("which-key")
		wk.add({
			{
				"<C-c>",
				"<cmd>PickColor<cr>",
				desc = "Pick Color",
				icon = "",
				mode = "n",
				noremap = true,
				silent = true,
			},
			-- {
			-- 	"<C-c>",
			-- 	"<cmd>PickColorInsert<cr>",
			-- 	desc = "Pick Color & Insert",
			-- 	icon = "",
			-- 	mode = "i",
			-- 	noremap = true,
			-- 	silent = true,
			-- },
		})

    -- #2f4b83
		-- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandRGB<cr>", opts)
		-- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandHSL<cr>", opts)

		require("color-picker").setup({ -- for changing icons & mappings
			["icons"] = { "◼️", "󰏫" },
			["border"] = "rounded", -- none | single | double | rounded | solid | shadow
			["keymap"] = { -- mapping example:
				["U"] = "<Plug>ColorPickerSlider5Decrease",
				["O"] = "<Plug>ColorPickerSlider5Increase",
			},
			["background_highlight_group"] = "Normal", -- default
			["border_highlight_group"] = "FloatBorder", -- default
			["text_highlight_group"] = "Normal", --default
		})

		vim.cmd([[hi FloatBorder guibg=NONE]]) -- if you don't want weird border background colors around the popup.
	end,
}
