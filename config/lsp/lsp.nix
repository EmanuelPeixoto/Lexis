{
  plugins.lsp = {
    enable = true;

    servers = {
      bashls.enable = true;                 # Bash
      clangd.enable = true;                 # C
      cssls.enable = true;                  # CSS
      emmet_ls.enable = true;               # HTML/CSS/SCSS/JS
      gopls.enable = true;                  # Go
      html.enable = true;                   # HTML
      java_language_server.enable = true;   # Java
      jsonls.enable = true;                 # JSON
      nixd.enable = true;                   # Nix
      texlab.enable = true;                 # TeX
      ts_ls.enable = true;                  # TypeScript
    };
  };

  filetype.extension.gohtml = "html";
}
