# sddm-theme_sugar-dark.nix

{ pkgs }:

let
	imgLink = "https://www.myswitzerland.com/-/media/dam/resources/places/frauenfeld/images winter/50773_32001800.jpeg";

	image = pkgs.fetchurl {
		url = imgLink;
		hash = "sha256-gb5s5ePdw7kuIL3SI8VVhOcLcHu0cHMJJ623vg1kz40=";
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
		cp -r ${image} $out/Background.jpg
	'';
}
