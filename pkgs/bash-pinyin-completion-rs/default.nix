{ lib, 
  stdenv, 
  fetchFromGitHub, 
  rustPlatform, 
  ...
}:

rustPlatform.buildRustPackage rec {
  name = "bash-pinyin-completion-rs-${version}";
  version = "0.3.0";
  src = fetchFromGitHub {
    owner = "AOSC-Dev";
    repo = "bash-pinyin-completion-rs";
    rev = "v${version}";
    hash = "sha256-tcgpPFB/BHVbGFYHfs8y0yOVK/KJmjNJ95I41TX+pu4=";
  };
  cargoHash = "sha256-DmFsRoguommcBbeJrCcTRm815c7gLnUQ+7n0/Iz6Gvk=";
  postInstall = ''
    install -Dm755 target/${stdenv.hostPlatform.rust.rustcTarget}/release/bash-pinyin-completion-rs $out/bin/bash-pinyin-completion-rs
    install -Dm755 scripts/bash_pinyin_completion $out/etc/bash_completion.d/bash_pinyin_completion
  '';
  meta = {
    description = "Completion script for pinyin, matcher based on IbPinyinLib";
    homepage = "https://github.com/AOSC-Dev/bash-pinyin-completion-rs";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ AmamiyaMion ];
    mainProgram = "bash-pinyin-completion-rs";
  };
}
