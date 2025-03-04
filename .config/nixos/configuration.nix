{ config, lib, pkgs, ... }:

{
  imports = [
    ../nix-shared/system.nix
    <home-manager/nixos>
  ];

  nixpkgs.overlays = [
  (final: prev: {
    jackett = prev.jackett.overrideAttrs { doCheck = false; };
  })
];

networking.firewall.enable = false;

  systemd = {
    packages = [pkgs.qbittorrent-nox];
    services."qbittorrent-nox@joao" = {
      overrideStrategy = "asDropin";
      wantedBy = ["multi-user.target"];
    };
  };

  environment.variables = {
  TERM="xterm-256color"; # fix terminal behaving weirdly over SSH
  EDITOR="vim";
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "joao-homeserver"; 

  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "pt_BR.UTF-8";
  #console = {
    #keyMap = "br";
  #};


  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;


programs.zsh.enable = true;
users.defaultUserShell = pkgs.zsh;

services.logind.extraConfig = "HandleLidSwitchExternalPower=ignore";

  services.getty.autologinUser = "joao";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.joao = {
    isNormalUser = true;
    extraGroups = [ "wheel" "plex" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      vim git qbittorrent-nox 
    ];
  };


home-manager.users.joao = { pkgs, ... }: {
        imports = [ ../nix-shared/home-manager.nix ];

programs = {


  vim.extraConfig= ''
 
    syntax on

  '';


vim.enable = true;
vim.plugins = [pkgs.vimPlugins.vim-nix];

        atuin = {
          enable = true;
          flags = [ "--disable-up-arrow" ];
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

  # DO NOT CHANGE
  home.stateVersion = "24.11";
};

  # programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   wget
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.jackett.enable = true;
  services.plex.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}

