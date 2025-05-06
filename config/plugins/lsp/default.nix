{
  plugins = {
    lsp-format = {
      enable = true;
    };
    lsp = {
      enable = true;
      servers = {
        nixd.enable = true;
        jdtls.enable = true;
        clangd.enable = true;
      };
    };
    lsp-lines = {
      enable = false;
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
