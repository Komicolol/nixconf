{
  description = "dumbass teen that decided that instead of learning a normal lanugage they'd rather learn this instead...";

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
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
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

    nixOnDroidConfiguration = {
      android = nix-on-droid.lib.nixOnDroidConfigration {
        pkgs = import nixpkgs { system = "aarch64-linux"; };
        modules = [
          ./hosts/android/nix-on-droid.nix
        ];
      };
    };
  };
}
