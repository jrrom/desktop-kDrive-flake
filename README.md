# Unofficial flake for [Infomaniak kDrive](https://github.com/Infomaniak/desktop-kDrive)

Notice: I am not the creator of kDrive or related to Infomaniak in any way or form. I am simply sharing this packaged version of the AppImage as a usable flake for people to use.

Thank you.

## Usage:

flake.nix
```nix
{
  inputs = {
    # Package sets
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # kDrive
    kDrive = {
      url = "github:jrrom/desktop-kDrive-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, kDrive }:
  {
    ...
    nixosConfigurations.xyz = nixpkgs.lib.nixosSystem {
      ...
      modules = [
        inputs.kDrive.nixosModules.default
        ...
      ];
      ...
    };
  };
}
```

configuration.nix
```
{ ... }:

{
  ...
  programs.kDrive.enable = true;
  ...
}
```
