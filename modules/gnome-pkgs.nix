{ config, pkgs, ... }:
{
  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
    gedit
  ]) ++ (with pkgs.gnome; [
    gnome-music
    epiphany
    geary
    totem
    yelp
    file-roller
    iagno
    hitori
    atomix
  ]);

  environment.systemPackages = with pkgs; [
    blackbox-terminal
    gnome-extension-manager
    gnome.gnome-boxes
    gnome.dconf-editor
    gnome.gnome-tweaks	
  ];

  services.xserver.excludePackages = [ pkgs.xterm ];
}
