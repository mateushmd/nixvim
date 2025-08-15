{
  description = "What am I doing with my life";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = { nixvim, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-linux"
        "x86_64-linux"
      ];

      perSystem = { system, pkgs, ... }:
        let
          nixvim' = nixvim.legacyPackages.${system};
          nixvimModule = {
            inherit pkgs;
            module = import ./config;
            extraSpecialArgs = {

            };
          };
          nvim = nixvim'.makeNixvimWithModule nixvimModule;
        in
        {
          formatter = pkgs.nixfmt-rfc-style;
          packages.default = nvim;
        };
    };
}
