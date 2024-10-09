{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
    	url = "github:nix-community/home-manager";
	    inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:MarceColl/zen-browser-flake";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
  let
  	system = "x86_64-linux";
  in {
	nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { 
        	inherit system; 
        	inherit inputs;
        };
		modules = [ 
        ./system/configuration.nix
        ];
	};
	homeConfigurations.giuliano = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = { inherit inputs; };
		pkgs = nixpkgs.legacyPackages.${system};
		modules = [ 
        ./home/home.nix  
        inputs.nixvim.homeManagerModules.nixvim
        ];
	};
    devShells.${system}.default = 
        import ./shell.nix {
            pkgs = nixpkgs.legacyPackages.${system};
        };
  };
}
