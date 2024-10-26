{ pkgs, ... }: {
  home = {
    username = "root";
    homeDirectory = "/root";
    stateVersion = "23.11";
    packages = with pkgs; [
      lsd
      fish
      cava
      fastfetch
      home-manager
    ];
  };

  imports = [
    ./programs/fastfetch.nix
  ];
}

