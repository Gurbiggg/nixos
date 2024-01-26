{ config, pkgs, timezone, locale, hostname, nixosGens, username, name, ...}:
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
    ../modules/user.nix
  ];
}