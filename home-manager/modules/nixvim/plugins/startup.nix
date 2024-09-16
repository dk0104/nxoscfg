{
  programs.nixvim = {
    plugins.startup = {
      enable = true;

      # colors = {
      #   background = "#ffffff";
      #   foldedSection = "#ffffff";
      # };

      sections = {
        header = {
          type = "text";
          oldfilesDirectory = false;
          align = "center";
          foldSection = false;
          title = "Header";
          margin = 5;
          content = [
"                 ...            _            .                         "
"             .xH8%^````%.      u            @88>       .XH88%          "
"             x888~ xnHhx. *.   88Nu.   u.    %8P      ##########.      "
"           X888X 8**8888k `.   8888.o888c    .     .888: x888  x888.   "
"           8888X<~  `8888L !   8888  8888   @88u    8888  888X ?888f   "
"           88888!   .!8*`` ^   8888  8888   888E    X888  888X '888>   "
"           ^88888!=*888x       8888  8888   888E    X888  888X '888>   "
"            `*8888  8888L      8888  8888   888E    X888  888X '888>   "
"           .x.`888X X888X      8888b.888P   888E    X888  888X '888>   "
"           '888> %8X !8888..-   ^Y8888*''   888&    *88%  *88# '888!   "
"           '888   8  '8888%`      `Y`       R881     `~    *    `*`    "
"             *==*  __  **                    YY                        "
          ];
          highlight = "Statement";
          defaultColor = "";
          oldfilesAmount = 0;
        };

        body = {
          type = "mapping";
          oldfilesDirectory = false;
          align = "center";
          foldSection = false;
          title = "Menu";
          margin = 5;
          content = [
            [
              " Find File"
              "Telescope find_files"
              "ff"
            ]
            [
              "󰍉 Find Word"
              "Telescope live_grep"
              "fg"
            ]
            [
              " Recent Files"
              "Telescope oldfiles"
              "p"
            ]
            [
              " File Browser"
              "Telescope file_browser"
              "fb"
            ]

          ];
          highlight = "string";
          defaultColor = "";
          oldfilesAmount = 0;
        };
      };

      options = {
        paddings = [1 3];
      };

      parts = [
        "header"
        "body"
      ];
    };
  };
}
