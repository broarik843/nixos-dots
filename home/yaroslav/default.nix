{ config, pkgs, inputs,...}: {
  
 

  home = {
    packages = with pkgs; with gnomeExtensions; [     
      # GNome extensions
        gsconnect
        wifi-qrcode
	rounded-corners
	hibernate-status-button
	clipboard-history
        blur-my-shell
	appindicator

      libresprite
      amberol
      davinci-resolve
      reaper
      #protonmail-desktop
      proton-pass
      ollama
      nautilus
      grimblast
      slurp
      easyeffects
      #tuxguitar
      #thinkfan
      #inputs.nur.repos.guoard.hiddify
      lm_sensors
      inputs.ayugram-desktop.packages.${pkgs.system}.ayugram-desktop
      inputs.zen-browser.packages."${system}".specific

      #rhythmbox

      #webkitgtk
      
      #hiddify_next
      fastfetch
    
      #carla
      #yabridge
      #yabridgectl

      #obs-studio
      
      #protonvpn-gui
      brightnessctl

      #lutris
      tor-browser
      hyprpaper
      waybar
      rofi-wayland
      tonelib-gfx

      inputs.nix-software-center.packages.${system}.nix-software-center
      kdePackages.kdeconnect-kde
      lsd
      neovim
      fragments
      
      gnome-software

      #librewolf
      firefox
      starship
      heroic

      vesktop

      #libreoffice
      
      wineWowPackages.waylandFull

      obsidian
      scrcpy
      vscodium
      wl-clipboard
    ];

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

