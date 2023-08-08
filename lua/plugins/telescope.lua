return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		-- Fuzzy Finder Algorithm which requires local dependencies to be built.
		-- Only load if `make` is available. Make sure you have the system
		-- requirements installed.
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			-- NOTE: If you are having trouble with this installation,
			--       refer to the README for telescope-fzf-native for more instructions.
			build = 'make',
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
		},
	},
	opts = {
		defaults = {
			mappings = {
				i = {
					['<C-u>'] = false,
					['<C-d>'] = false,
				},
			},
		},
	},
	config = function()
		-- Enable telescope fzf native, if installed
		pcall(require('telescope').load_extension, 'fzf')

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = '[f]ind [f]iles' })
		vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[f]ind [h]elp' })
		vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[f]ind [d]iagnostics' })
		vim.keymap.set('n', '<leader>fo', require('telescope.builtin').oldfiles,
			{ desc = '[f]ind recently [o]pened files' })
		vim.keymap.set("n", "<leader>fG", function()
			if not pcall(builtin.git_files) then
				print("Does not exist a git directory in this project.")
			end
		end, { desc = '[f]ind [G]it files' })
		vim.keymap.set("n", "<leader>fg", function()
			--builtin.grep_string({ search = vim.fn.input("Grep > ") })
			builtin.live_grep()
		end, { desc = '[f]ind with [g]rep' })
		vim.keymap.set('n', '<leader>fb', function()
			-- You can pass additional configuration to telescope to change theme, layout, etc.
			require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
				winblend = 10,
				previewer = false,
			})
		end, { desc = '[f]ind in current [b]uffer' })
	end
}
