{ ... }:
{
  plugins.treesitter = {
    enable = true;
    settings = {
      indent.enable = false;
      highlight.enable = true;
    };
    folding.enable = false;
  };
}
