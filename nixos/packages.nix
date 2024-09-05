{inputs, pkgs, ...}:{
    nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };
  programs = {
};

  environment.systemPackages = with pkgs; [
    # Desktop apps
    audacity
    telegram-desktop
    alacritty
    wofi
    obsidian
    brave
    vscode
    mako


    # Coding stuff
    gnumake
    gcc
    cmake
    nodejs
    python
    (python3.withPackages (ps: with ps; [ requests ]))

    # CLI utils
    neofetch
    file
    tree
    wget
    git
    fastfetch
    htop
    nix-index
    unzip
    scrot
    ffmpeg
    light
    lux
    mediainfo
    zram-generator
    cava
    zip
    brightnessctl
    openssl
    lazygit
    fzf
    vim
    tmux

    # HW and drives
    bluez
    bluez-tools

    # GUI utils
    feh
    imv
    dmenu
    screenkey
    flameshot

    # Wayland stuff
    xwayland
    wl-clipboard
    cliphist
    hyprlandPlugins.hyprexpo
    #hyprlandPlugins.hy3
    walker
   # hyprland

    # WMs and stuff
    seatd
    waybar
    swww

    # Sound
    pipewire
    pulseaudio
    pamixer

    # GPU stuff 
    amdvlk
    rocm-opencl-icd
    glaxnimate

    # Other
    home-manager
    spice-vdagent
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    fira-code-nerdfont
    swaycons
    nerdfonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
}
