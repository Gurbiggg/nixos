{ config, systemSettings, ... }:

let
  nixosGens = systemSettings.nixosGens;
  
in
{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      configurationLimit = nixosGens;
    };
  };
}
