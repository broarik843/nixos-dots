{ pkgs, ... }: let 
  username = "yaroslav";
  hostname = "system";
  passroot = "";
  passuser = "";

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
      "netdev"
      "libvirtd"
      "networkmanager"
    ];
    shell = pkgs.fish;
  };

}

