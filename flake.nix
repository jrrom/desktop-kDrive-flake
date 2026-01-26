{
  description = "Flake that wraps Infomaniak kDrive AppImage";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages.${system}.default = pkgs.callPackage ./default.nix {
        pname = "kDrive";
        repo = "desktop-kDrive-flake";
        version = "3.7.9.1";
      };
    };
}
