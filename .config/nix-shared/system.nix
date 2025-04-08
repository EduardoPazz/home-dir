{
  # Settings

  home-manager.useGlobalPkgs = true;

  nix.gc.automatic = true;
  nix.optimise.automatic = true;

  nixpkgs.config.allowUnfree = true;

  # Programs

  environment.systemPackages = with pkgs; [ tldr ];

  # Aliases

  environment.shellAliases = {
    b = "bat";
    l = "eza";
    v = "vim";

    cp = "cp -vi";
    ln = "ln -vi";
    mv = "mv -vi";
    rm = "rm -vi";

    ga = "git add .";
    gb = "git branch";
    gc = "git commit";
    gcb = "git checkout -b";
    gco = "git checkout";
    gfa = "git fetch --all";
    gl = "git pull";
    glog = "git log --topo-order --graph --pretty=format:\"$_git_log_oneline_format\"";
    glor = "git pull origin";
    gm = "git merge";
    gp = "git push";
    gs = "git status";

    grhforno = "git reset --hard origin/forno";
    grhmain = "git reset --hard origin/main";
    grhmaster = "git reset --hard origin/master";
  };
}
