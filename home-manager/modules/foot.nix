{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [libsixel];
  programs.foot = {
    enable = true;
    settings = {
      main = {
        include = "${config.xdg.configHome}/foot/mocha.ini";
        font = "Hack Nerd Font Mono:size=10";
        font-bold = "Hack Nerd Font Mono:size=10:style=Bold";
        font-italic = "Hack Nerd Font Mono:size=10:style=Italic";
        font-bold-italic = "Hack Nerd Font Mono:size=8:style=Bold Italic";
      };
      mouse.hide-when-typing = "yes";
    };
  };
  xdg.configFile."foot/mocha.ini".text =
    builtins.readFile ../confs/foot/catppuccin-mocha.ini;
}
