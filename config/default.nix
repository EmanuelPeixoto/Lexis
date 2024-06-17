{
  imports = [
    ./extraPlugins.nix
    ./lsp.nix
    ./native.nix
    ./ui.nix
    ./utils.nix
  ];
  globals = {
    mapleader = " ";
    maplocalleader = " ";
    have_nerd_font = true;
  };
}
