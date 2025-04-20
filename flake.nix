{
  description = "local dumbass that decided that instead of learning a normal lanugage they'd rather learn this instead...";

  inputs = {
    # Needed Inputs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
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

    ## User Inputs
    rose-pine-hyprcursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ## Why do i even have this lmao
    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nix-on-droid,
    nix-minecraft,
    sops-nix,
    ...
  }: {
    # i'll probably copy sioodmy's thingy idk too eepy rn
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;

    # wow configs that's crazy
    nixosConfigurations = {
      amogus = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        system = "x86_64-linux";
        modules = [
          ./hosts/amogus/configuration.nix
        ];
      };
      vm1 = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        system = "x86_64-linux";
        modules = [
          ./hosts/vm/vm1/configuration.nix
        ];
      };
      lapserver = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        system = "x86_64-linux";
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
