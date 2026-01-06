return {

	{
		"nvim-treesitter/nvim-treesitter",
			lazy = false,
			build = ":TSUpdate",
			config = function()
				require("nvim-treesitter.configs").setup {
					ensure_installed = { 
						"lua",
						"gitignore",
						"python",
						"javascript",
						"typescript",
						"bash",
						"java",
						"css",
						"html",
					},

					highlight = {
						enable = true
					},

					textobjects = {
						enable = true
					}
				}
		end
	}

}
