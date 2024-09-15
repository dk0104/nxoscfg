{ config, lib, pkgs, ... }:
let

in {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    historyLimit = 100000;
    baseIndex = 1;


    plugins = with pkgs;
    [

      # catppuccin
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor 'mocha' # latte,frappe, macchiato or mocha
          set -g @catppuccin_window_left_separator "█"
          set -g @catppuccin_window_right_separator "█ "
          set -g @catppuccin_window_number_position "right"
          set -g @catppuccin_window_middle_separator "  █"
          set -g @catppuccin_window_status "icon"
          set -g @catppuccin_window_default_fill "number"
          set -g @catppuccin_window_default_text "#W"

          set -g @catppuccin_window_current_fill "number"
          set -g @catppuccin_window_current_text "#W"

          set -g @catppuccin_status_modules_right "directory application session date_time battery "
          set -g @catppuccin_status_left_separator "█"
          set -g @catppuccin_status_right_separator "█"
          set -g @catppuccin_date_time_text "%Y-%m-%d %H:%M:%S"
          set -g @catppuccin_status_connect_separator "yes"
          set -g @catppuccin_icon_window_last "󰖰"
          set -g @catppuccin_icon_window_current "󰖯"
          set -g @catppuccin_icon_window_zoom "󰁌"
          set -g @catppuccin_icon_window_mark "󰃀"
          set -g @catppuccin_icon_window_silent "󰂛"
          set -g @catppuccin_icon_window_activity "󱅫"
          set -g @catppuccin_icon_window_bell "󰂞"
        '';
      }

      # resurect
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-vim 'session'
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }

      ## continuum
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-boot 'on'
          set -g @continuum-save-interval '10'
        '';
      }

      # logging
      {
        plugin = tmuxPlugins.logging;
        extraConfig = ''
          set -g @logging-path "/home/dk/tmux_log/"
        '';
      }


      tmuxPlugins.sensible
      tmuxPlugins.battery
      tmuxPlugins.fingers
      tmuxPlugins.yank
      tmuxPlugins.tmux-fzf
    ];
    extraConfig = ''
      # unbind C-b
      set-option -g prefix C-a
      unbind-key C-b
      bind-key C-a send-prefix

      # split panes using | -
      bind | split-window -h
      bind - split-window -v
      unbind '"'
      unbind %

      # basic setup
      # Use vim keybindings in copy mode
      set-window-option -g mode-keys vi

      # Escape turns on copy mode
      bind Escape copy-mode

      bind-key x kill-pane
      setw -g aggressive-resize on
      set -g status-position top
      bind r source-file ~/.config/tmux/tmux.conf
      TMUX_FZF_LAUNCH_KEY="C-k"
    '';
  };
}
