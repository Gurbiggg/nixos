{ config, pkgs, ... }:
{
  imports = [
    ../modules/gnome-shell.nix
    ../modules/gnome-pkgs.nix
    #../modules/gnome-ext.nix
  ];
}
