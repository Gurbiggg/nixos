{ config, pkgs, ... }:
let 
  systemPackages = with pkgs; [
    neovim
    git
    alacritty

  ];
in
{
  environment.systemPackages = systemPackages;
}
