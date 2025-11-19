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
            prompt_position = "bottom";
          };
        };
        sorting_strategy = "ascending";
        mappings.i."<leader>f".__raw = "require('telescope.actions').close";
      };
    };
    keymaps = {
      "<leader>f" = {
        action = "find_files";
        options = {
          desc = "Find files";
        };
      };
    };
  };
}
