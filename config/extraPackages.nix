{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    ripgrep   # Telescope
  ];
}
