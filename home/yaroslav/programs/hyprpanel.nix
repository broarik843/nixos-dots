{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    inputs.hyprpanel
    ags
    dart-sass
    #libgtop
    bluez
  ];
    
  


}
