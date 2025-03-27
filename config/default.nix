{ lib, ... }:
let
  inherit (builtins) readDir;
  inherit (lib.attrsets) foldlAttrs;
  inherit (lib.lists) optional;

  plugins = ./plugins;
in
{
  imports = [
      ./options.nix
    ];
}
