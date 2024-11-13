{
  plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>ff" = {
        action = "find_files";
        options.desc = "Find files";
      };
      "<leader>fg" = {
        action = "live_grep";
        options.desc = "Live grep";
      };
      "<C-p>" = {
        action = "git_files";
        options.desc = "Telescope Git Files";
      };
    };
    extensions.fzf-native.enable = true;
  };
}
