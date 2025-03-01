{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rose-pine-hyprcursor = {
        url = "github:ndom91/rose-pine-hyprcursor";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, nix-on-droid, ... }@inputs: {
    
    nixosConfigurations = {
      amogus = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/amogus/configuration.nix
        ];
      };
    };

    nixOnDroidConfigurations = {
      android = nix-on-droid.lib.nixOnDroidConfigration {
        pkgs = import nixpkgs { system = "aarch64-linux"; };
        modules = [
          ./hosts/android/nix-on-droid.nix
        ];
      };
    };
  };
}
