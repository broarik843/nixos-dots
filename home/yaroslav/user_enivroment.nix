{ ... }:

{
  home = {
    sessionVariables = {
      QT_QPA_PLATFORM="wayland";
      NIXOS_OZONE_WL = "1";
      XDG_SESSION_TYPE="wayland";
    };
  };
}
