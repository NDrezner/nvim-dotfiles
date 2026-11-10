return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		local is_tty = vim.env.DISPLAY == nil and vim.env.WAYLAND_DISPLAY == nil

		require("nvim-tree").setup({
			renderer = {
				icons = {
					show = {
						file = not is_tty,
						folder = not is_tty,
						folder_arrow = true,
						git = not is_tty,
					},
					glyphs = is_tty and {
						folder = {
							arrow_closed = ">",
							arrow_open = "v",
						},
					} or nil,
				},
			},
		})
	vim.keymap.set( "n", "<leader>e", "<cmd>NvimTreeToggle<cr>" )
	end,
}
	
