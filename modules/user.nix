{ config, userSettings, ... }:
let
  username = userSettings.username;
  name = userSettings.name;
in
{
  users.users.${username} = {
    isNormalUser = true;
    description = name;
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
