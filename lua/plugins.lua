return {

	-- Accerelated-jk plugin
	{
		"rainbowhxch/accelerated-jk.nvim",
		lazy = false,
	},

	-- Waka Time coding tracker plugin
	{
		"wakatime/vim-wakatime",
		lazy = false,
	},

	-- Change bufferline options
	{
		"akinsho/bufferline.nvim",
		highlights = {
			-- tab = {
			--     fg = '<colour-value-here>',
			--     bg = '<colour-value-here>',
			-- },
			-- tab_selected = {
			--     fg = '<colour-value-here>',
			--     bg = '<colour-value-here>',
			-- },
			-- tab_separator = {
			--   fg = '<colour-value-here>',
			--   bg = '<colour-value-here>',
			-- },
			-- tab_separator_selected = {
			--   fg = '<colour-value-here>',
			--   bg = '<colour-value-here>',
			--   sp = '<colour-value-here>',
			--   underline = '<colour-value-here>',
			-- },
		},
		opts = {
			options = {
				indicator = {
					style = "icon",
					icon = "▎",
				},
				show_tab_indicators = true,
				style_preset = "minimal",
				separator_style = "thin",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
			},
		},
	},
}
