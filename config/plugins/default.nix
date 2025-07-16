{ lib, ... }:
{
  /*
  imports = (lib.attrsets (
    prev: name: type:
    prev ++ lib.lists (type == "directory") (./. + "${name}")
  ) [] (builtins.readDir ./.));
  */

  imports = [
    ./blink-cmp
    ./colorizer
    ./hex
    ./lsp
    ./lualine
    ./markview
    ./telescope
    ./themes
    ./treesitter
  ];
}
