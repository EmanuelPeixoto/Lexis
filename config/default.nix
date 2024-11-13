{
  imports = [
    ./autocmd.nix
    ./extraPackages.nix
    ./extraPlugins.nix
    ./lsp/imports.nix
    ./native/imports.nix
    ./ui/imports.nix
    ./utils/imports.nix
  ];

  globals = {
    mapleader = " ";
    maplocalleader = " ";
    have_nerd_font = true;
  };

  colorschemes.melange.enable = true;
}
