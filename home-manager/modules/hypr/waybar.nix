{
  home.file.".config/waybar/scripts" = {
    source = ./waybar_scripts;
    recursive = true;
    executable = true;
  };
  home.file.".config/waybar/mocha.css".source = ./hyprthemes/mocha.css



  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "9 13 -10 18";

        modules-left = ["wlr/workspaces" "hyprland/language" "keyboard-state" "hyprland/submap"];
        modules-center = ["clock"];
        modules-right = ["pulseaudio" "custom/mem" "cpu" "battery" "tray"];

        "wlr/workspaces" = {
          disable-scroll = true;
          sort-by-name = true;
          format = "{icon} ";
          format-icons = {
            default = "";
          };
        };


        "hyprland/language" = {
          format-en = "US";
          format-ru = "RU";
	      min-length = 5;
	      tooltip = false;
        };

        "keyboard-state" = {
          #numlock = true;
          capslock = true;
          format = "{icon} ";
          format-icons = {
            locked = " ";
            unlocked = "";
          };
        };

        "clock" = {
          # timezone = "America/New_York";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format = "{:%a; %d %b, %I:%M %p}";
        };

        "custom/weather" = {
          format = "{}";
          tooltip = true;
          interval = 1800;
          exec = "$HOME/.config/waybar/scripts/wttr.py";
          return-type = "json";
        };

        "pulseaudio" = {
          # scroll-step = 1; # %, can be a float
          reverse-scrolling = 1;
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
          on-click = "pavucontrol";
          min-length = 13;
        };

        "custom/mem" = {
          format = "{} ";
          interval = 3;
          exec = "free -h | awk '/Mem:/{printf $3}'";
          tooltip = false;
        };

        "cpu" = {
          interval = 2;
          format = "{usage}% ";
          min-length = 6;
        };

        "temperature" = {
          # thermal-zone = 2;
          # hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 80;
          # format-critical = "{temperatureC}°C {icon}";
          format = "{temperatureC}°C {icon}";
          format-icons = ["" "" "" "" ""];
          tooltip = false;
        };

        "backlight" = {
          device = "intel_backlight";
          format = "{percent}% {icon}";
          format-icons = [""];
          min-length = 7;
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = ["" "" "" "" "" "" "" "" "" ""];
	      on-update = "$HOME/.config/waybar/scripts/check_battery.sh";
        };

        tray = {
          icon-size = 16;
          spacing = 0;
        };

       custom/power = {
        tooltip = false;
        on-click = "wlogout &";
        format = "襤";
    }

      };
    };

    style = 
    ''
@import "mocha.css";

        * {
        font-family: FantasqueSansMono Nerd Font;
        font-size: 16px;
        min-height: 0;
        }

        #waybar {
        background: transparent;
        color: @text;
        margin: 5px 5px;
        }

        #workspaces {
        border-radius: 1rem;
        margin: 5px;
        background-color: @surface0;
        margin-left: 1rem;
        }

        #workspaces button {
        color: @lavender;
        border-radius: 1rem;
        padding: 0.4rem;
        }

        #workspaces button.active {
        color: @sky;
        border-radius: 1rem;
        }

        #workspaces button:hover {
        color: @sapphire;
        border-radius: 1rem;
        }

        #custom-music,
        #tray,
        #backlight,
        #clock,
        #battery,
        #pulseaudio,
        #custom-lock,
        #custom-power {
        background-color: @surface0;
        padding: 0.5rem 1rem;
        margin: 5px 0;
        }

        #clock {
        color: @blue;
        border-radius: 0px 1rem 1rem 0px;
        margin-right: 1rem;
        }

        #battery {
        color: @green;
        }

        #battery.charging {
        color: @green;
        }

        #battery.warning:not(.charging) {
        color: @red;
        }

        #backlight {
        color: @yellow;
        }

        #backlight, #battery {
            border-radius: 0;
        }

        #pulseaudio {
        color: @maroon;
        border-radius: 1rem 0px 0px 1rem;
        margin-left: 1rem;
        }

        #custom-music {
        color: @mauve;
        border-radius: 1rem;
        }

        #custom-lock {
            border-radius: 1rem 0px 0px 1rem;
            color: @lavender;
        }

        #keyboard-state {
        margin-right: 8px;
        padding-right: 16px;
        border-radius: 0px 10px 10px 0px;
        transition: none;
        color: @maroon;
        background: @surface0;
        }

        #custom-power {
            margin-right: 1rem;
            border-radius: 0px 1rem 1rem 0px;
            color: @red;
        }

        #tray {
        margin-right: 1rem;
        border-radius: 1rem;
        }

        * {
        border: none;
        border-radius: 0;
        /* `otf-font-awesome` is required to be installed for icons */
        font-family: JetBrains Mono;
        font-weight: bold;
        min-height: 20px;
        }

        window#waybar {
        background: transparent;
        }

        window#waybar.hidden {
        opacity: 0.2;
        }

        #workspaces {
        margin-right: 8px;
        border-radius: 10px;
        transition: none;
        background: #383c4a;
        }

        #workspaces button {
        transition: none;
        color: #7c818c;
        background: transparent;
        padding: 5px;
        font-size: 18px;
        }

        #workspaces button.persistent {
        color: #7c818c;
        font-size: 12px;
        }

        /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
        #workspaces button:hover {
        transition: none;
        box-shadow: inherit;
        text-shadow: inherit;
        border-radius: inherit;
        color: #383c4a;
        background: #7c818c;
        }

        #workspaces button.active {
        background: #4e5263;
        color: white;
        border-radius: inherit;
        }

        #language {
        padding-left: 16px;
        padding-right: 8px;
        border-radius: 10px 0px 0px 10px;
        transition: none;
        color: @blue;
        background: @surface0;
        }

        #keyboard-state {
        margin-right: 8px;
        padding-right: 16px;
        border-radius: 0px 10px 10px 0px;
        transition: none;
        color: @green;
        background: @surface0;
        }


        #clock {
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px 0px 0px 10px;
        transition: none;
        color: @mauve;
        background: @surface0;
        }

        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: @teal;
        background: @surface0;
        }

        #pulseaudio.muted {
        background-color: @red;
        color: @surface0;
        }

        #custom-mem {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: @sky;
        background: @surface0;
        }

        #cpu {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: @text;
        background: @surface0;
        }

        #temperature {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
        }

        #temperature.critical {
        background-color: #eb4d4b;
        }

        #backlight {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
        }

        #battery {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: @text;
        background: @surface0;
        }

        #battery.charging {
        color: @green;
        background-color: @surface0;
        }

        #battery.warning:not(.charging) {
        background-color: @surface0;
        color: @pink;
        }

        #battery.critical:not(.charging) {
        background-color: #f53c3c;
        color: #ffffff;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
        }

        #tray {
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: @text;
        background: @surface0;
        }

        @keyframes blink {
        to {
        background-color: #ffffff;
        color: #000000;
        }
        }
    '';
  };
}
