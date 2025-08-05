{
  plugins.twilight.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>Twilight<CR>";
      options.desc = "Toggle Twilight";
    }
  ];
}
