{ config, ... }:

{
  imports = [
    ./hyprland.nix
    ./foot.nix
    ./vscode.nix
    #./fastfetch.nix
    ./starship.nix
    #./zen-browser.nix
   
   ];
}
