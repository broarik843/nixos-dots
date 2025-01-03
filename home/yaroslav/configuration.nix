{ inputs, pkgs, config, ... }: 

{
    imports = [ inputs.flatpaks.homeManagerModules.nix-flatpak ];
    services.flatpak = {
      enable = true;
      update.onActivation = true;
      packages = [
        "com.github.tchx84.Flatseal"   
        #"io.github.Rirusha.Cassette.Devel"
        "com.mattjakeman.ExtensionManager"  
      ];
     
    };

    programs.gnome-shell.extensions = [ 
      "gsconnect"
      "wifi-qrcode"
      "rounded-corners"
      "hibernate-status-button"
      "clipboard-history"
      "blur-my-shell"
      "appindicator"
      "media-controls"
    ];

    services.hyprpaper = {
     enable = true;
     settings = {
       preload = ["~/.wallpapers/Kita.png"];
       wallpaper = [" ,~/.wallpapers/Kita.png"];   
     };
   };

   xdg = with config.home; {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      templates = null; publicShare = null; music = null;
      download = "${homeDirectory}/Downloads";
      documents = "${homeDirectory}/Documents";
      videos = "${homeDirectory}/Media/Videos";
      pictures = "${homeDirectory}/Media/Screenshots";
      extraConfig = {
        XDG_REPO_DIR = "${homeDirectory}/Downloads/Repositories";
        XDG_PIC_DIR = "${homeDirectory}/Downloads/Pictures";
        XDG_VID_DIR = "${homeDirectory}/Downloads/Videos";
      };
    };
  };
  
  dconf = {
    enable = true;
    settings = {
      

    };

  };


}

