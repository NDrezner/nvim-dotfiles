return {
	"tpope/vim-fugitive",
	cmd = { "Git", "G", "Gdiffsplit", "Gread", "Gwrite", "Gblame" },
	keyd = {
		{ "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
	},
}
