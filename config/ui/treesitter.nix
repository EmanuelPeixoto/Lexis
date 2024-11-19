{
  plugins = {
    treesitter = {
      enable = true;
      settings.indent.enable = true;
    };
    treesitter-context = {
      enable = true;
      settings = { max_lines = 2; };
    };
  };
}