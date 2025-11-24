{ lib, ... }:
{
  imports = 
    let
      entries = builtins.readDir ./.;
      
      dirs = lib.filterAttrs (name: type: type == "directory") entries;

      paths = lib.mapAttrsToList (name: _: ./. + "/${name}") dirs;
    in
    paths;
}
