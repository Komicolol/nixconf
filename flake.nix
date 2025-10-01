{
  description = "local dumbass that decided that instead of learning a normal lanugage they'd rather learn this instead...";

  inputs = {
    # Needed Inputs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ## Server Inputs
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    copyparty.url = "github:9001/copyparty";

    ## User Inputs
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nix-on-droid,
    nix-minecraft,
    sops-nix,
    ...
  }: let
    # stealing this one from Misterio77's starter's config
    inherit (self) outputs;
    system = [
      "x86_64-linux"
      "aarch64-linux"
    ];
    forAllSystems = nixpkgs.lib.genAttrs system;
  in {
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    devShells = forAllSystems (system: {default = import ./shell.nix nixpkgs.legacyPackages.${system};});

    # wow configs that's crazy
    nixosConfigurations = {
      amogus = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/amogus/configuration.nix
        ];
      };
      vm1 = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/vm/vm1/configuration.nix
        ];
      };
      lapserver = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/homelab/lapserver/configuration.nix
        ];
      };
    };

    # yuck.
    nixOnDroidConfigurations = {
      default = nix-on-droid.lib.nixOnDroidConfiguration {
        pkgs = import nixpkgs {system = "aarch64-linux";};
        extraSpecialArgs = {inherit inputs;};
        modules = [
          ./hosts/android/nix-on-droid.nix
        ];
      };
    };
  };
}
