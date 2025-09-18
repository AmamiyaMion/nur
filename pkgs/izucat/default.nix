{
  lib, 
  fetchFromGitHub, 
  rustPlatform, 
  ...
}:

rustPlatform.buildRustPackage rec {
  name = "izucat-${version}";
  version = "0.1.6";
  src = fetchFromGitHub {
    owner = "Souiken";
    repo = "izucat";
    rev = "v${version}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };
  cargoHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  meta = {
    description = "A program that can recursively concatenate (cat) text and binary files in a path and/or command/stdin output to typst.";
    homepage = "https://github.com/Souiken/izucat";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ AmamiyaMion ];
    mainProgram = "izucat";
  };
}