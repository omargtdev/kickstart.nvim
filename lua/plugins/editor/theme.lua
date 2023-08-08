return {

	{
		-- Theme
		'projekt0n/github-nvim-theme',
		lazy = false,
		priority = 1000,
		config = function()
			require('github-theme').setup({
				-- ...
			})

			vim.cmd('colorscheme github_dark_dimmed')
		end
	},

	{
		-- Set lualine as statusline
		'nvim-lualine/lualine.nvim',
		-- See `:help lualine.txt`
		opts = {
			options = {
				icons_enabled = false,
				theme = 'github_dark_dimmed',
				component_separators = '|',
				section_separators = '',
			},
		},
	}

}
