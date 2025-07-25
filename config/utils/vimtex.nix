{ pkgs, ... }:
{
  plugins.vimtex = {
    enable = true;
    texlivePackage = pkgs.texliveFull;
    settings = {
      view_method = "zathura";

      quickfix_enabled = true;
      quickfix_open_on_warning = false;

        # Ignore undesired errors and warnings
        quickfix_ignore_filters = [
          "Underfull"
          "Overfull"
          "specifier changed to"
          "Token not allowed in a PDF string"
        ];

        # TOC settings
        toc_config = {
          name = "TOC";
          layers = [ "content" "todo" ];
          resize = true;
          split_width = 50;
          todo_sorted = false;
          show_help = true;
          show_numbers = true;
          mode = 2;
        };
      };
    };

    keymaps = [{
      mode = "n";
      key = "m";
      action = ":VimtexView<CR>";
      options.silent = true;
    }];

    autoCmd = [
      {
        event = [ "BufEnter" "BufWinEnter" ];
        pattern = "*.tex";
        command = ''set filetype=tex "| VimtexTocOpen'';
      }

      # Compile on initialization
      {
        event = "User";
        pattern = "VimtexEventInitPost";
        callback = "vimtex#compiler#compile";
      }

      # Cleanup on exit
      {
        event = "User";
        pattern = "VimtexEventQuit";
        command = "call vimtex#compiler#clean(0)";
      }
    ];
  }
