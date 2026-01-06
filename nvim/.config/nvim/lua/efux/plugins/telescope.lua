return {

	{
		"nvim-telescope/telescope.nvim", tag = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
		},
		config = function()
			require("telescope").setup({
				extensions = {
					fzf = {}
				}
			})

			require("telescope").load_extension("fzf")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>fa", builtin.find_files, {})
			vim.keymap.set("n", "<leader>ff", builtin.git_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		end
	}

}
