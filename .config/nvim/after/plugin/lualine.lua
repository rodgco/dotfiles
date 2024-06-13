require('lualine').setup({
	options = {
		theme = 'catppuccin-mocha',
		section_separators = '|',
		component_separators = ''
	},
	extensions = { 'fugitive', 'trouble' },
	sections = {
		lualine_a = {
			'mode',
		},
		lualine_b = {
			{
				'filetype',
				color = { fg = '#ffffff', gui = 'bold' },
			},
			{
				'filename',
				file_status = true,
				path = 4,
				color = { gui = 'bold' },
				symbols = {
					modified = '[+]',      -- Text to show when the file is modified.
					readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
					unnamed = '', -- Text to show for unnamed buffers.
					newfile = '[New]',     -- Text to show for newly created file before first write
				}
			},
		},
		lualine_c = {
			{
				'branch',
				icon = '',
				color = { fg = '#ffffff', gui = 'bold' },
			},
			{
				'diff',
				colored = true,
				symbols = {
					added = '+',
					modified = '~',
					removed = '-',
				},
				color_added = '#00ff00',
				color_modified = '#ffff00',
				color_removed = '#ff0000',
			},
			{
				'diagnostics',
				sources = { 'nvim_lsp' },
				symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
				color_error = '#ff0000',
				color_warn = '#ff8800',
				color_info = '#00ff00',
				color_hint = '#00ffff',
			},
		},
		lualine_x = {
			{
				'encoding',
				color = { gui = 'bold' },
			},
			{
				'fileformat',
				color = { fg = '#ffffff', gui = 'bold' },
			},
		},
		lualine_y = {
			{
				'progress',
				color = { gui = 'bold' },
			},
		},
		lualine_z = {
			{
				'location',
				color = { fg = '#000000', gui = 'bold' },
			},
		},
	},
	tabline = {
		lualine_a = {
			{
				'buffers',
				mode = 4,
			},
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	}
})
