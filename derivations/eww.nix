{
  pkgs ? import <nixpkgs> { },
}:

pkgs.rustPlatform.buildRustPackage rec {
  pname = "eww";
  version = "0.6.0";

  src = pkgs.fetchFromGitHub {
    owner = "elkowar";
    repo = "eww";
    rev = "8661abf2bf07f5a809fc995233d93810cc1ac871";
    hash = "sha256-q82u3/pcP5T++TMdDmaeDKYuCyky1Bo5BjHY1/NVHbY=";
  };

  cargoSha256 = "sha256-<actual-hash>"; # Replace with the hash from the error message

  nativeBuildInputs = [ pkgs.cargo ];

  buildPhase = ''
    cargo build --release --no-default-features --features=wayland
  '';

  meta = with pkgs.lib; {
    description = "A highly customizable Wayland compositor";
    platforms = platforms.linux;
  };
}
