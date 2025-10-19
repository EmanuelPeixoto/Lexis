{
  plugins.gitsigns = {
    enable = true;
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

  keymaps = [
    { key = "]c"; mode = "n"; action = "gitsigns.next_hunk"; options.desc = "Next Hunk"; }
    { key = "[c"; mode = "n"; action = "gitsigns.prev_hunk"; options.desc = "Prev Hunk"; }
    { key = "<leader>hs"; mode = "n"; action = "gitsigns.stage_hunk"; options.desc = "Stage Hunk"; }
    { key = "<leader>hr"; mode = "n"; action = "gitsigns.reset_hunk"; options.desc = "Reset Hunk"; }
    { key = "<leader>hp"; mode = "n"; action = "gitsigns.preview_hunk"; options.desc = "Preview Hunk"; }
  ];
}
