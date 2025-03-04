{
  description = "dumbass teen that decided that instead of learning a normal lanugage they'd rather learn this instead...";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
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
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";

    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  ## A reminder of how FUCKING DUMB I AM AAAAAAAAAAAAAA
  # outputs = { self, nixpkgs, nix-on-droid, nix-minecraft, ... }@inputs: {

  outputs = inputs @ {
    self,
    nixpkgs,
    nix-on-droid,
    nix-minecraft,
    ...
  }: {
    nixosConfigurations = {
      amogus = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";
        modules = [
          ./hosts/amogus/configuration.nix
        ];
      };
      vm1 = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";
        modules =  [
          ./hosts/vm/vm1/configuration.nix
        ];
      };
      lapserver = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";
        modules = [
          ./hosts/homelab/lapserver/configuration.nix
        ];
      };
    };

    nixOnDroidConfigurations = {
      android = nix-on-droid.lib.nixOnDroidConfiguration {
        pkgs = import nixpkgs { system = "aarch64-linux"; };
        modules = [
          ./hosts/android/nix-on-droid.nix
        ];
      };
    };
  };
}
