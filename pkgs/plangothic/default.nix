{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation rec {
  pname = "plangothic";
  version = "2.9.5787";

  src = fetchFromGitHub {
    owner = "Fitzgerald-Porthmouth-Koenigsegg";
    repo = "Plangothic_Project";
    tag = "V${version}";
    hash = "sha256-PIY0QkNbrQfgaMutcQSJHAfwjTv0j31D3QoYQKcwdXw=";
    sparseCheckout = [
      "fonts/otf"
    ];
  };

  installPhase = ''
    install -m444 -Dt $out/share/fonts/opentype/plangothic fonts/otf/*.otf
  '';

  meta = {
    description = "Extended Source Han Sans with CJKV Unified Ideographs";
    homepage = "https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic_Project";
    longDescription = ''
      A project based on Source Han Sans to supplement the glyphs 
          for the CJKV Unified Ideographs Extension area, 
          standardized on Mainland Chinese character forms.'';
    license = lib.licenses.ofl;
    platforms = lib.platforms.all;
    maintainers = with lib.maintainers; [ AmamiyaMion ];
  };
}
