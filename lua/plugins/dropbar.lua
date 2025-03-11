return {
	{
		"Bekaboo/dropbar.nvim",
		event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
		keys = {
			{
				"<leader>pb",
				function()
					require("dropbar.api").pick()
				end,
				desc = "Dropbar select",
			},
		},
	},
}