{ lib, ... }:
let
  inherit (lib.attrsets) filterAttrs;
  inherit (builtins) attrNames map readDir toPath;
in
{
  imports = map (name : toPath "${./.}/${name}") (
    attrNames (
      filterAttrs (name: value: value == "directory") (
        readDir ./.
      )
    )
  );
}
