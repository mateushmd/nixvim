{ config, lib, ... }:
{
  config.plugins.treesitter = {
    enable = true;
    folding.enable = false;
    grammarPackages = lib.attrValues {
      inherit (config.plugins.treesitter.package.grammarPlugins)
        asm
        bash
        bibtex
        c
        c_sharp
        cmake
        comment
        cpp
        css
        csv
        cuda
        desktop
        devicetree
        diff
        dockerfile
        editorconfig
        fish
        git_config
        git_rebase
        gitattributes
        gitcommit
        gitignore
        glsl
        go
        gomod
        gosum
        gowork
        hlsl
        html
        hyprlang
        javascript
        jsdoc
        json
        json5
        just
        kconfig
        kdl
        kitty
        latex
        linkerscript
        lua
        luadoc
        make
        markdown
        markdown_inline
        nasm
        ninja
        nix
        proto
        python
        query
        rasi
        regex
        requirements
        ron
        rust
        scss
        sql
        ssh_config
        systemverilog
        toml
        tsx
        typescript
        vhdl
        vim
        vimdoc
        wgsl
        xml
        yaml
        yuck;
    };
    settings = {
      indent.enable = false;
      highlight.enable = true;
    };
  };
}
