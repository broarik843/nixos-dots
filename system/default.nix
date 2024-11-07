{ inputs, config, pkgs, lib, ... }:

{

  imports = [
   ./hardware-config.nix
   ./configuration.nix
   ./users.nix
   #./variables.nix
   ./zapret.nix
    ];

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    
    libgtop
    unzip
    efivar
    #virt-manager
    #qemu

    #distrobox
    docker
    android-tools
    gitFull
    git-repo
    wget
    home-manager
    
    doas
    doas-sudo-shim
];

  
   # Exiperimental Nix os command and futures
  nix.settings = {
    extra-substituters = [
        "https://cache.garnix.io"
	"https://nix-community.cachix.org"
        "https://cache.nixos.org/"
      ];
      extra-trusted-public-keys = [
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
	"nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
	"cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      ];
    cores = 4;
    builders-use-substitutes = true;
    auto-optimise-store = true;
    trusted-users = ["yaroslav"];
    extra-experimental-features = [ "nix-command" "flakes" ];

  };
    # Netrworking and dns servers
  networking = {
  hostName = "nixos";
    firewall = {
      enable = true;
      allowedTCPPortRanges = [ 
        { from = 1714; to = 1764; }
      ];  
      allowedUDPPortRanges = [ 
        { from = 1714; to = 1764; }
      ];  
    };

  networkmanager = {
    enable = true;
    insertNameservers = [ "1.1.1.1" "1.0.0.1" ];
    };
  };

   
  
  nixpkgs.config = {
    allowUnfree = true;
  };
  
  #inputs.chaotic.nyx.cache.enable = true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  system.stateVersion = "24.11";
}

