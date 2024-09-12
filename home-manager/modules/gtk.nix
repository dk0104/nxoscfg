{ config, inputs, pkgs, ... }:

{

  #   schema = pkgs.gsettings-desktop-schemas;
  # in ["${schema}/share/gsettings-schemas/${schema.name}"];

  gtk = {
    enable = true;
    theme = {
      name = "Magnetic-catppuccin";
      # package = pkgs.catppuccin-gtk.override {
        #   accents = ["pink"];
        #   variant = "mocha";
        package = pkgs.magnetic-catppuccin-gtk;
    };

    iconTheme = {
      package = pkgs.catppuccin-papirus-folders;
      name = "Papirus-Dark";
    };

    font = {
      name = "FantasqueSansMono Nerd Font";
      size = 12;
    };

    # gtk3.extraConfig = {
    #   gtk-xft-antialias = 1;
    #   gtk-xft-hinting = 1;
    #   gtk-xft-hintstyle = "hintslight";
    #   gtk-xft-rgba = "rgb";
    # };
    # gtk2.extraConfig = ''
    #   gtk-xft-antialias=1
    #   gtk-xft-hinting=1
    #   gtk-xft-hintstyle="hintslight"
    #   gtk-xft-rgba="rgb"
    # '';
  };

  # cursor theme
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 12;
  };
  #home.file."~/.icons/default".source = "${pkgs.catppuccin-cursors.mochaPink}/share/icons/Catppuccin-Mocha-Pink-Cursors";
}
