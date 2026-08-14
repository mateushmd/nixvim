{
  description = "What am I doing with my life";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    devshell.url = "github:numtide/devshell";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = { nixvim, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.devshell.flakeModule
      ];

      systems = [
        "aarch64-linux"
        "x86_64-linux"
      ];

      perSystem = { system, pkgs, ... }:
        let
          nixvim' = nixvim.legacyPackages.${system};
        in
        {
          _module.args.pkgs = import inputs.nixpkgs {
            inherit system;
            config.allowUnfreePredicate = pkg: builtins.elem (inputs.nixpkgs.lib.getName pkg) [
              "vim-be-good"
            ];
          };

          formatter = pkgs.nixfmt-rfc-style;

          packages.default = nixvim'.makeNixvimWithModule {
            inherit pkgs;
            module = import ./config;
          };

          devshells.default = {
            devshell.startup.shell.text = ''
              exec fish -i
            '';

            packages = [
              (nixvim'.makeNixvimWithModule {
                inherit pkgs;
                module = import ./config;
              })
            ];
          };
        };
    };
}
