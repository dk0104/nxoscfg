{ config, lib, pkgs, ... }:
let

in {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    historyLimit = 100000;

    plugins = with pkgs;
      [
        tmuxPlugins.fingers
        tmuxPlugins.sensible
        {
          plugin = tmuxPlugins.resurrect;
          extraConfig = ''
            set -g @resurrect-strategy-vim 'session'
            set -g @resurrect-strategy-nvim 'session'
            set -g @resurrect-capture-pane-contents 'on'
          '';
        }
        {
          plugin = tmuxPlugins.continuum;
          extraConfig = ''
            set -g @continuum-restore 'on'
            set -g @continuum-boot 'on'
            set -g @continuum-save-interval '10'
          '';
        }
        {
          plugin = tmuxPlugins.logging;
          extraConfig = ''
            set -g @loggin-path "/home/dk/tmux_log/"
         '';
        }

        tmuxPlugins.yank
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

      set -g base-index 1
      bind-key x kill-pane
      setw -g aggressive-resize on
      set -g status-position top
      bind r source-file ~/.config/tmux/tmux.conf

    '';
  };
}
