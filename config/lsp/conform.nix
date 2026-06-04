{ pkgs, ... }:
{
  plugins = {
    conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          go = [ "gofmt" "goimports" ];
          nix = [ "nixfmt" ];
          markdown = [ "markdownlint" ];
          sh = [ "shellharden" "shfmt" ];
          bash = [ "shellharden" "shfmt" ];
        };
        format_on_save = {
          timeout_ms = 500;
          lsp_fallback = true;
        };
      };
    };

    lint = {
      enable = true;
      autoInstall = {
        enable = true;
        enableWarnings = false;
      };
      lintersByFt = {
        go = [ "golangcilint" ];
        nix = [ "statix" ];
        sh = [ "shellcheck" ];
        bash = [ "shellcheck" ];
        zsh = [ "shellcheck" ];
        tex = [ "chktex" ];
        yaml = [ "yamllint" ];
        dockerfile = [ "hadolint" ];
      };
      autoCmd = {
        event = [ "BufWritePost" ];
      };
    };
  };

  keymaps = [
    {
      mode = [ "n" "v" ];
      key = "<leader>cf";
      action = "<cmd>lua require('conform').format({ async = true, lsp_fallback = true })<CR>";
      options.desc = "Format code";
    }
  ];
}
