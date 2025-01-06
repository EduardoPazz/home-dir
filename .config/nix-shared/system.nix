{
  # Settings  

  nixpkgs.config.allowUnfree = true;
  home-manager.useGlobalPkgs = true;

  # Aliases

  environment.shellAliases = {
    v = "vim";

    cp = "cp -vi";
    ln = "ln -vi";
    mv = "mv -vi";
    rm = "rm -vi";

    ga = "git add .";
    gc = "git commit";
    gl = "git pull";
    gp = "git push";
    gs = "git status";
    grhforno = "git reset --hard origin/forno";
    grhmain = "git reset --hard origin/main";
    grhmaster = "git reset --hard origin/master";
  };
}
