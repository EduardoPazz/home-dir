{
  programs = {
    nushell.enable = true;
    bat.enable = true;
    btop.enable = true;
    eza.enable = true;
    fd.enable = true;
    fzf.enable = true;
    git.enable = true;
    hyfetch.enable = true;
    ripgrep.enable = true;
    starship.enable = true;

    atuin = {
      enable = true;
      flags = [ "--disable-up-arrow" ];
    };

    yazi = {
      enable = true;
      shellWrapperName = "y";
    };

    zoxide = {
      enable = true;
      options = [ "--cmd cd" ];
    };

    zsh = {
      enable = true;
      prezto = {
        enable = true;
        editor.keymap = "vi";
        utility.safeOps = false;
        pmodules = [
          "editor"

          "syntax-highlighting"
          "history-substring-search"
          "autosuggestions"

          "completion"
        ];
      };
    };
  };
}
