{ config, pkgs, ... }:
{
  # DO NOT CHANGE

  imports = [
    ../nix-shared
    ./aerospace.nix
    <home-manager/nix-darwin>
  ];

  environment.darwinConfig = "$HOME/.config/nix-darwin/configuration.nix";
  system.stateVersion = 5;

  # Settings

  ## Homebrew settings

  homebrew.enable = true;
  homebrew.onActivation.autoUpdate = true;
  homebrew.onActivation.cleanup = "uninstall";
  homebrew.onActivation.upgrade = true;

  ## System settings

  users.users."eduardo.paz" = {
    name = "eduardo.paz";
    home = "/Users/eduardo.paz";
  };

  networking.computerName = "MacBook do Edu";
  security.pam.enableSudoTouchIdAuth = true;
  system.defaults.controlcenter.BatteryShowPercentage = true;
  system.defaults.dock.autohide = true;
  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder.AppleShowAllFiles = false;
  system.defaults.finder.ShowStatusBar = true;
  system.defaults.finder._FXShowPosixPathInTitle = true;
  system.defaults.finder._FXSortFoldersFirst = true;
  system.defaults.hitoolbox.AppleFnUsageType = "Do Nothing";
  system.defaults.loginwindow.autoLoginUser = "eduardo.paz";
  time.timeZone = "America/Sao_Paulo";

  # Env vars

  environment.variables = {
    DOCKER_HOST = "unix:///Users/eduardo.paz/.colima/default/docker.sock";
    EDITOR = "vim";
    TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE = "/var/run/docker.sock";
  };

  # Fonts

  fonts.packages = [ (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; }) ];

  # Packages

  ## nix-darwin packages

  environment.systemPackages = with pkgs; [
    brave
    colima
    ffmpeg
    imagemagick
    jetbrains.idea-ultimate
    nginx
    nixfmt-rfc-style
    postman
    raycast
    tldr
  ];

  ## Homebrew packages

  homebrew.casks = [
    {
      name = "firefox";
      greedy = true;
    }
    {
      name = "notion";
      greedy = true;
    }
    {
      name = "whatsapp";
      greedy = true;
    }
  ];

  ## Home Manager packages

  home-manager.users."eduardo.paz" =
    { ... }:
    {
      programs.bat.enable = true;
      programs.btop.enable = true;
      programs.eza.enable = true;
      programs.jq.enable = true;
      programs.mise.enable = true;
      programs.zsh.enable = true;

      programs.starship.enable = true;
      programs.starship.settings = {
        character = {
          success_symbol = "[󱢇](bold green)";
          error_symbol = "[󱢇](bold red)";
        };
      };

      programs.atuin.enable = true;
      programs.atuin.flags = [ "--disable-up-arrow" ];

      programs.yazi.enable = true;
      programs.yazi.shellWrapperName = "y";

      programs.kitty.enable = true;
      programs.kitty.font.name = "FiraCode Nerd Font";
      programs.kitty.font.size = 16;
      programs.kitty.themeFile = "gruvbox-dark-hard";
      programs.kitty.settings = {
        window_padding_width = 5;
      };

      programs.zoxide.enable = true;
      programs.zoxide.options = [ "--cmd cd" ];

      programs.zsh.prezto.enable = true;
      programs.zsh.prezto.editor.keymap = "vi";
      programs.zsh.prezto.utility.safeOps = false;
      programs.zsh.prezto.pmodules = [
        "editor"

        "syntax-highlighting"
        "history-substring-search"
        "autosuggestions"

        "git"
        "utility"
        "completion"
      ];
      programs.zsh.prezto.extraConfig = ''
        zstyle ':prezto:module:git:alias' skip 'yes'
      '';

      # DO NOT CHANGE
      # The state version is required and should stay at the version you
      # originally installed.
      home.stateVersion = "24.11";
    };

}
