# sddm-theme_sugar-dark.nix

{ pkgs }:

let
	imgLink = "https://images.pexels.com/photos/733148/pexels-photo-733148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";

	image = pkgs.fetchurl {
		url = imgLink;
		hash = "sha256-XEKw+ktHcEZKEMB1jH6TxwewQglZ+k8mYw+BgsVFK9o=";
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
