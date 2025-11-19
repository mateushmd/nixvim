{
  plugins = {
    lsp-format = {
      enable = true;
      settings.typescript.exclude = [ "ts_ls" ];
    };
    lsp = {
      enable = true;
      servers = {
        nil_ls = {
          enable = true; # Nix <3
          settings.nix.flake.autoArchive = true;
        };
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
        rust_analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
        html.enable = true;
        cssls.enable = true;
        ts_ls.enable = true; # TipoEscripto :(
        basedpyright.enable = true;
        dartls.enable = true;
        fish_lsp.enable = true;
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
