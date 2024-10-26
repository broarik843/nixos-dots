{ inputs, pkgs, ... }: 

{
   imports = [ inputs.flatpaks.homeManagerModules.nix-flatpak ];
   services.flatpak = {
     enable = true;
     update.onActivation = true;
     packages = [
       "com.valvesoftware.Steam"   
       "com.github.tchx84.Flatseal"   
       #"io.github.Rirusha.Cassette.Devel"
       "com.mattjakeman.ExtensionManager"  
     ];
     
   };

}

