{
  config,
  pkgs,
  lib,
  hyprland,
  ...
}: {
  home.file = {
    ".config/waybar/scripts" = {
      source = ./waybar_scripts;
      recursive = true;
      executable = true;
    };

    ".config/waybar" = {
      source = ./waybar_style;
      recursive = true;
    };
  };

  programs.waybar = {
    enable = true;
    # package = hyprland.packages.${pkgs.system}.waybar-hyprland;
    settings = {
      mainBar = {
        layer = "top";
        position = "left";
        modules-left = ["hyprland/language" "clock"];
        modules-center = [];
        modules-right = ["pulseaudio" "backlight" "battery"  "tray" "custom/power"];

        "hyprland/workspaces" = {
          disable-scroll = true;
          sort-by-name = true;
          format = "{icon}";
          format-icons = {default = "";};
        };

        "hyprland/language" = {
          format-en = "US";
          format-ru = "RU";
	        min-length = 2;
	        tooltip = false;
        };

        pulseaudio = {
          format = " {icon} ";
          format-muted = "󰖁";
          format-icons = ["" "" ""];
          tooltip = true;
          tooltip-format = "{volume}%";
          on-click = "pavucontrol";
        };

        network = {
          format-wifi = "󰤨 ";
          format-disconnected = "󰤭 ";
          format-ethernet = "󰈀 ";
          tooltip = true;
          tooltip-format = "{signalStrength}%";
        };

        backlight = {
          device = "intel_backlight";
          format = "{icon}";
          format-icons = ["" "" "" "" "" "" "" "" ""];
          tooltip = true;
          tooltip-format = "{percent}%";
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}";
          format-charging = "󰂄";
          format-plugged = "󰂄";
          format-icons = ["󰂃" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          tooltip = true;
          tooltip-format = "{capacity}%";
        };

        "custom/power" = {
          tooltip = false;
          on-click = "wlogout --protocol layer-shell";
          format = "󰐥";
        };

        clock = {
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
            format-alt = ''
              {:%d
              %m
              %Y}'';
              format = ''
                {:%H
                %M}'';
        };

        tray = {
          icon-size = 21;
          spacing = 10;
        };
      };
    };

    style = ".config/waybar/style.css";
  };

}
