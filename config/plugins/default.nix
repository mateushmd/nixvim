{ lib, ... }:
let
  inherit (builtins) readDir;
  inherit (lib.attrsets) filterAttrs;
  inherit (lib.lists) map;

  this = ./.;
in
{
  imports = map (name: this + "/${name}")
    (lib.attrNames (filterAttrs (_: type: type == "dictionary") (readDir this)));
}
