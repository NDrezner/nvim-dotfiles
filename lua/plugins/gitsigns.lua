return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local is_tty = vim.env.Term == "linux"

		require("gitsigns").setup({
			signs = is_tty and {
				add = { text = "+" },
				change = { text = "_" },
				delete = { text = "_" },
				topdelete = { text = "-" },
				changedelete = { text = "~" },
				untracked = { text = "?" },
			} or nil,
			on_attach = function(bufnr)
				local gs = require("gitsigns")
				local function map(lhs, rhs, desc)
					vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
				end

				map("]c", function() gs.nav_hunk("next") end, "Next hunk")
				map("[c", function() gs.nav_hunk("prev") end, "Previous hunk")
				map("<leader>hp", gs.preview_hunk, "Preview hunk")
				map("<leader>hr", gs.reset_hunk, "Reset hunk")
				map("<leader>hb", gs.blame_line, "Blame line")
			end,
		})
	end,
}

