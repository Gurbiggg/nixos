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
  profilesPath = "./profiles/";

in {
  nixosConfigurations = {
    # host config profiles
    framework = nixpkgs.lib.nixosSystem{
      system = "x86_64-linux"; 
      modules = lib.concatMap (${profilesPath}) [
        /common.nix
      ];

      specialArgs = {
        hostname = "framework"
      };
    };

    legion = nixpkgs.lib.nixosSystem{
      system = "x86_64-linux";
      modules = [];
      specialArgs = {
        hostname = "legion"
      };
    };

    server = nixpkgs.lib.nixosSystem{
      system = "x86_64-linux";
      modules = [];
      specialArgs = {
        hostname = "server";
      };
    };
  };

  homeConfigurations = {
    #user profile

  };
};
}