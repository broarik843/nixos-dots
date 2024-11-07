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
      #jack.enable = true;
     };
     
     flatpak.enable = true;

     # Syncthink
     syncthing = {
      enable = true;
      user = "yaroslav";
      dataDir = "/home/yaroslav/Документы"; 
      overrideDevices = true;     
      overrideFolders = true; 
        settings = {
          devices = {
            "Телефон" = { id = "A43N4VM-WNJ3ODZ-DKSUI6B-IFRUBWE-KZPZNKO-CXCNXKN-JHC4LLS-CKLRLQA"; };
          };
          folders = {
            "Books" = {         # Name of folder in Syncthing, also the folder ID
              path = "/home/yaroslav/Документы/Книги";    # Which folder to add to Syncthing
              devices = [ "Телефон" ];      # Which devices to share the folder with
            };

           "Notes" = {         # Name of folder in Syncthing, also the folder ID
              path = "/home/yaroslav/Документы/Заметки";    # Which folder to add to Syncthing
              devices = [ "Телефон" ];      # Which devices to share the folder with
            };
         };
       };
      };

  };
  services.thinkfan = {
      enable = true;
      levels = [
	[ 0 0 55 ]
	[ 2 55 65 ]
	[ 3 65 70 ]
	[ 4 70 75 ]
	[ 5 75 80 ]
	[ 6 80 90 ]
	[ "level full-speed" 90 105 ]
      ];
    };


  programs = { 
    /*git = {
      enable = true;
      userName  = "Yaroslav8434";
      userEmail = "broarik843@gmail.com";
    };
*/
    nix-ld.enable = true;

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
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
  

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "ru_RU.UTF-8";


}
