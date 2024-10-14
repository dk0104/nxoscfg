{config, ...}:{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      v = "nvim";
    };
    initExtra = ''
     eval "$(zoxide init zsh --cmd cd)"
     export MOZ_ENABLE_WAYLAND=1
     export TERM="xterm-256color"
    '';
    oh-my-zsh = {
    enable = true;
    plugins = [ 
      "git"
       "alias-finder"
       "aliases"
       "colemak"
       "eza"
       "fzf"
       "helm"
       "tmux"
       "kubectl"
       "ssh"
       "starship"
       "emacs"
       "helm"
       "kubectl"
       "pass"
       "taskwarrior"
       "tmuxinator"
        ];
    #theme = "starship";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}
