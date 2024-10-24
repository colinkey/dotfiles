-- A collection of plugins that kind of don't fit anywhere else
return {
	-- do git stuff
	"tpope/vim-fugitive",

	-- literally the best plugin
	"tpope/vim-surround",

	-- gcc and gc for comments
	"tpope/vim-commentary",

	-- helpful pop up for keybindings
	{ "folke/which-key.nvim", opts = {} },

	-- make indention pretty
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			exclude = { filetypes = { "dashboard" } },
		},
	},
}
