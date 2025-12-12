{
  plugins.indent-blankline = {
    enable = true;
    settings = {
      exclude.buftypes = [
        "terminal"
        "quickfix"
      ];
      indent.char = "│";
      scope = {
        show_start = false;
        show_end = false;
        show_exact_scope = true;
      };
    };
  };
}
