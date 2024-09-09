{inputs, pkgs, ...}:{
    nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };
  programs = {
};

  environment.systemPackages = with pkgs; [
    # system
    home-manager
    git

    # Coding
    (python3.withPackages (ps: with ps; [ requests ]))
    cmake
    gcc
    gnumake
    nodejs
    python

    # HW and drives
    bluez
    bluez-tools

    # Wayland stuff
    cliphist
    wl-clipboard
    xwayland

    # Sound
    pipewire
    pulseaudio

    # GPU stuff
    amdvlk
    glaxnimate
    rocm-opencl-icd

    # Other
    spice-vdagent
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    killall
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    fantasque-sans-mono
    fira-code-nerdfont
    font-awesome
    iosevka
    jetbrains-mono
    nerdfonts
    noto-fonts
    noto-fonts-emoji
    powerline-fonts
    powerline-symbols
    swaycons
    twemoji-color-font
  ];
}
