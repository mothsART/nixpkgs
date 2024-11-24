{ 
  lib
, pkgs
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation {
  pname = "easy flatpak";
  version = "2.19";

  src = fetchFromGitHub {
    owner = "imikado";
    repo = "dupotEasyFlatpak";
    rev = "2.19";
    hash = "sha256-tW86b9a7u1jyfmHjwjs+5DaUujRZH+VhGQsj0CBj0yk=";
  };

  buildInputs = [
    pkgs.flutter
  ];

  buildPhase = ''
    flutter build linux --release
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp build/app/outputs/flutter-apk/app-release.apk $out/bin/flutter-app.apk
  '';

  meta = with lib; {
    description = "Help to install flatpak easier";
    homepage = "https://github.com/imikado/dupotEasyFlatpak";
    changelog = "https://github.com/imikado/dupotEasyFlatpak/releases/tag/${version}";
    maintainers = with maintainers; [ mothsart ];
    license = with licenses; [ gpl2Plus ];
    mainProgram = "easy-flatpak";
  };
}
