{ pkgs, ... } :

{
programs.vscode = {
  enable = true;
  package = pkgs.vscode-fhs;
  extensions = with pkgs.vscode-extensions; [
    rust-lang.rust-analyzer
    catppuccin.catppuccin-vsc
    serayuzgur.crates
    usernamehw.errorlens
    pkief.material-icon-theme
    pkief.material-product-icons
    #phind.phind
    #caiqichang.vscode-translation
    #pinage404.rust-extension-pack
    #hbenl.test-adapter-converter
  ];
};
}
