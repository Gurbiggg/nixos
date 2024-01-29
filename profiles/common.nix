{ config, pkgs, userSettings, systemSettings, hardwareSettings, ...}:
{
  imports = [
    ../modules/bootloader.nix
    ../modules/dateTimeLocale.nix
    ../modules/display.nix
    ../modules/hardware.nix
    ../modules/networking.nix
    ../modules/nix.nix
    ../modules/pipewire.nix
    ../modules/ssh.nix
    ../modules/virtualization.nix
    ../modules/user.nix
  ];
}
