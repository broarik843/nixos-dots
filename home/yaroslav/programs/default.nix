{ config, ... }:

{
  imports = [
    ./hyprland.nix
    ./foot.nix
    ./vscode.nix
    #./neovim.nix
    #./fastfetch.nix
    ./starship.nix
    ./ags.nix
    #./zen-browser.nix
    #./hyprpanel.nix
    #./hyprlock.nix
   ];
}
