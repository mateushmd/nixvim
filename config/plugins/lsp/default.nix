{ ... }: 
{
  plugins.lsp = {
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
      nil_ls = {
        enable = true;
        settings.nil.__raw = ''
          {
            nix = {
              autoArchive = true,
            },
          },
        '';
      };
      nixd.enable = true;
      rust_analyzer = {
        enable = true;
        installRustc = false;
        installCargo = false;
        settings = {
          cargo.targetDir = true;
          check.command = "clippy";
        };
      };
      svls.enable = true;
      ts_ls.enable = true;
      roslyn_ls = {
        enable = true;
        extraOptions = {
          capabilities = {
            workspace = {
              didChangeWatchedFiles = {
                dynamicRegistration = false;
              };
            };
          };
        };
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
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅙",
          [vim.diagnostic.severity.WARN]  = "",
          [vim.diagnostic.severity.INFO]  = "󰋼",
          [vim.diagnostic.severity.HINT]  = "󰌵",
        }
      }
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
  '';
}
