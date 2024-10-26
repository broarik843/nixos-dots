{ pkgs, ... } :

{
programs.vscode = {
  enable = true;
  package = pkgs.vscodium;
  extensions = with pkgs.vscode-extensions; [
    catppuccin.catppuccin-vsc
    serayuzgur.crates
    usernamehw.errorlens
    pkief.material-icon-theme
    pkief.material-product-icons
    #caiqichang.vscode-translation
    #pinage404.rust-extension-pack
    #hbenl.test-adapter-converter
  ];
};
}
