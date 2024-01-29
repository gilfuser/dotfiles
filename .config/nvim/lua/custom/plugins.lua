return function(use)
  -- use {
  --   "folke/which-key.nvim",
  --   config = function() require("which-key").setup {} end
  -- }
  -- style stuff
  use "ellisonleao/gruvbox.nvim"
  use "folke/tokyonight.nvim"
  use "Shatur/neovim-ayu"
  use 'eddyekofo94/gruvbox-flat.nvim'
  use {
    "mcchrish/zenbones.nvim",
    requires = "rktjmp/lush.nvim"
}
  -- use("p00f/nvim-ts-rainbow")
  -- ----------------
  use "jose-elias-alvarez/null-ls.nvim"

  -- use("vijaymarupudi/nvim-fzf")
  use "davidgranstrom/scnvim"
  -- use("ibhagwan/fzf-lua")
  -- use("davidgranstrom/scnvim-tmux")
  use("tidalcycles/vim-tidal")

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {
      map_c_h = true,  -- Map the <C-h> key to delete a pair
      map_c_w = true
    } end
  }
  use {
    "kylechui/nvim-surround",
    tag = "*",
    config = function() require("nvim-surround").setup {} end
  }
  use("zhou13/vim-easyescape")
  use("karb94/neoscroll.nvim")
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-configplu
      require'hop'.setup {
	uppercase_labels = true,
      }
    end
  }
  -- Lua
  use {
    "Pocco81/true-zen.nvim",
    config = function()
      require("true-zen").setup { } end,
  }

  use("jbyuki/instant.nvim")
  use("nvim-tree/nvim-web-devicons")
  use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
  use("xiyaowong/nvim-transparent")
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use ('doxnit/cmp-luasnip-choice')
  use { 'norcalli/nvim-colorizer.lua' }
  use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"} }
  }
use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})
--[[ use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, }) ]]

end

