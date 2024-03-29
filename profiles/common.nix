{ config, pkgs, systemSettings, hardwareSettings, userSettings, ...}:
{
  imports = [
    ../modules/bootloader.nix
    ../modules/dateTimeLocale.nix
    ../modules/display.nix
    ../modules/hardware.nix
    ../modules/networking.nix
    ../modules/nix.nix
    ../modules/pipewire.nix
    ../modules/pkgs.nix
    ../modules/ssh.nix
    ../modules/virtualization.nix
    ../modules/user.nix
  ];
}
