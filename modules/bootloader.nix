{ config, nixosGens, ... }:
{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      configurationLimit = nixosGens;
    };
  };
}