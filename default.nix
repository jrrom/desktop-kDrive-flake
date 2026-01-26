{
  appimageTools,
  fetchurl,
  lib,
}:

let
  pname = "kDrive";
  repo = "desktop-kDrive-flake";
  version = "3.7.9.1";
  
  src = fetchurl {
    url = "https://github.com/jrrom/${repo}/releases/download/${version}/${pname}-${version}-amd64.AppImage";
    hash = "sha256-0qiknfmw108hvrcmi1pml5ls73c3ngr2y18cnzysb9hn2hr5pc40";
  };

  appimageContents = appimageTools.extract { inherit pname version src; };
in
appimageTools.wrapType2 {
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
