{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [    # packages for i3
    neovim
    tmux

    (python3.withPackages (python-pkgs: [] ))
    clang
    gnumake
    cargo
    zip
    unzip
  ];
}
