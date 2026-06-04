{
  plugins.grug-far = {
    enable = true;
    settings.transient = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>sr";
      action = "<cmd>lua require('grug-far').open({ transient = true })<CR>";
      options.desc = "Search & Replace";
    }
    {
      mode = "v";
      key = "<leader>sr";
      action = "<cmd>lua require('grug-far').open({ transient = true, prefills = { search = require('grug-far').get_current_visual_selection() } })<CR>";
      options.desc = "Search & Replace (visual)";
    }
  ];
}
