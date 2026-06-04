{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    fd        # Telescope find_files
    fzf       # Telescope fzf-native
    ripgrep   # Telescope live_grep
  ];
}
