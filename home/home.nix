{ config, pkgs, userSettings, ... }:
let
  username = userSetings.username;
  homeDir = userSettings.homeDir;
  version = userSettings.version;

in
{
  imports = [];
  programs.home-manager.enable = true;
  home = {
    username = userSettings.username;
    homeDirectory = userSettings.homeDir;
    stateVersion = userSettings.version;
    file = {};
    sessionVariables = {};
  };

}
