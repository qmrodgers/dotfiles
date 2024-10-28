return {
	"RutaTang/quicknote.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("quicknote").setup({
			mode = "resident",
			sign = "󱘒",
			filetype = "md",
			git_branch_recognizable = true,
		})

		local checkAndDeleteNoteFile = function(noteFilePath)
			local fs_stat = vim.loop.fs_stat or vim.uv.fs_stat
			fs_stat(noteFilePath, function(err, _)
				if err then
					print("Note not found.")
				else
					-- delete note file
					local success, err = os.remove(noteFilePath)
					if success then
						print("Note deleted.")
					else
						print("Note delete failed: " .. err)
					end
				end
			end)
		end

		unpack = unpack or table.unpack

		function Get_Quicknote_Picker(scope)
			local delete_selected_quicknote = function(prompt_bufnr)
				local entry = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
				if vim.fn.confirm("Permanently delete this note?", "&yes\n&No", 2) ~= 1 then
					return
				end

				-- local match_string = string.gmatch(entry.display, "([^%.]+)") -- Split {NOTE_NAME}.md by "."
				-- local note = match_string() -- First match of iterator is the note name
				--
				-- require("quicknote").DeleteNoteAtGlobal()
				-- vim.fn.feedkeys(note .. "<CR>")
				vim.g.last_deleted_note = entry
				checkAndDeleteNoteFile(entry.value)
				require("telescope.actions").close(prompt_bufnr)
				vim.defer_fn(function()
					Get_Quicknote_Picker(scope)
				end, 50)
			end

			local opts = {
				scope = scope,
				attach_mappings = function(_, map)
					map("i", "<c-d>", delete_selected_quicknote)
					return true
				end,
			}

			require("telescope").extensions.quicknote.quicknote(opts)
		end

		-- NEW NOTE
		vim.keymap.set("n", "gng", ":lua require('quicknote').NewNoteAtGlobal()<cr>", { desc = "New Note (Global)" })
		vim.keymap.set(
			"n",
			"gnl",
			":lua require('quicknote').NewNoteAtCurrentLine()<cr>",
			{ desc = "New Note (Current Line)" }
		)
		vim.keymap.set("n", "gnc", ":lua require('quicknote').NewNoteAtCWD()<cr>", { desc = "New Note (CWD)" })

		-- DELETE NOTE
		vim.keymap.set(
			"n",
			"gndg",
			":lua require('quicknote').DeleteNoteAtGlobal()<cr>",
			{ desc = "Delete Note (Global)" }
		)
		vim.keymap.set(
			"n",
			"gndl",
			":lua require('quicknote').DeleteNoteAtCurrentLine()<cr>",
			{ desc = "Delete Note (Current Line)" }
		)
		vim.keymap.set("n", "gndc", ":lua require('quicknote').DeleteNoteAtCWD()<cr>", { desc = "Delete Note (CWD)" })

		-- JUMP TO NOTES
		vim.keymap.set(
			"n",
			"gN",
			":lua require('quicknote').OpenNoteAtCurrentLine()<cr>",
			{ desc = "Open Note at Current Line" }
		)

		vim.keymap.set(
			"n",
			"<leader>nn",
			":lua require('quicknote').JumpToNextNote()<cr>",
			{ desc = "Jump to Next Note" }
		)

		vim.keymap.set(
			"n",
			"<leader>np",
			":lua require('quicknote').JumpToPreviousNote()<cr>",
			{ desc = "Jump to Previous Note" }
		)

		-- SEARCH NOTES
		vim.keymap.set("n", "<leader>ng", function()
			Get_Quicknote_Picker("Global")
		end, { desc = "Telescope Notes (Global)" })

		vim.keymap.set("n", "<leader>nb", function()
			Get_Quicknote_Picker("CurrentBuffer")
		end, { desc = "Telescope Notes (CurrentBuffer)" })

		vim.keymap.set("n", "<leader>nc", function()
			Get_Quicknote_Picker("CWD")
		end, { desc = "Telescope Notes (CWD)" })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
			callback = function(ev)
				require("quicknote").ShowNoteSigns()
			end,
		})
	end,
}
