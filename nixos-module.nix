{ config, lib, pkgs, inputs, ... }:

{
  options.programs.kDrive.enable = lib.mkEnableOption "kDrive";

  config = lib.mkIf config.programs.kDrive.enable {
    environment.systemPackages = [
      inputs.kDrive.packages.${pkgs.system}.default
    ];
  };
}
