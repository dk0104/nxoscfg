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
    oh-my-zsh = {
    enable = true;
    plugins = [ 
      "git"
       "thefuck"
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
        ];
    #theme = "starship";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}
