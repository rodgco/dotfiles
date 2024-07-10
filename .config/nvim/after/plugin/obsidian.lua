local has_obsidian, obsidian = pcall(require, "obsidian")

if has_obsidian then
	obsidian.setup({
		workspaces = {
			{
				name = os.getenv("OBSIDIAN_WORKSPACE"),
				path = os.getenv("OBSIDIAN_PATH"),
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
end
