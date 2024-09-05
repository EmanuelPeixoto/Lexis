{
  plugins.gitsigns = {
    enable = false;
    settings = {
      current_line_blame = true;
      trouble = true;
      signs = {
        add = { text = "+"; };
        change = { text = "~"; };
        delete = { text = "-"; };
        topdelete = { text = "‾"; };
        changedelete = { text = "~"; };
      };
    };
  };
}
