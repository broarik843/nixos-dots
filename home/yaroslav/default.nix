{ config, pkgs, inputs,...}: {
  
 

  home = {
    packages = with pkgs; [    
      arduino-ide
      krita
      steam
      #libresprite
      #davinci-resolve
      #reaper
      #protonmail-desktop
      proton-pass
      tgpt
      nautilus
      lutris
      
      easyeffects
      #tuxguitar
      lm_sensors
      prismlauncher
      inputs.ayugram-desktop.packages.${pkgs.system}.ayugram-desktop
      inputs.zen-browser.packages."${system}".specific

      hiddify-app

      rhythmbox

      #webkitgtk
      
      fastfetch
      mangohud
    
      #carla
      #yabridge
      #yabridgectl

      obs-studio
      
      #tor-browser
      #tonelib-gfx

      inputs.nix-software-center.packages.${system}.nix-software-center
      kdePackages.kdeconnect-kde
      neovim
      fragments
      
      gnome-software

      #librewolf
      lsd
      firefox
      starship
      #heroic

      vesktop

      #libreoffice
      
      wineWowPackages.waylandFull

      obsidian
      scrcpy
      vscodium
      wl-clipboard
    ];
    enableNixpkgsReleaseCheck = false;
    username = "yaroslav";
    homeDirectory = "/home/yaroslav";
  };
  
    
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };
  
  
  nix = {
    package = pkgs.nix;
    settings = { 
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

      builders-use-substitutes = true;
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };


  home.stateVersion = "24.11";
   
  imports = [
    ./themes
    ./devlop
    ./configuration.nix
    ./user_enivroment.nix
    ./programs
  ];



    
}

