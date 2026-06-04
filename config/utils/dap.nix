{
  plugins = {
    dap = {
      enable = true;
      signs = {
        dapBreakpoint = {
          text = "●";
          texthl = "DapBreakpoint";
        };
        dapBreakpointCondition = {
          text = "●";
          texthl = "DapBreakpointCondition";
        };
        dapLogPoint = {
          text = "◆";
          texthl = "DapLogPoint";
        };
        dapStopped = {
          text = "▶";
          texthl = "DapStopped";
        };
      };
    };

    dap-ui.enable = true;
    dap-virtual-text.enable = true;

    dap-go.enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>db";
      action = "<cmd>lua require('dap').toggle_breakpoint()<CR>";
      options.desc = "Toggle Breakpoint";
    }
    {
      mode = "n";
      key = "<leader>dB";
      action = "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>";
      options.desc = "Conditional Breakpoint";
    }
    {
      mode = "n";
      key = "<leader>dc";
      action = "<cmd>lua require('dap').continue()<CR>";
      options.desc = "Continue";
    }
    {
      mode = "n";
      key = "<leader>do";
      action = "<cmd>lua require('dap').step_over()<CR>";
      options.desc = "Step Over";
    }
    {
      mode = "n";
      key = "<leader>di";
      action = "<cmd>lua require('dap').step_into()<CR>";
      options.desc = "Step Into";
    }
    {
      mode = "n";
      key = "<leader>du";
      action = "<cmd>lua require('dap').step_out()<CR>";
      options.desc = "Step Out";
    }
    {
      mode = "n";
      key = "<leader>dr";
      action = "<cmd>lua require('dap').repl.open()<CR>";
      options.desc = "Open REPL";
    }
    {
      mode = "n";
      key = "<leader>dt";
      action = "<cmd>lua require('dapui').toggle()<CR>";
      options.desc = "Toggle DAP UI";
    }
    {
      mode = "n";
      key = "<leader>dq";
      action = "<cmd>lua require('dap').terminate()<CR>";
      options.desc = "Terminate";
    }
    {
      mode = "v";
      key = "<leader>de";
      action = "<cmd>lua require('dapui').eval()<CR>";
      options.desc = "Evaluate";
    }
  ];
}
