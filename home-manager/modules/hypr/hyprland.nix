{
 wayland.windowManager.hyprland = {
    enable = true;
    xwayland= {
       enable = true;
    };

    settings = {
      "$mainMod" = "SUPER";
      "$launcher" = "walker";

      monitor = [ 
        "eDP,1920x1080@90,auto,1"
        "HDMI-A-1,2560x1440@59.95,auto,2,transform, 2"
     ];

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XCURSOR_SIZE,36"
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
        gaps_out = 20;
        border_size = 3;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "hy3";
        #no_cursor_warps = false;
      };

      decoration = {
        rounding = 5;

        blur = {
          enabled = true;
          size = 7;
          passes = 4;
          noise = 0.008;
          contrast = 0.8916;
          brightness = 0.8;
          new_optimizations = true;
        };

        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = true;

        bezier = [ 
            "windowIn, 0.06, 0.71, 0.20, 1.0"
            "windowResize, 0.04, 0.67, 0.38, 1.0"
        ];

        animation = [
          "windowsIn,   1, 3,  windowIn, slide #popin 20%"
          "windowsOut,  1, 3,  windowIn, slide #popin 70%"
          "windowsMove, 1, 3, windowResize"
          "border,      1, 10, default"
          "borderangle, 1, 8,  default"
          "fade,        1, 3,  default"
          "workspaces,  1, 6,  default"
          "layers,      1, 5,  windowIn, slide"
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
        vrr = 1;
        render_ahead_of_time = false;
        disable_hyprland_logo = true;
      };
      plugin = {
        hy3 = {
          tabs = {
            height = 2;
            padding = 6;
            render_text = false;
          };
          autohide = {
            enable = true;
            trigger_width = 800;
            trigger_height = 500;
          };
      
        };
        hyprexpo = {
         columns = 3;
         gap_size = 5;
         bg_col = "rgb(111111)";
         workspace_method = "center current"; 
         enable_gesture = true; 
         gesture_fingers = 3;
         gesture_distance = 300;
         gesture_positive = true;
        };
     };

    layerrule = [
      " blur, test"
      "ignorezero, test"
      "noanim, test"

      "blur, wofi"
      "ignorezero, wofi"
      "noanim, ^(selection)$"

      "blur, termspawner"
      "ignorezero, termspawner"
      "noanim, termspawner"

      "animation fade, shell:background"

      "blur, shell:bar"
      "blurpopups, shell:bar"
      "ignorezero, shell:bar"
      "noanim, shell:bar"

      "noanim, shell:screenshot"

      "blur, walker"
      "ignorezero, walker"
      "animation popin 90%, walker"
     ];
     
     windowrulev2 = [
       "float, class:^(AlacrittyFloating)$"
     ];
     

      windowrule = [
        "float, ^(imv)$"
        "float, ^(mpv)$"
      ];

      exec-once = [
        "swww-daemon "
        "swww img ~/wallpapers/os/nix-black-4k.png"
        "waybar"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      bind = [
        "$mainMod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"

        "$mainMod, Return, exec, alacritty"
        "$mainMod+SHIFT, Return, exec, alacritty --class AlacrittyFloating"
        "$mainMod, grave, exec, $launcher"
        "$mainMod+SHIFT, Q, hy3:killactive,"
        
        "$mainMod, f, fullscreen, 1"
        "$mainMod+SHIFT, f, fullscreen, 0"
        "$mainMod+SHIFT, tab, togglefloating"

        
        # hy3 groups
	" $mainMod, s, hy3:makegroup, h"
	" $mainMod, r, hy3:makegroup, v"
	" $mainMod, z, hy3:makegroup, tab"
	" $mainMod, a, hy3:changefocus, raise"
	" $mainMod+SHIFT, a, hy3:changefocus, lower"
	" $mainMod, e, hy3:expand, expand"
	" $mainMod+SHIFT, e, hy3:expand, base"
	" $mainMod, p, hy3:changegroup, opposite"
        
        # cursor
        "$mainMod, q, hy3:warpcursor"

        # expo
        "$mainMod+SHIFT, grave, hyprexpo:expo"

        # Move focus with mainMod + arrow keys
       " $mainMod, n, hy3:movefocus, l"
       " $mainMod, e, hy3:movefocus, d"
       " $mainMod, u, hy3:movefocus, u"
       " $mainMod, i, hy3:movefocus, r"
       " $mainMod, left, hy3:movefocus, l"
       " $mainMod, down, hy3:movefocus, d"
       " $mainMod, up, hy3:movefocus, u"
       " $mainMod, right, hy3:movefocus, r"

       " $mainMod + CONTROL, n, hy3:movefocus, l, visible, nowarp"
       " $mainMod + CONTROL, e, hy3:movefocus, d, visible,nowarp"
       " $mainMod + CONTROL, u, hy3:movefocus, u, visible,nowarp"
       " $mainMod + CONTROL, i, hy3:movefocus, r, visible,nowarp"
       " $mainMod, left, hy3:movefocus, l"
       " $mainMod, down, hy3:movefocus, d"
       " $mainMod, up, hy3:movefocus, u"
       " $mainMod, right, hy3:movefocus, r"

        # Moving windows
	"$mainMod+SHIFT, h, hy3:movewindow, l, once"
	"$mainMod+SHIFT, j, hy3:movewindow, d, once"
	"$mainMod+SHIFT, k, hy3:movewindow, u, once"
	"$mainMod+SHIFT, l, hy3:movewindow, r, once"
	"$mainMod+SHIFT, left, hy3:movewindow, l, once"
	"$mainMod+SHIFT, down, hy3:movewindow, d, once"
	"$mainMod+SHIFT, up, hy3:movewindow, u, once"
	"$mainMod+SHIFT, right, hy3:movewindow, r, once"

	"$mainMod+CONTROL+SHIFT, h, hy3:movewindow, l, once, visible"
	"$mainMod+CONTROL+SHIFT, j, hy3:movewindow, d, once, visible"
	"$mainMod+CONTROL+SHIFT, k, hy3:movewindow, u, once, visible"
	"$mainMod+CONTROL+SHIFT, l, hy3:movewindow, r, once, visible"
	"$mainMod+CONTROL+SHIFT, left, hy3:movewindow, l, once, visible"
	"$mainMod+CONTROL+SHIFT, down, hy3:movewindow, d, once, visible"
	"$mainMod+CONTROL+SHIFT, up, hy3:movewindow, u, once, visible"
	"$mainMod+CONTROL+SHIFT, right, hy3:movewindow, r, once, visible"

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
        "$mainMod SHIFT, 1, hy3:movetoworkspace, 1"
        "$mainMod SHIFT, 2, hy3:movetoworkspace, 2"
        "$mainMod SHIFT, 3, hy3:movetoworkspace, 3"
        "$mainMod SHIFT, 4, hy3:movetoworkspace, 4"
        "$mainMod SHIFT, 5, hy3:movetoworkspace, 5"
        "$mainMod SHIFT, 6, hy3:movetoworkspace, 6"
        "$mainMod SHIFT, 7, hy3:movetoworkspace, 7"
        "$mainMod SHIFT, 8, hy3:movetoworkspace, 8"
        "$mainMod SHIFT, 9, hy3:movetoworkspace, 9"
        "$mainMod SHIFT, 0, hy3:movetoworkspace, 10"

        # focustab
	"$mainMod+CONTROL, 1, hy3:focustab, index, 01"
	"$mainMod+CONTROL, 2, hy3:focustab, index, 02"
	"$mainMod+CONTROL, 3, hy3:focustab, index, 03"
	"$mainMod+CONTROL, 4, hy3:focustab, index, 04"
	"$mainMod+CONTROL, 5, hy3:focustab, index, 05"
	"$mainMod+CONTROL, 6, hy3:focustab, index, 06"
	"$mainMod+CONTROL, 7, hy3:focustab, index, 07"
	"$mainMod+CONTROL, 8, hy3:focustab, index, 08"
	"$mainMod+CONTROL, 9, hy3:focustab, index, 09"
	"$mainMod+CONTROL, 0, hy3:focustab, index, 10"

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
      bindn = [
       ", mouse:272, hy3:focustab, mouse"
       ", mouse_down, hy3:focustab, l, require_hovered"
       ", mouse_up, hy3:focustab, r, require_hovered"
      ];
    };
  };
}
