self: { config, lib, pkgs, ... }:

{
  options.programs.kDrive.enable = lib.mkEnableOption "kDrive";

  config = lib.mkIf config.programs.kDrive.enable {
    environment.systemPackages = [
      self.packages.${pkgs.system}.default
    ];
  };
}
