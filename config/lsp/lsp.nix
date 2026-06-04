{
  imports = [ ./servers ];

  plugins.lsp = {
    enable = true;

    keymaps = {
      lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
        "<leader>ca" = "code_action";
        "<leader>rn" = "rename";
      };
      diagnostic = {
        "[d" = "goto_prev";
        "]d" = "goto_next";
      };
    };
  };

  filetype.extension.gohtml = "html";
}
