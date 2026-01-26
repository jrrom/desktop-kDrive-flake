{ config, lib, pkgs, ... }:

{
  options.programs.kDrive.enable = lib.mkEnableOption "kDrive";

  config = lib.mkIf config.programs.kDrive.enable {
    environment.systemPackages = [
      pkgs.kDrive
    ];
  };
}
