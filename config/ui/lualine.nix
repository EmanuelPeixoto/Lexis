{ lib, ... }:
{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        globalstatus = true;
        component_separators = { left = ""; right = ""; };
        section_separators = { left = "█"; right = "█"; };
      };
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [
          {
            __unkeyed = "branch";
            icon = "";
          }
          {
            __unkeyed = "diff";
            symbols = {
              added = "+";
              modified = "~";
              removed = "-";
            };
          }
          {
            __unkeyed = "diagnostics";
            sources = [ "nvim_diagnostic" ];
          }
        ];
        lualine_c = [
          {
            __unkeyed = "filename";
            file_status = true;
            path = 1;
          }
          {
            __unkeyed = lib.nixvim.mkRaw ''
              function()
                local clients = vim.lsp.get_clients({ bufnr = 0 })
                if #clients == 0 then return "" end
                local names = {}
                for _, c in ipairs(clients) do
                  table.insert(names, c.name)
                end
                return "    " .. table.concat(names, ", ")
              end
            '';
          }
        ];
        lualine_x = [ "filetype" "encoding" ];
        lualine_y = [ "progress" ];
        lualine_z = [ "location" ];
      };
    };
  };
}
