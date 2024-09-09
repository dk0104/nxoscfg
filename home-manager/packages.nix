{ config, lib, pkgs, ... }:

with pkgs;
let shared-packages = import ../nixos/packages.nix {inherit pkgs;}; in
shared-packages ++ [

  # app and package management
  home-manager

  # network and io
  blueman
  networkmanagerapplet

  # wm
  hypridle
  hyprlandPlugins.hy3
  hyprlandPlugins.hyprexpo
  hyprlock
  nwg-displays
  nwg-dock-hyprland
  nwg-drawer
  nwg-launchers
  nwg-look
  seatd
  sway
  sww
  walker
  waybar
  xfce.xfce4-power-manager

  # Desktop apps
  alacritty
  audacity
  brave
  mako
  obsidian
  wofi

  # GUI utils
  archi
  dmenu
  feh
  flameshot
  imv
  screenkey
  simplescreenrecorder

  # Editor
  emacs
  vscode

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
  zip
  zoxide
  zram-generator
]
