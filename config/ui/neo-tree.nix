{
  plugins.neo-tree = {
    enable = true;
    settings = {
      window.mappings = {
        "<space>" = "none";
        "o" = "open";
        "l" = "open";
        "h" = "close_node";
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree toggle<CR>";
      options.desc = "Toggle NeoTree";
    }
  ];
}
