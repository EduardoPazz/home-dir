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

  ## nix-darwin packages - mostly CLI

  environment.systemPackages = with pkgs; [
    colima
    docker
    docker-compose
    docker-credential-helpers
    ffmpeg
    imagemagick
    ngrok
    nixfmt-rfc-style
    pipenv
    pnpm

    # monorepo migration
    gawk
    git-filter-repo
  ];

  ## Homebrew packages - mostly GUI or not available in nixpkgs

  homebrew = {
    brews = [ "nginx" ];
    casks =
      map
        (name: {
          inherit name;
          greedy = true;
        })
        [
          "brave-browser"
          "cursor"
          "firefox"
          "intellij-idea"
          "notion"
          "obs"
          "postman"
          "pycharm"
          "raycast"
          "vlc"
          "whatsapp"
        ];
  };

  ## Home Manager packages

  home-manager.users.${userName} =
    { ... }:
    {
      imports = [ ../nix-shared/home-manager.nix ];

      programs = {
        direnv = {
          enable = true;
          nix-direnv.enable = true;
        };

        starship.settings.character = {
          success_symbol = "[󰀵](bold green)";
          error_symbol = "[󰀵](bold red)";
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

        zsh.initExtra = ''
          nix-shell-setup() {
            cat > shell.nix << 'EOF'
          { pkgs ? import <nixpkgs> {}}:

          pkgs.mkShellNoCC {
            packages = with pkgs; [ ];
          }
          EOF

            echo "use nix" >> .envrc
            direnv allow

            echo "Nix shell environment setup complete!"
          }
        '';
      };

      # DO NOT CHANGE
      # The state version is required and should stay at the version you
      # originally installed.
      home.stateVersion = "24.11";
    };
}
