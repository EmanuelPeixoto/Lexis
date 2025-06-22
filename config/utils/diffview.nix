{
  plugins.diffview = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>dvv";
      options.silent = true;
      action = ":DiffviewOpen<CR>";
    }
    {
      mode = "n";
      key = "<leader>dvc";
      options.silent = true;
      action = ":DiffviewClose<CR>";
    }
  ];
}
