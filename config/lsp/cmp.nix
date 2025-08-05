{
  plugins.cmp = {
    enable = true;
    autoEnableSources = true;
    settings = {
      sources = [
        {name = "nvim_lsp";}
      ];

      mapping = {
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<S-Tab>" = "cmp.mapping.select_prev_item()";
        "<Tab>" = "cmp.mapping.select_next_item()";
      };
    };
  };
}
