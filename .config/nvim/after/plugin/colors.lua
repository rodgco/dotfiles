function ColorMyPencils(color)
	color = color or "gruvbox"

    if (color == "OceanicNext") then
        vim.g.oceanic_next_terminal_bold = 1
        vim.g.oceanic_next_terminal_italic = 1
    end

    require("gruvbox-baby.ts-fix")
	vim.cmd('colorscheme ' .. color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
