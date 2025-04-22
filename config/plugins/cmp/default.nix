{
  plugins = {
    cmp = {
      enable = true;
      settings = {
        autoEnableSources = true;
        snippet = {
          expand = "luasnip";
        };
        formatting = {
          fields = [
            "kind"
            "abbr"
            "menu"
          ];
        };
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        mapping = {
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
        };
      };
    };
    cmp-nvim-lsp = {
      enable = true;
    };
    cmp-path = {
      enable = true;
    };
    cmp-buffer = {
      enable = true;
    };
  };
}
