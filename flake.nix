{
  description = "Flake that wraps Infomaniak kDrive AppImage";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages.${system}.default = pkgs.callPackage ./default.nix { };
      nixosModules.default = import ./nixos-module.nix;
    };
}
