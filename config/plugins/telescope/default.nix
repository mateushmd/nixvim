{
  plugins.telescope = {
    enable = true;
    extensions = {
      file-browser.enable = true;
      fzf-native.enable = true;
    };
    settings = {
      defaults = {
        layout_config = {
          horizontal = {
            prompt_position = "top";
          };
        };
        sorting_strategy = "ascending";
      };
    };
    keymaps = {
      "<leader><space>" = {
        action = "find_files";
        options = {
          desc = "Find files";
        };
      };
    };
  };
}
