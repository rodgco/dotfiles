require("obsidian").setup({
	workspaces = {
		{
			name = "zettel",
			path = "~/Obsidian/zettel",
		},
	},
	daily_notes = {
		folder = "Notes",
		date_format = "%Y-%m-%d",
		template = "Daily Note",
	},
	new_notes_location = "Notes",
	templates = {
		subdir = "Templates",
		date_format = "%Y-%m-%d",
		time_format = "%H:%M",
		-- A map for custom variables, the key should be the variable and the value a function
		substitutions = {},
	},
})
