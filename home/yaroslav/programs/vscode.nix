{ pkgs, ... } :

{ 
programs.vscode = {
  enable = true;
  package = pkgs.vscode.fhs;
  extensions = with pkgs.vscode-extensions; [
    rust-lang.rust-analyzer
    catppuccin.catppuccin-vsc
    fill-labs.dependi
    usernamehw.errorlens
    catppuccin.catppuccin-vsc-icons
    bungcip.better-toml 
    bbenoist.nix
    #aaronduino.nix-lsp
  ];
  userSettings = {
    "telemetry.telemetryLevel" = "off";
    "workbench.iconTheme" = "catppuccin-mocha";
    "workbench.colorTheme" = "Catppuccin Mocha";
    "extensions.ignoreRecommendations" = true;
    "editor.fontFamily" = "JetBrains Mono";
    "explorer.confirmDelete" = false;
    "editor.defaultFormatter" = "statiolake.vscode-rustfmt";

  };
};
}
