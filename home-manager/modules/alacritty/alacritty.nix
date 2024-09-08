{
    home.file.".config/alacritty/catppuccin-mocha.toml".source = ./catppuccin-mocha.toml;
    programs.alacritty = {
      enable = true;
      settings = {
        import = [
          "~/.config/alacritty/catppuccin-mocha.toml"
        ];
        window.opacity = 0.95;
        env = {
          TERM = "xterm-256color";
        };

        font = {
          size = 11.0;
          normal = {
            family = "JetBrains Mono ";
          };
        };
    };
  };
}
