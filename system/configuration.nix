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
   flatpak.enable = true;
   udev.packages = with pkgs; [
      android-udev-rules
    ];

    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      #jack.enable = true;
     };
    
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
              path = "/home/yaroslav/Documents/Books";    # Which folder to add to Syncthing
              devices = [ "Телефон" ];      # Which devices to share the folder with
            };

           "Notes" = {         # Name of folder in Syncthing, also the folder ID
              path = "/home/yaroslav/Documents/Notes";    # Which folder to add to Syncthing
              devices = [ "Телефон" ];      # Which devices to share the folder with
            };
         };
       };
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
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    fish.enable = true;
    virt-manager.enable = true;
    
  };




  # Gnome
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "yaroslav";



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


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    options ="grp:caps_toggle";
  };
  
}
