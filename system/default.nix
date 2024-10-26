{ config, pkgs, lib, ... } @ inputs:

{

  imports = [
   ./hardware-config.nix
   ./configuration.nix
   ./users.nix
   #./variables.nix
   #./zapret.nix
    ];

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    
    efivar
    #virt-manager
    #qemu

    #tonelib-gfx
    #distrobox
    #docker
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
    cores = 4;
    builders-use-substitutes = true;
    auto-optimise-store = true;
    trusted-users = ["yaroslav"];
    experimental-features = [ "nix-command" "flakes" ];

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
  
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  system.stateVersion = "24.11";
}

