return {
	"github/copilot.vim",
	cmd = "Copilot",
	config = function()
		vim.cmd("Copilot disable")

		vim.keymap.set("i", "<C-a-o>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
		})
		vim.g.copilot_no_tab_map = true
	end,
}
