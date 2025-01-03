{ config, pkgs, lib, inputs, ... }:

{ 
  
  documentation = {
    enable = true;
    doc.enable = false;
    man.enable = false;
    dev.enable = false;
  };


  virtualisation = {
    libvirtd.enable = true;
    docker.enable = true;
  };

   
  services = {
    /*jack = {
      jackd.enable = true;
      # support ALSA only programs via ALSA JACK PCM plugin
      alsa.enable = false;
      # support ALSA only programs via loopback device (supports programs like Steam)
      loopback = {
        enable = true;
      # buffering parameters for dmix device to work with ALSA only semi-professional sound programs
      #dmixConfig = ''
      #  period_size 2048
      #'';
      };
    };*/
    ollama.enable = true;
    printing.enable = false;
    udev.packages = with pkgs; [
      android-udev-rules
    ];
    
    fwupd.enable = true;

    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
     };
     flatpak.enable = true;
     # Syncthink
     syncthing = {
      enable = true;
      user = "yaroslav";
      dataDir = "/home/yaroslav/Documetns"; 
      overrideDevices = true;     
      overrideFolders = true; 
        settings = {
          devices = {
            "Phone" = { id = "A43N4VM-WNJ3ODZ-DKSUI6B-IFRUBWE-KZPZNKO-CXCNXKN-JHC4LLS-CKLRLQA"; };
          };
          folders = {
            "Books" = {        
              path = "/home/yaroslav/Documetns/Books"; 
              devices = [ "Phone" ];     
            };

           "Notes" = { 
              path = "/home/yaroslav/Documents/Notes";  
              devices = [ "Phone" ];    
            };
         };
       };
      };
    thinkfan = {
      enable = true;
      levels = [
	[ 0 0 60 ]
	[ 2 60 65 ]
	[ 3 65 70 ]
	[ 4 70 75 ]
	[ 5 75 80 ]
	[ 6 80 100 ]
	#[ "level full-speed" 100 105 ]
      ];
    };
};

  programs = { 
    /*git = {
      enable = true;
      userName  = "Yaroslav8434";
      userEmail = "broarik843@gmail.com";
    };
*/
    nix-ld.enable = true;
    gamemode.enable = true;
    hyprland.enable = true;
    hyprland.xwayland.enable = true;

    nh = {
      enable = true;
     clean.enable = true;
      flake = "/etc/nixos";
    };
    fish.enable = true;
    virt-manager.enable = true;
    
  };

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  
  #services.desktopManager.cosmic.enable = true;

  security = {
    rtkit.enable = true;
    sudo.enable = false;
    doas = {
      enable = true;
      extraConfig = ''
        permit persist :wheel
        
      '';
    };
    polkit.enable = true;
  };
  

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    nerd-fonts.jetbrains-mono 
  ];
  

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "ru_RU.UTF-8";


}
