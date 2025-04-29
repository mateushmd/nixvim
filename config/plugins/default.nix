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
    /*./cmp*/
    ./blink-cmp
    ./colorizer
    ./lsp
    ./lualine
    ./markview
    ./telescope
    ./themes
    ./treesitter
    ./trouble
  ];
}
