{
  appimageTools,
  fetchurl,
  lib,
  pname,
  repo,
  version,
}:

let
  src = fetchurl {
    url = "https://github.com/jrrom/${repo}/releases/download/${version}/${pname}-${version}-amd64.AppImage";
    hash = lib.fakeSha256;
  };

  appimageContents = appimageTools.extract { inherit pname version src; };
in
appimageTools.wrapType2 rec {
  inherit pname version src;

  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/usr/share/applications/kDrive_client.desktop \
      $out/share/applications/kDrive.desktop
    
    cp -r ${appimageContents}/usr/share/icons/hicolor $out/share/icons/
  '';

  meta = {
    description = "Infomaniak kDrive AppImage";
    homepage = "https://github.com/Infomaniak/desktop-kDrive";
    downloadPage = "https://www.infomaniak.com/en/apps/download-kdrive";
    license = lib.licenses.gpl3;
    platforms = [ "x86_64-linux" ];
  };
}
