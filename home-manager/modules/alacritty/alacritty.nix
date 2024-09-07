{
    programs.alacritty = {
      enable = true;
      home.file.".config/alacritty/catppucin-mocha.toml".source = ./catppuccin-mocha.toml;
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
            family = "Iosevka Term";
          };
          italic = {
            family = "Iosevka Slab";
          };
        };
    };
  };
}
