return {
	"tpope/vim-surround",
	dependencies = {
		"tpope/vim-repeat",
	},
	event = "VeryLazy",
	keys = {
		{ "S", mode = { "v" } },
		"cs",
		"ds",
		"yss",
	},
}
