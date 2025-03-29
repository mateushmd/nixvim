{ lib, ... }:
let
  inherit (builtins) readDir;
  inherit (lib.attrsets) foldAttrs;
  inherit (lib.lists) optional;

  op = prev: name: type:
    prev ++ optional (type == "directory") (this + "/${name}");

  this = ./.;
in
{
  imports = foldAttrs 
 [ ] (readDir this);
}
