{
  plugins.lsp = {
    enable = true;

    servers = {
      bashls.enable = true;                 # Bash
      clangd.enable = true;                 # C
      gopls.enable = true;                  # Go
      java_language_server.enable = true;   # Java
      nixd.enable = true;                   # Nix
      texlab.enable = true;                 # TeX
      html.enable = true;                   # HTML
      jsonls.enable = true;                 # JSON
      cssls.enable = true;                  # CSS
      emmet_ls.enable = true;               # HTML/CSS/SCSS/JS
    };
  };

  filetype.extension.gohtml = "html";
}
