let
  colors = import ./colors/catppuccin.nix;
in
{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        globalstatus = true;
        component_separators = "";
        section_separators = {
          left = "";
          right = "";
        };
        theme = {
          normal = {
            a = {
              bg = "nil";
            };
            b = {
              bg = "nil";
            };
            c = {
              bg = "nil";
            };
            x = {
              bg = "nil";
            };
            y = {
              bg = "nil";
            };
            z = {
              bg = "nil";
            };
          };
        };
        disabled_filetypes = {
          statusline = [
            "dashboard"
            "alpha"
            "starter"
          ];
        };
      };
      sections = {
        lualine_a = [
          {
            __unkeyed = "mode";
            separator.left = "";
            separator.right = "";
          }
        ];
        lualine_b = [
          {
            __unkeyed = "location";
            separator.left = "";
            separator.right = "";
          }
          {
            __unkeyed = "filename";
            separator.left = "";
            separator.right = "";
          }
        ];
        lualine_c = [ "" ];
        lualine_x = [ "" ];
        lualine_y = [
          {
            __unkeyed = "filetype";
            separator.left = "";
            separator.right = "";
          }
          {
            __unkeyed = "progress";
            separator.left = "";
            separator.right = "";
          }
        ];
        lualine_z = [
          {
            __unkeyed = "branch";
            separator.left = "";
            separator.right = "";
          }
        ];
      };
    };
  };
}
