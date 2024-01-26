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
  profilesPath = "/profiles";
  username = "gurbiggg";
  name = "name";
  timezone = "America/Phoenix";
  locale = "en_US.UTF-8";
  nixosGens = 10;

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
        hostname = "framework";
        inherit username;
        inherit name;
        inherit timezone;
        inherit locale;
        inherit nixosGens;
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