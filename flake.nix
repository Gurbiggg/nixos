{
description = "NixOS config flake";

inputs = {
  nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  home-manager = {
    url = "github:nix-community/home-manager/master";
    inputs.nixpkgs.follows = "nixpkgs";
  };
};

outputs = { self, nixpkgs, home-manager, ... }:
let
  # default config variables
  userSettings = {  
    username = "gurbiggg";
    name = "Gehrig Dixon";
  };
  systemSettings = {
    timezone = "America/Phoenix";
    locale = "en_US.UTF-8";
    nixosGens = 10;
    hostname = "computer";
  };
  hardwareSettings = {

  };

in {
  nixosConfigurations = {
    # host config profiles
    framework = nixpkgs.lib.nixosSystem{
      system = "x86_64-linux"; 
      modules = [
        ./profiles/common.nix
        ./profiles/gnome.nix
      ];
      specialArgs = {
        inherit userSettings;
	inherit systemSettings;
	hardwareSettings = {
          hostname = "framework";
	};
      };
    };

    legion = nixpkgs.lib.nixosSystem{
      system = "x86_64-linux";
      modules = [];
      specialArgs = {
        hostname = "legion";
      };
    };

    server = nixpkgs.lib.nixosSystem{
      system = "x86_64-linux";
      modules = [];
      specialArgs = {
        hostname = "server";
      };
    };

    virt = nixpkgs.lib.nixosSystem{
      system = "x86_64-linux";
      modules = [];
      specialArgs = {
        hostname = "virt";
      };
    };
  };

  homeConfigurations = {
    #user profile

  };
};
}
