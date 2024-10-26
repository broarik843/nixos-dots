{ config, pkgs, inputs,...}: {

  home = {
    packages = with pkgs; with gnomeExtensions; [
      lm_sensors     
      # GNome extensions
        gsconnect
        wifi-qrcode
	rounded-corners
	hibernate-status-button
	clipboard-history
        blur-my-shell
	appindicator

      easyeffects
      #tuxguitar
      #thinkfan
      inputs.ayugram-desktop.packages.${pkgs.system}.ayugram-desktop
      

      #rhythmbox

      #webkitgtk
      
      #hiddify_next
      fastfetch
    
      #carla
      #yabridge
      #yabridgectl

      #kdenlive
      #obs-studio

      
      
      #protonvpn-gui


      #lutris
      tor-browser
      #waybar
      #syncthing
      #rofi-wayland
      #tonelib-gfx

      inputs.nix-software-center.packages.${system}.nix-software-center
      kdeconnect
      gradience 
      adw-gtk3
      lsd
      neovim
      fragments
      
      gnome.gnome-software

      #librewolf
      firefox
      starship
      #heroic

      vesktop

      #libreoffice
      
      wineWowPackages.waylandFull

      gnome.gnome-tweaks
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
      substituters = [
        #"https://cache.garnix.io"
        #"https://prismlauncher.cachix.org"
      ];
      trusted-public-keys = [
        #"prismlauncher.cachix.org-1:9/n/FGyABA2jLUVfY+DEp4hKds/rwO+SCOtbOkDzd+c="
        #"cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      ];
      builders-use-substitutes = true;
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };


  home.stateVersion = "24.11";
   
  imports = [
    #./themes
    ./devlop
    ./configuration.nix
    ./user_enivroment.nix
    ./programs
  ];



    
}

