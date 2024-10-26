{ pkgs, ... }: let 
  username = "yaroslav";
  hostname = "system";
  passroot = "password";
  passuser = "password";

in {
  
   users.users.root = {
    shell = pkgs.fish;
    initialPassword = passroot;
  };

   users.users.${username} = {
    isNormalUser = true;
    initialPassword = passuser;
    home = "/home/${username}";
    extraGroups = [
      #"jackaudio"
      "wheel"
      "adbusers"
      "podman"
      "libvirtd"
    ];
    shell = pkgs.fish;
  };

}

