{
  programs = {
    bat.enable = true;
    btop.enable = true;
    eza.enable = true;
    fd.enable = true;
    fzf.enable = true;
    git.enable = true;
    hyfetch.enable = true;
    ripgrep.enable = true;
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
