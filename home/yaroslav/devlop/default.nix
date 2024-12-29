{ pkgs, ...}: {
  home.packages = with pkgs; [
    gcc
    gnumake

    ninja
    bison

    ncurses
    
    python311
    
    nodejs_latest
    sass

    rustup
    go
    
    ];
}


