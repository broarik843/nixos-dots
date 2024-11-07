{ pkgs, ... } :

{
programs.vscode = {
  enable = true;
  package = pkgs.vscode.fhs;
  extensions = with pkgs.vscode-extensions; [
    rust-lang.rust-analyzer
    catppuccin.catppuccin-vsc
    serayuzgur.crates
    usernamehw.errorlens
    catppuccin.catppuccin-vsc-icons
    bungcip.better-toml
  ];
  userSettings = {
    "telemetry.telemetryLevel" = "off";
    "workbench.iconTheme" = "catppuccin-mocha";
    };

};
}
