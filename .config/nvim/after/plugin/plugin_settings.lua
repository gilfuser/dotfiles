require("neoscroll").setup { easing_function = "sine" }

-- require("gruvbox").setup { contrast = "hard" }

vim.g.gruvbox_flat_style = "dark"

require("ayu").setup { mirage = false }

require("tokyonight").setup { style = "night", light_style = "day" }

require('onedark').setup {
    style = 'deep'
}
-- require('onedark').load()

-- https://github.com/mcchrish/zenbones.nvim/blob/main/doc/zenbones.md
vim.g.forestbones = { solid_line_nr = true, darken_comments = 45 }

-- local function scstatus()
--    if vim.bo.filetype == "supercollider" then
--        local stat = vim.fn["scnvim#statusline#server_status"]()
--        stat = stat:gsub("%%", "♪")
--        return stat
--    else
--        return ""
--    end
-- end

--               ////////////// SCNvim ///////////////

local scnvim = require("scnvim")
local map = scnvim.map
local map_expr = scnvim.map_expr

require("scnvim.postwin").on_open:append(function()
	vim.opt_local.wrap = true
end)

-- vim.keymap.set("", "<localleader><Esc>", function() "editor.send_line" end , {desc="SuperCollider send line and save"})
scnvim.setup {
	keymaps = {
		["<localleader><Esc>"] = { map("editor.send_line", { "i", "n" })},
		["<leader><Esc>"] = {
			map("editor.send_block", { "i", "n" }),
			map("editor.send_selection", "x"),
		},
		["<CR>"] = map("postwin.toggle"),
		["<M-CR>"] = map("postwin.toggle", "i"),
		["<M-P>"] = map("postwin.clear", { "n", "i" }),
		["<C-k>"] = map("signature.show", { "n", "i" }),
		["<F12>"] = map("sclang.hard_stop", { "n", "x", "i" }),
		["<leader>st"] = map("sclang.start"),
		["<leader>sk"] = map("sclang.recompile"),
		["<F1>"] = map_expr("s.boot"),
		["<F2>"] = map_expr("s.meter"),
		["<F3>"] = map_expr("s.makeGui"),
		["<F4>"] = map_expr("CmdPeriod.run"),
	},
	editor = { highlight = { color = "IncSearch", }, },
	postwin = { float = { enabled = false, }, },
	extensions = {
		-- ["fzf-sc"] = {
		--     search_plugin = "nvim-fzf",
		-- },
	},
	snippet = { engine = { name = "luasnip", }, },
}

-- scnvim.load_extension("fzf-sc")

-- Vim Tidal

-- vim.g.tidal_target = "tmux"
vim.g.tidal_no_mappings = 1
vim.g.tidal_boot = "/home/skmecs/BootTidal.ghci"
vim.g.tidal_target = "terminal"

local null_ls = require("null-ls")

null_ls.setup {
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
    },
}
--
-- HARPOON
--
local harpoon = require("harpoon")
harpoon:setup()
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon telescope" })

-- You don't need to set any of these options.
-- IMPORTANT!: this is only a showcase of how you can set default options!
require("telescope").setup {
	extensions = {
		file_browser = {
			theme = "ivy",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
				},
				["n"] = {
					-- your custom normal mode mappings
				},
			},
		},
	},
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension("file_browser")

vim.cmd [[let g:instant_username = "skmecs"]]

require 'colorizer'.setup()

-- Vue language options (volar)
require 'lspconfig'.volar.setup {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
}
