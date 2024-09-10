{ pkgs, hyprland,lib, ...}:{
  imports = [
    ./modules/bundle.nix
    hyprland.homeManagerModules.default
  ];

  home = {
    username = "dk";
    homeDirectory = lib.mkDefault "/home/dk";
    stateVersion = "24.11";
    packages = (with pkgs; [
      # network and io
      blueman
      bluetuith
      networkmanagerapplet

      # wm
      hypridle
      hyprlandPlugins.hy3
      hyprlandPlugins.hyprexpo
      hyprlock
      wlogout
      nwg-displays
      nwg-dock-hyprland
      nwg-drawer
      nwg-launchers
      nwg-look
      seatd
      sway
      swww
      walker
      waybar
      xfce.xfce4-power-manager

      # Desktop apps
      alacritty
      audacity
      brave
      mako
      foot
      obsidian
      wofi
      xfce.thunar
      xfce.thunar-volman

      # GUI utils
      archi
      dmenu
      feh
      flameshot
      imv
      jameica
      screenkey
      simplescreenrecorder

      # Editor
      emacs
      vscode
      eclipses.eclipse-sdk

      # Audio and Media tools
      pavucontrol
      pamixer
      radioboat
      mplayer
      vlc

      # Messenger and chat
      telegram-desktop

      # Themes
      papirus-icon-theme

      # CLI utils
      bat
      cava
      brightnessctl
      cheat
      eza
      fastfetch
      fd
      ffmpeg
      file
      fzf
      git
      htop
      lazygit
      libtool
      light
      lux
      mediainfo
      neofetch
      nix-index
      openssl
      pass
      pet
      portal
      ripgrep
      scrot
      silver-searcher
      starship
      tmux
      tree
      unzip
      vim
      wget
      xclip
      yazi
      yq-go
      zathura
      zip
      zoxide
      zram-generator

      # virtualisation
      virtualbox

      # Java
      swt
    ]);
  };
  programs.home-manager.enable = true;
}
