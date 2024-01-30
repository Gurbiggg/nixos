{ config, pkgs, ... }:
let 
  systemPackages = with pkgs; [
    neovim
    git
    wget
    alacritty
    home-manager
  ];
in
{
  environment.systemPackages = systemPackages;
}
