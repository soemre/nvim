local M = {}

M.comments_hidden = false

function is_comment(lnum)
	-- FIX: Doesn't work as expected when the comment syntax includes
	-- special expression characters, such as `--`, which should be escaped using `%`.
	local syx = "^%s*" .. require("Comment.ft").get(vim.bo.filetype, require("Comment.utils").ctype.linewise) .. "*"
	local line = vim.fn.getline(lnum)
	return line:match(syx) ~= nil
end

function _G.comment_fold(lnum)
	if M.comments_hidden then
		if is_comment(lnum) then
			if is_comment(lnum - 1) then
				return "="
			end
			return ">1"
		end
		return "0"
	end
end

function _G.custom_foldtext()
	local indention = string.rep(" ", vim.fn.indent(vim.v.foldstart))
	local numOfLines = vim.v.foldend - vim.v.foldstart + 1
	return indention .. "(" .. numOfLines .. " comments)"
end

function M.toggle()
	M.comments_hidden = not M.comments_hidden
	vim.opt.foldmethod = "expr"
	vim.opt.foldexpr = "v:lua.comment_fold(v:lnum)"
	vim.opt.foldtext = "v:lua.custom_foldtext()"
	vim.opt.fillchars = "fold: " -- Remove the trailing dots
end

return M
