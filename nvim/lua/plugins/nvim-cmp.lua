return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      -- file: lspconfig.lua
      local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
      capabilities.textDocument.completion.completionItem.snippetSupport = false
      opts.snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      }
      opts.sources = cmp.config.sources({
        { name = "nvim-lsp" },
        { name = "luasnip" },
        { name = "buffer" },
      })
      opts.window = {
        documentation = cmp.config.window.bordered({
          winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:None,Search:None",
        }),
        completion = cmp.config.window.bordered({
          winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:None,Search:None",
        }),
      }
      opts.filetype = {
        markdown = {
          sources = cmp.config.sources({
            { name = "luasnip" },
          }),
        },
      }
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
          if cmp.visible() then
            local entry = cmp.get_selected_entry()
            if not entry then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
              cmp.confirm()
            end
          else
            fallback()
          end
        end, { "i", "s", "c" }),
      })
    end,
  },
}
