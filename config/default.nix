{ lib, ... }:
let
  inherit (builtins) readDir;
  inherit (lib.attrsets) foldlAttrs;
  inherit (lib.lists) optional;

  plugins = ./plugins;
in
{
  imports =
    (foldlAttrs (
      prev: name: type:
      prev ++ optional (type == "directory") (plugins + "/${name}")
    ) [ ] (readDir plugins))
    ++ [
      ./options.nix
    ];
}
