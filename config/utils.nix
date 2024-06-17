{
  plugins = {
    undotree = {
      enable = true;
      settings = {
        autoOpenDiff = true;
        focusOnToggle = true;
      };
    };

    comment.enable = true;
    wakatime.enable = true;
  };

  keymaps = [
      {
        mode = "n";
        key = "<leader>ut";
        action = "<cmd>UndotreeToggle<CR>";
        options = {
          silent = true;
          desc = "Undotree";
        };
      }
    ];

}
