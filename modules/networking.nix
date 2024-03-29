{ config, hardwareSettings, ... }:

let
  hostname = hardwareSettings.hostname;

in
{
  networking = {
    hostName = hostname;
    networkmanager.enable = true;
    # Configure network proxy if necessary
    # proxy = {
    #   default = "http://user:password@proxy:port/";
    #   noProxy = "127.0.0.1,localhost,internal.domain";
    # };

    # Open ports in the firewall.
    # networking = {
    #   firewall = {
    #     allowedUDPPorts = [ ... ];
    #     allowedTCPPorts = [ ... ];
    # Or disable the firewall altogether.
    #     enable = false;
    #   };
    # };
  };
}
