{
  keymaps = [
    {
      mode = "n";
      key = "<leader>nh";
      options = {
        silent = true;
        desc = "Clear search highlights";
      };
      action = "<cmd>nohlsearch<CR>";
    }
  ];
}
