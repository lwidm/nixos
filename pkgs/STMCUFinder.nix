{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkDerivation rec {
  pname = "STMCUFinder";
  version = "v6.1.0";

  meta = {
    description = "The ST-MCU-FINDER-PC application allows exploring and connecting to the complete portfolio of STM32 Arm® Cortex®-M, STM32 Arm® Cortex®-A7, and STM8 microcontrollers, microprocessors, development boards and examples directly from the developer’s desktop environment.";
    homepage = "https://www.st.com/en/development-tools/st-mcu-finder-pc.html";
  };

  src = ../../assets/en.st-mcu-finderlin-v6-1-0.zip;

  buildInputs = with pkgs; [
    unzip
    sudo
  ];

  buildPhase = ''
    mkdir -p $out
    cd $out
    unzip $src -d $out
    chmod 777 $out/SetupSTMCUFinder-6.1.0
  '';

  installPhase = ''
    $out/SetupSTMCUFinder-6.1.0
  '';

}
