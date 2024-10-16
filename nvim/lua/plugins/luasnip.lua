return {
  {
    "L3MON4D3/LuaSnip",
    build = (not LazyVim.is_win())
        and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
      or nil,
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
    },
    opts = function(_, opts)
      opts.history = true
      opts.delete_check_events = "TextChanged"
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { "~/dotfile/snippets/" },
      })
    end,
  },
}
