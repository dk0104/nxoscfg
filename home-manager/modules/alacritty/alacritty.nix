{
    home.file.".config/alacritty/catppuccin-mocha.toml".source = ./catppuccin-mocha.toml;
    programs.alacritty = {
      enable = true;
      settings = {
        import = [
          "~/.config/alacritty/catppuccin-mocha.toml"
        ];
        window.opacity = 0.90;
        env = {
          TERM = "xterm-256color";
        };

        font = {
          size = 10.0;
          normal = {
            family = "Hack Nerd Font";
          };
        };
    };
  };
}
