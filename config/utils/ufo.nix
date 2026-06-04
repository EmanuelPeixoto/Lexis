{ lib, ... }:
{
  plugins.nvim-ufo = {
    enable = true;
    settings = {
      provider_selector = lib.nixvim.mkRaw ''
        function(bufnr, filetype, buftype)
          return { 'treesitter', 'indent' }
        end
      '';
      fold_virt_text_handler = lib.nixvim.mkRaw ''
        function(virtText, lnum, endLnum, width, truncate, ctx)
          local hasFolds = #virtText > 0
          local suffix = hasFolds and ("  " .. (endLnum - lnum) .. " lines") or ""
          return { suffix }
        end
      '';
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "zR";
      action = "<cmd>lua require('ufo').openAllFolds()<CR>";
      options.desc = "Open all folds";
    }
    {
      mode = "n";
      key = "zM";
      action = "<cmd>lua require('ufo').closeAllFolds()<CR>";
      options.desc = "Close all folds";
    }
    {
      mode = "n";
      key = "zp";
      action = "<cmd>lua require('ufo').peekFoldedLinesUnderCursor()<CR>";
      options.desc = "Peek fold";
    }
  ];
}
