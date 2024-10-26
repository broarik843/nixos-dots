{ config, pkgs, ... }: {
    /*home.pointerCursor = {
      package = 
      name = "oreo_cursor"; 
      size = 24;
      gtk.enable = true;
      x11.enable = true;
    };*/

  home.packages = with pkgs; [
    gradience
    adw-gtk3
  ];

  gtk = {
    enable = true;
    font.name = "Noto Sans 11";
    theme = {
      name = "adwaita";
      package = pkgs.libadwaita;
    };
    gtk3.extraConfig = {
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
    };
    gtk2 = {
      configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
      extraConfig = ''
        gtk-xft-antialias=1
        gtk-xft-hinting=1
        gtk-xft-hintstyle="hintslight"
        gtk-xft-rgba="rgb"
      '';
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-folders;
    };
  };

  qt = {
    enable = true;
    platformTheme = "qtct";
    style = {
      package = pkgs.catppuccin-kde;
      name = "Catpuccin-Mocha-Dark";
    };
  };

  home.sessionVariables = {
    GTK_THEME = "${config.gtk.theme.name}";
  };
}
