{
  plugins.codesnap = {
    enable = true;
  };

  keymaps = [
    {
      mode = "v";
      key = "<leader>s";
      options.silent = true;
      action = ":CodeSnap<CR>";
    }
  ];
}
