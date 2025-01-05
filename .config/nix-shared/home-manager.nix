{
  programs = {
    bat.enable = true;
    btop.enable = true;
    eza.enable = true;
    fish.enable = true;
    hyfetch.enable = true;
    starship.enable = true;

    yazi = {
      enable = true;
      shellWrapperName = "y";
    };

    zoxide = {
      enable = true;
      options = [ "--cmd cd" ];
    };
  };
}
