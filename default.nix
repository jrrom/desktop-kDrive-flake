{ pkgs, lib }:

let
  pname = "kDrive";
  version = "3.7.10.1";

  src = pkgs.fetchurl {
    url = "https://github.com/jrrom/desktop-kDrive-flake/releases/download/${version}/kDrive-${version}-amd64.AppImage";
    hash = "sha256-I/D2v7VTyQNu/OFDHzxJ+BAEcbBmUht6AfuiYHDGF68=";
  };

  appimageContents = pkgs.appimageTools.extract {
    inherit pname version src;
  };
in
pkgs.stdenvNoCC.mkDerivation {
  inherit pname version src;

  nativeBuildInputs = [ pkgs.makeWrapper ];

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/libexec
    cp $src $out/libexec/kDrive.AppImage
    chmod +x $out/libexec/kDrive.AppImage

    makeWrapper ${pkgs.appimage-run}/bin/appimage-run $out/bin/kDrive \
      --add-flags "$out/libexec/kDrive.AppImage" \
      --set-default XDG_CONFIG_HOME "$HOME/.config" \
      --set-default XDG_DATA_HOME "$HOME/.local/share"

    mkdir -p $out/share/applications
    install -m 444 \
      ${appimageContents}/usr/share/applications/kDrive_client.desktop \
      $out/share/applications/kDrive.desktop

    mkdir -p $out/share/icons
    cp -r ${appimageContents}/usr/share/icons/hicolor \
      $out/share/icons/
  '';

  meta = {
    description = "Infomaniak kDrive (AppImage via appimage-run)";
    homepage = "https://github.com/Infomaniak/desktop-kDrive";
    license = lib.licenses.gpl3;
    platforms = [ "x86_64-linux" ];
  };
}
