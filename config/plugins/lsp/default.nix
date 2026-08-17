{ lib, pkgs, ... }: 
let
  envHost = builtins.getEnv "hostname";
  host = if envHost != "" then envHost else "nixos";
  nixosConfigPath = "${builtins.getEnv "HOME"}/repos/nixos";
in 
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
        settings = lib.nixvim.mkRaw ''
          ['nil'] = {
            nix = {
              autoArchive = true,
            },
          },
        '';
      };
      nixd = {
        enable = true;
        /*
        extraOptions = {
          nixpkgs.expr = ''
              import <nixpkgs> { }
            '';
          options = {
            nixos.expr = ''
              (builtins.getflake (builtins.tostring ${nixosConfigPath})).nixosconfigurations.${host}.options;
            '';

            nixvim.expr = ''
              (builtins.getflake "github:nix-community/nixvim").nixvimconfigurations.${pkgs.system}.default.options;
            '';
          };
        };
        */
      };
      rust_analyzer = {
        enable = true;
        installRustc = true;
        installCargo = true;
      };
      svls.enable = true;
      ts_ls.enable = true;
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
