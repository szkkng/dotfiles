{ ... }:
{
  plugins.cmp = {
    enable = true;
    autoEnableSources = true;
    settings = {
      sources = [
        { name = "nvim_lsp"; }
        { name = "nvim_lua"; }
        { name = "luasnip"; }
        { name = "buffer"; }
        { name = "path"; }
      ];
      mapping = {
        __raw = ''
          cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
          })
        '';
      };
      snippet = {
        expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';
      };
      window = {
        completion = {
          scrollbar = false;
          winhighlight = "Normal:NormalFloat,FloatBorder:CmpNormal";
        };
      };
    };
  };
}
