{
  plugins = {
    cmp = {
      enable = true;
      settings = {
        autoEnableSources = true;
        snippet = {
          expand = "luasnip";
        };
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
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
