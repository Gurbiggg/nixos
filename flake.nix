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
  };
  
  pkgs = import nixpkgs {
    system = "x86_64";
    config = {
      allowUnfree = true;
    };

in {
  nixosConfigurations = {
    # host config profiles
    framework = nixpkgs.lib.nixosSystem{
      system = "x86_64-linux"; 
      modules = [
        ./scratch.nix
        ./profiles/common.nix
        ./profiles/gnome.nix
      ];
      specialArgs = {
        inherit userSettings;
	inherit systemSettings;
	hardwareSettings = {
          hostname = "framework";
	  nvidia = "false";
	};
      };
    };

#    legion = nixpkgs.lib.nixosSystem{
#      system = "x86_64-linux";
#      modules = [];
#      specialArgs = {
#        hostname = "legion";
#      };
#   };
#
#    server = nixpkgs.lib.nixosSystem{
#      system = "x86_64-linux";
#      modules = [];
#      specialArgs = {
#        hostname = "server";
#      };
#    };
#
#    virt = nixpkgs.lib.nixosSystem{
#      system = "x86_64-linux";
#      modules = [];
#      specialArgs = {
#        hostname = "virt";
#      };
#    };
  };

  homeConfigurations = {
    gurbiggg = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./profiles/home.nix 
      ];
    };
  };
}
