{
	description = "NixOS configuration with unstable nixpkgs and Home Manager";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		stylix = {
			url = "github:nix-community/stylix";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixvim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixcord = {
			url = "github:kaylorben/nixcord";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		spicetify-nix = {
			url = "github:Gerg-L/spicetify-nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};

    yazi = {
      url = "github:sxyazi/yazi";
			inputs.nixpkgs.follows = "nixpkgs";
    };
	};

	outputs = inputs@{ 
		nixpkgs,
		home-manager,
		stylix,
		nixvim,
		nixcord,
		spicetify-nix,
		... }: let
			system = "x86_64-linux";

			pkgs = import nixpkgs {
				inherit system;
				config.allowUnfree = true;
			};
		in {
			nixosConfigurations = {
				nixos = nixpkgs.lib.nixosSystem {
					inherit system;
					modules = [
						./nixos/configuration.nix
						home-manager.nixosModules.home-manager
					];

					specialArgs = {
						inherit inputs system;
					};
				};
			};

			homeConfigurations = {
				edward = home-manager.lib.homeManagerConfiguration {
					inherit pkgs;
					extraSpecialArgs = {
						inherit inputs system;
					};
					modules = [
						./home-manager/home.nix
						stylix.homeModules.stylix
						nixvim.homeModules.nixvim
						nixcord.homeModules.nixcord
						inputs.spicetify-nix.homeManagerModules.default
					];
				};
			};
		};
}
