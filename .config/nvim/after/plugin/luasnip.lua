local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.setup({
	history = true,
	enable_autosnippets = true,
	-- Update more often, :h events for more info.
	update_events = "TextChanged,TextChangedI",
	delete_check_events = "TextChanged",
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = {{"↓", "Warning" }}
			}
		},
		[types.insertNode] = {
			active = {
				virt_text = {{"●", "Success" }}
			}
		},
	},
	snip_env = {
		s = function(...)
			local snip = ls.s(...)
			-- we can't just access the global `ls_file_snippets`, since it will be
			-- resolved in the environment of the scope in which it was defined.
			table.insert(getfenv(2).ls_file_snippets, snip)
		end,
		parse = function(...)
			local snip = ls.parser.parse_snippet(...)
			table.insert(getfenv(2).ls_file_snippets, snip)
		end,
	}
})

-- One peculiarity of honza/vim-snippets is that the file containing global
-- snippets is _.snippets, so we need to tell luasnip that the filetype "_"
-- contains global snippets:
ls.filetype_extend("all", { "_" })

-- require("luasnip.loaders.from_{snipmate,lua}").{lazy_,}load()
require("luasnip.loaders.from_snipmate").load()
require("luasnip.loaders.from_lua").load()
-- <c-l> is my expansion key
--
-- expand the current item or jump to the next item within the snippet.
--[[ vim.keymap.set({ "i", "s" }, "<C-l>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

-- <c-h> is my jump backwards key.
vim.keymap.set({ "i", "s" }, "<C-h>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })
]]

-- <c-j> is selecting within a list of options.
vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)
vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if ls.choice_active() then
		ls.change_choice(-1)
	end
end)

vim.keymap.set({"i"}, "<C-l>", function() ls.expand() end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<C-l>", function() ls.jump( 1) end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<C-k>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set("i", "<C-Enter>", require "luasnip.extras.select_choice")
-- shorcut to source my luasnips file again, which will reload my snippets
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")
