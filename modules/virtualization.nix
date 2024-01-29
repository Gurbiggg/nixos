{ config, userSettings, ... }:

let
  username = userSettings.username;
in
{
  virtualisation = {
    docker.enable = true;
  };

  users.users.${username}.extraGroups = [ "docker" ];
}
