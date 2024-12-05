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
          set -g @catppuccin_window_status_style "slanted"
          
          # Make the status line pretty and add some modules
          set -g status-right-length 100
          set -g status-left-length 100
          set -g status-left ""
          set -g status-right "#{E:@catppuccin_status_application}"
          set -agF status-right "#{E:@catppuccin_status_cpu}"
          set -ag status-right "#{E:@catppuccin_status_session}"
          set -ag status-right "#{E:@catppuccin_status_uptime}"
          set -agF status-right "#{E:@catppuccin_status_battery}"

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
      tmuxPlugins.fzf-tmux-url
      tmuxPlugins.cpu
      tmuxPlugins.mode-indicator
      tmuxPlugins.extrakto

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
