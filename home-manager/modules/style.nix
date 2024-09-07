{lib , pkgs ,inputs,stylix, ...} :
{
  stylix = {
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/da-one-sea.yaml";
    image = ./../assets/retro-boat.jpg;
    polarity = "dark";
  };
}
