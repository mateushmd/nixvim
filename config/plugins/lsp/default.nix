{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        asm_lsp.enable = true;
        basedpyright.enable = true;
        clangd = {
          enable = true;
          cmd = [
            "clangd"
            "--background-index"
          ];
          filetypes = [
            "c"
            "cpp"
          ];
        };
        cssls.enable = true;
        fish_lsp.enable = true;
        html.enable = true;
        lua_ls.enable = true;
        nixd.enable = true;
        rust_analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
        svls.enable = true;
        ts_ls.enable = true;
      };
    };
  };

  extraConfigLua = ''
    vim.diagnostic.config({
      severity_sort = true,
      virtual_text = {
        severity = vim.diagnostic.severity.ERROR,
      },
      underline = {
        severity = vim.diagnostic.severity.ERROR,
      },
    })

    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        vim.diagnostic.open_float(nil, {
          focusable = false,
          scope = "line",
          close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" }
        })
      end,
    })

    local symbols = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }

    for name, icon in pairs(symbols) do
    	local hl = "DiagnosticSign" .. name
    	vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
    end
  '';
}
