{
  pkgs,
  ...
}:
{
  imports = [
    ../nix-shared/system.nix
    <home-manager/nixos>
  ];

  # Settings

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;
  i18n.defaultLocale = "pt_BR.UTF-8";
  networking.firewall.enable = false;
  networking.hostName = "joao-homeserver";
  networking.networkmanager.enable = true;
  services.getty.autologinUser = "joao";
  services.logind.extraConfig = "HandleLidSwitchExternalPower=ignore";
  system.autoUpgrade.allowReboot = true;
  system.autoUpgrade.enable = true;
  time.timeZone = "America/Sao_Paulo";

  ## Shell

  programs.zsh.enable = true; # necessary to set defaultUserShell
  users.defaultUserShell = pkgs.zsh;

  environment.variables = {
    EDITOR = "vim";
    TERM = "xterm-256color";
  };

  # Programs & Services

  environment.systemPackages = with pkgs; [
    qbittorrent-nox
  ];

  systemd = {
    packages = [ pkgs.qbittorrent-nox ];
    services."qbittorrent-nox@joao" = {
      overrideStrategy = "asDropin";
      wantedBy = [ "multi-user.target" ];
    };
  };

  services.jackett.enable = true;
  nixpkgs.overlays = [
    (final: prev: {
      jackett = prev.jackett.overrideAttrs { doCheck = false; };
    })
  ];

  services.openssh.enable = true;
  services.plex.enable = true;

  # User & Home Manager

  users.users.joao = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "plex"
    ];
  };

  home-manager.users.joao =
    { pkgs, ... }:
    {
      imports = [ ../nix-shared/home-manager.nix ];


      programs = {
        starship.settings.character = {
          success_symbol = "[󱄅](bold green)";
          error_symbol = "[󱄅](bold red)";
        };

        vim = {
          enable = true;

          extraConfig = ''
            syntax on

            " Options

set hlsearch
set number
set relativenumber
set incsearch
set ignorecase
set smartcase
set scrolloff=5
set sidescrolloff=5

" Mappings

"" Disabled

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <C-R> <Nop>

"" Natural noh
nnoremap <Esc> :noh<Enter>

"" Leader mappings

let mapleader = "\\"

""" Display registers
nnoremap <leader>r :reg<Enter>

""" Toggle relative line number
nnoremap <leader>re :set rnu!<Enter>

""" Undo undo
nnoremap <leader>u <C-R>

""" Sort selected lines
vnoremap <leader>s :sort<Enter>
          '';

          plugins = [ pkgs.vimPlugins.vim-nix ];
        };
        
        zellij = {
          enable = true;
          enableZshIntegration = true;
        };
      };

      # DO NOT CHANGE
      home.stateVersion = "24.11";
    };

  # DO NOT CHANGE
  system.stateVersion = "24.11";
}
