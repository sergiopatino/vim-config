return {

	-- Accerelated-jk plugin
	{
		"rainbowhxch/accelerated-jk.nvim",
		lazy = false,
	},

	-- Change bufferline options
	{
		"akinsho/bufferline.nvim",
		highlights = {
			tab = {
				fg = '#707880', -- comment: muted inactive text
				bg = '#282a2e', -- line: slightly raised bg for inactive tabs
			},
			tab_selected = {
				fg = '#c5c8c6', -- foreground: bright text for active tab
				bg = '#1d1f21', -- background: drops into the editor
			},
			tab_separator = {
				fg = '#1d1f21', -- background: blend separator with editor
				bg = '#282a2e', -- line: matches inactive tab bg
			},
			tab_separator_selected = {
				fg = '#282a2e', -- line: transition from inactive to selected
				bg = '#1d1f21', -- background: matches selected tab
				sp = '#81a2be', -- blue: underline accent
				underline = '#7c1b0e',
			},
		},
		opts = {
			options = {
				indicator = {
					style = "underline",
					--icon = "▎",
				},
				--show_tab_indicators = true,
				style_preset = "minimal",
				separator_style = "thin",
				themable = true,
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
			},
		},
	},
}
