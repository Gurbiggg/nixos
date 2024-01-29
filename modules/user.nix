{ config, pkgs, userSettings, ... }:
let
  username = userSettings.username;
  name = userSettings.name;
  userPackages = with pkgs; [
    firefox 
  ];
in
{
  users.users.${username} = {
    isNormalUser = true;
    description = name;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = userPackages;
  };
}
