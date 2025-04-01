{ ... }:
{
  /*
    imports = map
    (name:
      this + "/${name}"
    )
    (lib.attrNames
      (filterAttrs
        (_: type: type == "dictionary") (readDir this)
      )
    );
  */

  imports = [
    ./colorizer
    ./lualine
    ./themes
    ./treesitter
  ];
}
