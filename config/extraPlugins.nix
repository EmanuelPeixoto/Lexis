{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    vim-nix
    yuck-vim

    cmp_luasnip
    cmp-buffer
    cmp-path
  ];
}
