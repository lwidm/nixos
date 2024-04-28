# sddm-theme_sugar-dark.nix

{ pkgs }:

let
	imgLink = "https://raw.githubusercontent.com/NixOs/nixos-artwork/master/wallpapers/nix-wallpaper-nineish-solarized-light.png";

	image = pkgs.fetchurl {
	  url = imgLink;
	  hash = pkgs.lib.fakeSha256;
	};
in
pkgs.stdenv.mkDerivation {
	name = "sddm-theme_sugar-dark";
	src = pkgs.fetchFromGitHub {
	  owner = "MarianArlt";
	  repo = "sddm-sugar-dark";
	  rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
	  hash = "sha256-flOspjpYezPvGZ6b4R/Mr18N7N3JdytCSwwu6mf4owQ=";
	};
	installPhase = ''
		mkdir -p $out
		cp -R ./* $out/
		cd $out/
		rm Background.jpg
		cp -r ${image} $out/Background.png
	'';
}
