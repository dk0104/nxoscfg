{pkgs ,inputs,  ...}:
{
  home.file.".config/hypr/mocha.conf".source = ./hyprthemes/mocha.conf;
  home.file.".config/nwg-dock-hyprland/style.css".source = ./hyprthemes/dock.css;
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
     enable = true;
     };


    settings = {
      "source"="~/.config/hypr/mocha.conf";
      "$mainMod" = "SUPER";
      "$launcher" = "walker";


      monitor = [ 
      "eDP,1920x1080@90,auto,1"
      "HDMI-A-1,2560x1440@59.95,auto,1,transform, 2"
      "desc:Samsung Electric Company LC49G95T H4ZR300052,preferd,auto,1"
      ];

      # plugin = {
        #   hyprexpo = {
          #   	columns = 3;
          #   	gap_size = 5;
          #   	bg_col = "rgb(111111)";
          #   	workspace_method = "center current"; # [center/first] [workspace] e.g. first 1 or center m+1

          #   	enable_gesture = true; # laptop touchpad
          #   	gesture_fingers = 3;  # 3 or 4
          #   	gesture_distance = 300; # how far is the "max"
          #   	gesture_positive = true; # positive = swipe down. Negative = swipe up.
          #  };

          env = [
            "XDG_CURRENT_DESKTOP,Hyprland"
            "XDG_SESSION_TYPE,wayland"
            "XDG_SESSION_DESKTOP,Hyprland"
            "XCURSOR_SIZE,24"
            "QT_QPA_PLATFORM,wayland"
            "XDG_SCREENSHOTS_DIR,~/screens"
          ];


          debug = {
            disable_logs = false;
            enable_stdout_logs = true;
          };

          input = {
            kb_layout = "us,us,ru";
            kb_variant = "colemak,";
            kb_options = "grp:alt_shift_toggle,ctrl:nocaps";
            follow_mouse = 1;

            touchpad = {
              natural_scroll = false;
            };

            sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
          };

          general = {
            gaps_in = 5;
            gaps_out = 10;
            border_size = 3;
            "col.active_border" = "$sky";
            "col.inactive_border" = "$surface0";
            #"col.group_border_active" = "$flamingo";
            #"col.group_border" = "$surface0";

            layout = "dwindle";
            #no_cursor_warps = false;
          };

          decoration = {
            rounding = 10;

            blur = {
              enabled = true;
              size = 16;
              passes = 2;
              new_optimizations = true;
            };

            drop_shadow = true;
            shadow_range = 4;
            shadow_render_power = 3;
            "col.shadow" = "$surface0";
            "col.shadow_inactive" = "$surface0";
          };

          animations = {
            enabled = true;

            bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

            animation = [
              "windows,     1, 7,  myBezier"
              "windowsOut,  1, 7,  default, popin 80%"
              "border,      1, 10, default"
              "borderangle, 1, 8,  default"
              "fade,        1, 7,  default"
              "workspaces,  1, 6,  default"
            ];
          };

          dwindle = {
            pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
            preserve_split = true; # you probably want this
          };

          master = {
            new_on_top = true;
          };

          gestures = {
            workspace_swipe = true;
            workspace_swipe_fingers = 3;
            workspace_swipe_invert = false;
            workspace_swipe_distance = 200;
            workspace_swipe_forever = true;
          };

          misc = {
            animate_manual_resizes = true;
            animate_mouse_windowdragging = true;
            enable_swallow = true;
            render_ahead_of_time = false;
            disable_hyprland_logo = true;
          };

          windowrule = [
            "float, ^(imv)$"
            "float, ^(mpv)$"
          ];
          windowrulev2 = [
            "float, class:^(FootFloating)$"
          ];

          exec-once = [
            "swww-daemon "
            "swww img ~/wallpapers/landscapes/forrest.png"
            "waybar"
            "wl-paste --type text --watch cliphist store"
            "wl-paste --type image --watch cliphist store"
            "nm-applet"
            "bluemann-applet"
            "hypridle"
            "nwg-dock-hyprland -p left  -i 18  "
            "foot --server"
            "nwggrid-server"
            "exec-once=systemctl --user start plasma-polkit-agent"
          ];

          bind = [
            "$mainMod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"

            "$mainMod, Return, exec, footclient"
            "$mainMod SHIFT,Return, exec, footclient --class FootFloating"
            "$mainMod, grave, exec, $launcher"
            "$mainMod SHIFT,grave,exec, nwggrid "
            "$mainMod, Q, killactive,"
            "$mainMod CTRL, M, exit,"
            "$mainMod, F, togglefloating,"
            "$mainMod, P, pseudo, # dwindle"
            "$mainMod, J, togglesplit, # dwindle"

            # Move focus with mainMod + arrow keys
            "$mainMod, left,  movefocus, l"
            "$mainMod, right, movefocus, r"
            "$mainMod, up,    movefocus, u"
            "$mainMod, down,  movefocus, d"

            "$mainMod, N,  movefocus, l"
            "$mainMod, I,  movefocus, r"
            "$mainMod, U,  movefocus, u"
            "$mainMod, E,  movefocus, d"

            # Moving windows
            "$mainMod SHIFT, left,  swapwindow, l"
            "$mainMod SHIFT, right, swapwindow, r"
            "$mainMod SHIFT, up,    swapwindow, u"
            "$mainMod SHIFT, down,  swapwindow, d"

            "$mainMod SHIFT, N,  swapwindow, l"
            "$mainMod SHIFT, I,  swapwindow, r"
            "$mainMod SHIFT, U,  swapwindow, u"
            "$mainMod SHIFT, E,  swapwindow, d"

            # Moving to special workspace
            "$mainMod CTRL, S , movetoworkspace,special:tools"
            "$mainMod ,S,togglespecialworkspace,tools"

            "$mainMod CTRL, R , movetoworkspace,special:msg"
            "$mainMod ,R,togglespecialworkspace,msg"

            # Window resizing                     X  Y
            "$mainMod CTRL, left,  resizeactive, -60 0"
            "$mainMod CTRL, right, resizeactive,  60 0"
            "$mainMod CTRL, up,    resizeactive,  0 -60"
            "$mainMod CTRL, down,  resizeactive,  0  60"

            # Switch workspaces with mainMod + [0-9]
            "$mainMod, 1, workspace, 1"
            "$mainMod, 2, workspace, 2"
            "$mainMod, 3, workspace, 3"
            "$mainMod, 4, workspace, 4"
            "$mainMod, 5, workspace, 5"
            "$mainMod, 6, workspace, 6"
            "$mainMod, 7, workspace, 7"
            "$mainMod, 8, workspace, 8"
            "$mainMod, 9, workspace, 9"
            "$mainMod, 0, workspace, 10"

            # Move active window to a workspace with mainMod + SHIFT + [0-9]
            "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
            "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
            "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
            "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
            "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
            "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
            "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
            "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
            "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
            "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

            # Scroll through existing workspaces with mainMod + scroll
            "$mainMod, mouse_down, workspace, e+1"
            "$mainMod, mouse_up, workspace, e-1"

            # Keyboard backlight
            "$mainMod, F3, exec, brightnessctl -d *::kbd_backlight set +33%"
            "$mainMod, F2, exec, brightnessctl -d *::kbd_backlight set 33%-"

            # Volume and Media Control
            ", XF86AudioRaiseVolume, exec, pamixer -i 5 "
            ", XF86AudioLowerVolume, exec, pamixer -d 5 "
            ", XF86AudioMute, exec, pamixer -t"
            ", XF86AudioMicMute, exec, pamixer --default-source -m"

            # Brightness control
            ", XF86MonBrightnessDown, exec, brightnessctl set 5%- "
            ", XF86MonBrightnessUp, exec, brightnessctl set +5% "

            # Waybar
            "$mainMod, B, exec, pkill -SIGUSR1 waybar"
            "$mainMod, W, exec, pkill -SIGUSR2 waybar"

          ];

          # Move/resize windows with mainMod + LMB/RMB and dragging
          bindm = [
            "$mainMod, mouse:272, movewindow"
            "$mainMod, mouse:273, resizewindow"
          ];
    };
  };
}
