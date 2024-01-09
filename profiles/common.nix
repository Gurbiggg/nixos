{ config, pkgs, timezone, locale, hostname, nixosGens, username, ...}:
{
  imports = [
    ../modules/bootloader.nix
    ../modules/dateTimeLocale.nix
    ../modules/networking.nix
    ../modules/nix.nix
    ../modules/pipewire.nix
    ../modules/ssh.nix
    ../modules/virtualization.nix
    ../modules/x11.nix
  ];
}