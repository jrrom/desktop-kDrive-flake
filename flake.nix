{
  description = "Flake that wraps Infomaniak kDrive AppImage";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs, ... }:
    {
      packages.x86_64-linux.default = pkgs.callPackage ./default.nix { };
      nixosModules.default = import ./nixos-module.nix;
    };
}
