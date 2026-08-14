let
  colors = import ./colors/tokyonight.nix;
in
{
  plugins = {
    web-devicons.enable = true;
    lualine = {
      enable = true;
      settings = {
        options = {
          globalstatus = true;
          component_separators = "";
          section_separators = {
            left = "";
            right = "";
          };
          theme.normal = {
            a.bg = "NONE";
            b.bg = "NONE";
            c.bg = "NONE";
            x.bg = "NONE";
            y.bg = "NONE";
            z.bg = "NONE";
          };
          disabled_filetypes.statusline = [
            "dashboard"
            "alpha"
            "starter"
          ];
        };
        sections = {
          lualine_a = [
            {
              __unkeyed.__raw = ''
                function()
                  return '▊'
                end
              '';
              color.fg = colors.base09;
              padding.right = 1;
            }
          ];
          lualine_b = [ "" ];
          lualine_c = [
            {
              __unkeyed = "mode";
              color.fg = colors.base08;
            }
            {
              __unkeyed = "filename";
              color.fg = colors.base09;
            }
            {
              __unkeyed = "location";
              color.fg = colors.base0F;
            }
            {
              __unkeyed = "progress";
              color.fg = colors.base0F;
            }
            {
              __unkeyed = "diagnostics";
              sources = [ "nvim_diagnostic" ];
              symbols = {
                error = " ";
                warn = " ";
                info = " ";
              };
              diagnostics_color = {
                error.fg = "#ec5f67";
                warn.fg = "#ecbe7b";
                info.fg = "#008080";
              };
            }
            {
              __unkeyed.__raw = ''
                function()
                  local msg = 'No Active Lsp'
                  local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
                  local clients = vim.lsp.get_clients()
                  if next(clients) == nil then
                    return msg
                  end
                  for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                      return client.name
                    end
                  end
                  return msg
                end
              '';
              icon = " LSP:";
              color = { 
                fg = "#ffffff"; 
                gui = "bold"; 
              };
            }
          ];
          lualine_x = [
            {
              __unkeyed = "filetype";
              colored = true;
              icon_only = false;
              icon.align = "left";
              color.fg = colors.base0F;
            }
            {
              __unkeyed = "branch";
              color.fg = colors.base08;
            }
            {
              __unkeyed = "diff";
              symbols = { 
                added = " ";
                modified = "󰝤 ";
                removed = " ";
              };
              diff_color = {
                added.fg = "#98be65";
                modified.fg = "#ff8800";
                removed.fg = "#ec5f67";
              };
            }
          ];
          lualine_y = [ "" ];
          lualine_z = [
            {
              __unkeyed.__raw = ''
                function()
                  return '▊'
                end
              '';
              color.fg = colors.base09;
              padding.left = 1;
            }
          ];
        };
      };
    };
  };
}
