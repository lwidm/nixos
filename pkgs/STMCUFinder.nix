{
  pkgs ? import <nixpkgs> { },
}:

pkgs.stdenv.mkDerivation {
  pname = "STMCUFinder";
  version = "v6.1.0";

  meta = {
    description = "The ST-MCU-FINDER-PC application allows exploring and connecting to the complete portfolio of STM32 Arm® Cortex®-M, STM32 Arm® Cortex®-A7, and STM8 microcontrollers, microprocessors, development boards and examples directly from the developer’s desktop environment.";
    homepage = "https://www.st.com/en/development-tools/st-mcu-finder-pc.html";
  };

  src = ../assets/en.st-mcu-finderlin-v6-1-0.zip;

  buildInputs = with pkgs; [
    unzip
    jre_minimal
    jdk
    patchelf
  ];
  nativeBuildInputs = with pkgs; [
    unzip
  ];
  buildPhase = ''
    mkdir -p $out 
    cd $out
    unzip $src -d $out
    chmod +x SetupSTMCUFinder-6.1.0 
  '';

  installPhase = ''
    # Create a wrapper script for the installer
    echo "#!/bin/sh" > $out/run-installer.sh
    echo "export PATH=${pkgs.jdk}/bin:\$PATH" >> $out/run-installer.sh
    echo $out/SetupSTMCUFinder-6.1.0 >> $out/run-installer.sh
    chmod +x run-installer.sh
    $out/run-installer.sh
    rm $out/run-installer
  '';
  postInstall = ''
     # Ensure Java is available when running the installed program
    mkdir -p $out/bin
    cat << 'EOF' > $out/bin/run-stmcufinder
    #!/bin/sh
    export PATH=${pkgs.jdk}/bin:$PATH
    EOF
    chmod +x $out/bin/run-stmcufinder
  '';

}
