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
      jsonls.enable = true;                 # JSON
      nixd.enable = true;                   # Nix
      rust_analyzer = {                     # Rust
        enable = true;
        installRustc = true;
        installCargo = true;
      };
      texlab.enable = true;                 # TeX
      ts_ls.enable = true;                  # TypeScript
    };
    keymaps.lspBuf = {
      "gd" = "definition";
      "gD" = "references";
      "gt" = "type_definition";
      "gi" = "implementation";
      "K" = "hover";
    };
  };

  filetype.extension.gohtml = "html";
}
