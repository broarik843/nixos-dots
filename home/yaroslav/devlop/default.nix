{ pkgs, ...}: {
  home.packages = with pkgs; [
    gcc
    gnumake

    ninja
    bison

    ncurses
    
    python311
    
    nodejs

    rustup
    
    ];
}


