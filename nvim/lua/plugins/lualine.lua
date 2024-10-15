return {
  "nvim-lualine/lualine.nvim",
  enabled = false,
  event = "VeryLazy",
  config = function(_, opts)
    -- Custom theme configuration for lualine
    local auto = require("lualine.themes.auto")
    local lualine_modes = { "insert", "normal", "visual", "command", "replace", "inactive", "terminal" }
    for _, field in ipairs(lualine_modes) do
      if auto[field] and auto[field].c then
        auto[field].c.bg = "NONE" -- Remove background color for certain modes
      end
    end
    opts.options.theme = auto -- Apply the customized theme to lualine
    require("lualine").setup(opts) -- Setup lualine with modified options
  end,
}
