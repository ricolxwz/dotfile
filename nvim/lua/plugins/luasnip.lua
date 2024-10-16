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
          vim.api.nvim_create_autocmd("FileType", {
            pattern = "*",
            callback = function()
              if vim.bo.filetype ~= "markdown" then
                require("luasnip.loaders.from_vscode").lazy_load()
              end
            end,
          })
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
