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
      };
    };
  };
}
