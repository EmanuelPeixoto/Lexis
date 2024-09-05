{
  plugins.cmp = {
    enable = true;
    autoEnableSources = true;
    settings = {
      sources = [
        {name = "buffer";}
        {name = "clangd";}
        {name = "cssls";}
        {name = "emmet_ls";}
        {name = "eslint";}
        {name = "gopls";}
        {name = "html";}
        {name = "jsonls";}
        {name = "luasnip";}
        {name = "nixd";}
        {name = "nvim_lsp";}
        {name = "path";}
        {name = "texlab";}
      ];

      mapping = {
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<Tab>" = "cmp.mapping.select_next_item()";
      };
    };
  };
}
