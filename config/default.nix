{
  imports = [
    ./autocmd.nix
    ./extraPackages.nix
    ./native.nix
    ./plugins/default.nix
  ];

  globals = {
    mapleader = " ";
    maplocalleader = " ";
    have_nerd_font = true;
  };

  colorschemes.gruvbox.enable = true;
}
