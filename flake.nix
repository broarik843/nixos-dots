{
  outputs = inputs@{ flake-parts, home-manager, ... }: 
  flake-parts.lib.mkFlake { inherit inputs; } { 
    systems = [
      "x86_64-linux"
      "aarch64-linux"
    ];

    
  flake = {
    nixosConfigurations = {
      system = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
        modules = [ 
	   
          ./system
        ];
      };
    };
   
    homeConfigurations = {
        yaroslav-droid = home-manager.lib.homeManagerConfiguration {
          pkgs = inputs.nixpkgs.legacyPackages."aarch64-linux";
          extraSpecialArgs = { inherit inputs; };
          modules = [
            ./home/yaroslav-droid
          ];
        };
      };

  
    homeConfigurations = {
      yaroslav = home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home/yaroslav

        ];
      };
    };
  };
  };

  inputs = {
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    ayugram-desktop.url = "github:ayugram-port/ayugram-desktop/release?submodules=1";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nix-software-center.url = "github:snowfallorg/nix-software-center";
    flatpaks.url = "github:gmodena/nix-flatpak";
    nix-index-database.url = "github:nix-community/nix-index-database";
    
    flake-parts.url = "github:hercules-ci/flake-parts";

    nix-ld.url = "github:Mic92/nix-ld";
    home-manager.url = "github:nix-community/home-manager";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hycov = {
        url = "github:DreamMaoMao/hycov";
        inputs.hyprland.follows = "hyprland";
    };
    
  };
}
