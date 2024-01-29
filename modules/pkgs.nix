{ config, pkgs, userPackages, systemPackages, ... }:
{
  environment.systemPackages = systemPackages;
}
