{ lib, ... }:
{
  plugins = {
    luasnip.enable = true;

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "buffer"; }
          { name = "path"; }
        ];

        mapping = {
          "<CR>" = lib.nixvim.mkRaw "cmp.mapping.confirm({ select = true })";
          "<S-Tab>" = lib.nixvim.mkRaw "cmp.mapping.select_prev_item()";
          "<Tab>" = lib.nixvim.mkRaw "cmp.mapping.select_next_item()";
        };

        snippet.expand = "luasnip";
      };
    };
  };
}
