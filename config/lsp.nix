{
  plugins.lsp = {
    enable = true;

    servers = {
        # bashls.enable = true;                 # Bash
        clangd.enable = true;                 # C
        gopls.enable = true;                  # Go
        java-language-server.enable = true;   # Java
        nixd.enable = true;                   # Nix
        texlab.enable = true;                 # TeX
        html.enable = true;                   # HTML
        jsonls.enable = true;                 # JSON
        cssls.enable = true;                  # CSS
        emmet-ls.enable = true;               # HTML/CSS/SCSS/JS
    };
  };

  plugins.cmp = {
    enable = true;
    autoEnableSources = true;
    /*sources = [
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
      ];*/

      settings.mapping = {
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<Tab>" = "cmp.mapping.select_next_item()";
      };
    };
  }
