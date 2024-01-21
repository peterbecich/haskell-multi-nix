{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-parts.url = "github:hercules-ci/flake-parts";
    haskell-flake.url = "github:srid/haskell-flake";
    halogen-chess.url =
      "github:peterbecich/halogen-chess";
    halogen-chess.flake = false;

  };
  outputs = inputs@{ self, nixpkgs, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = nixpkgs.lib.systems.flakeExposed;
      imports = [ inputs.haskell-flake.flakeModule ];
      perSystem = { self', inputs', pkgs, system, ... }: {
        haskellProjects.default = {
          # Want to override dependencies?
          # See https://haskell.flake.page/dependency
        };
        packages = {
          halogen-chess.source = inputs.halogen-chess;
        };
        packages.default = self'.packages.bar;
      };
    };
}
