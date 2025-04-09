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
    ./cmp
    ./colorizer
    ./lsp
    ./lualine
    ./markview
    ./themes
    ./treesitter
  ];
}
