{ config, pkgs, ... }:
let
  userName = "eduardo.paz";
  homePath = "/Users/${userName}";
in
{
  imports = [
    ../nix-shared/system.nix
    ./aerospace.nix
    <home-manager/nix-darwin>
  ];

  environment.darwinConfig = "${homePath}/.config/nix-darwin/configuration.nix";

  # DO NOT CHANGE
  system.stateVersion = 5;

  # Settings

  ## Homebrew settings

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };
  };

  ## System settings

  users.users.${userName}.home = homePath;

  networking.computerName = "MacBook do Edu";
  security.pam.enableSudoTouchIdAuth = true;
  time.timeZone = "America/Sao_Paulo";

  system.defaults = {
    controlcenter.BatteryShowPercentage = true;
    dock.autohide = true;
    hitoolbox.AppleFnUsageType = "Do Nothing";
    loginwindow.autoLoginUser = userName;

    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = false;
      ShowStatusBar = true;
      _FXShowPosixPathInTitle = true;
      _FXSortFoldersFirst = true;
    };
  };

  # Env vars

  environment.variables = {
    DOCKER_HOST = "unix://${homePath}/.colima/default/docker.sock";
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
    docker
    docker-compose
    docker-credential-helpers
    ffmpeg
    imagemagick
    jetbrains.idea-ultimate
    nginx
    nixfmt-rfc-style
    postman
    raycast
    tldr

    # monorepo migration
    gawk
    git-filter-repo
  ];

  ## Homebrew packages

  homebrew.casks =
    map
      (name: {
        inherit name;
        greedy = true;
      })
      [
        "firefox"
        "notion"
        "whatsapp"
      ];

  ## Home Manager packages

  home-manager.users.${userName} =
    { ... }:
    {
      imports = [ ../nix-shared/home-manager.nix ];

      programs = {
        mise.enable = true;

        starship.settings.character = {
          success_symbol = "[󰀵](bold green)";
          error_symbol = "[󰀵](bold red)";
        };

        atuin = {
          enable = true;
          flags = [ "--disable-up-arrow" ];
        };

        kitty = {
          enable = true;
          themeFile = "gruvbox-dark-hard";
          settings.window_padding_width = 5;
          font = {
            name = "FiraCode Nerd Font";
            size = 16;
          };
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

              "git"
              "utility"
              "completion"
            ];
            extraConfig = ''
              zstyle ':prezto:module:git:alias' skip 'yes'
            '';
          };
        };
      };

      # DO NOT CHANGE
      # The state version is required and should stay at the version you
      # originally installed.
      home.stateVersion = "24.11";
    };
}
