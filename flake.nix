{
  description = "What am I doing with my life";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixvim,
      flake-parts,
      pre-commit-hooks,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];

      perSystem =
        { system, pkgs, self', lib, ... }:
        let
          nixvim' = nixvim.legacyPackages.${system};
          nixvimModule = {
            inherit pkgs;
            module = import ./config;
            extraSpecialArgs = {
              inherit inputs system;
            };
          };
          nvim = nixvim'.makeNixvimWithModule nixvimModule;
        in
        {
          checks = {
            pre-commit-check = pre-commit-hooks.lib.${system}.run {
              src = ./.;
              hooks = {
                statix.enable = true;
                nixfmt-rfc-style.enable = true;
              };
            };
          };

          formatter = pkgs.nixfmt-rfc-style;

          packages.default = nvim;

          devShells.default =
            with pkgs;
            mkShell {
              inherit (self'.checks.pre-commit-check) shellHook;
            };
        };
    };
}
