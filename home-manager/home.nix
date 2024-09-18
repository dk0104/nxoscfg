{ pkgs, inputs,lib, ...}:{
  imports = [
    ./modules/bundle.nix
  ];

  home = {
    username = lib.mkDefault "dk";
    homeDirectory = lib.mkDefault "/home/dk";
    stateVersion = "24.11";
    packages = (with pkgs; [
      # network and io
      blueman
      bluetuith
      networkmanager-openconnect
      networkmanagerapplet
      openconnect

      # DevOps
      efitools
      helm-dashboard
      helm-docs
      kubectl
      kubernetes-helm
      minikube

      # wm
      hypridle
      hyprlock
      lxappearance
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
      wlogout
      xfce.xfce4-power-manager

      # Desktop apps
      alacritty
      audacity
      firefox
      brave
      mako
      foot
      obsidian
      openconnect
      pcmanfm
      wofi
      xfce.thunar
      xfce.thunar-volman
      libsForQt5.polkit-kde-agent
      zotero

      # GUI utils
      archi
      dmenu
      feh
      flameshot
      imv
      jameica
      screenkey
      simplescreenrecorder

      # Editor and dev tools
      emacs
      vscode
      eclipses.eclipse-sdk
      dbeaver-bin
      go 
      gopls
      delve
      expr
      exercism

      # Audio and Media tools
      pavucontrol
      pamixer
      radioboat
      mplayer
      vlc
      wireplumber

      # Messenger and chat
      telegram-desktop

      # Themes

      # CLI utils
      bat
      bottom
      brightnessctl
      cava
      ncurses
      cheat
      dysk
      eza
      fastfetch
      fd
      ffmpeg
      file
      fzf
      git
      gnupg
      htop
      lazygit
      libtool
      light
      lux
      mbsync
      mediainfo
      msmtp
      mu
      neofetch
      nix-index
      openssl
      pass
      pass-git-helper
      passExtensions.pass-otp
      pet
      portal
      procs
      ripgrep
      scrot
      silver-searcher
      sshs
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
      maven
      jdk21
    ]);
  };
  programs = {
    home-manager.enable = true;
    gpg.enable = true;
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 34560000;
    maxCacheTtl = 34560000;
    pinentryPackage = lib.mkForce pkgs.pinentry-curses;
    enableScDaemon = false;
  };
}
