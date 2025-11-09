{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "devlinux";
    firewall.enable = true;
    interfaces = { };
  };

  environment.systemPackages = with pkgs; [
    nixfmt
    nil

    htop
    curl
    wget

    git
    gh
    nvim
    vscodium
  ];

  virtualisation.docker.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # system.stateVersion = "25.05"; #or unstable
}
