{ pkgs, config, ... }:

{
  home = {
    sessionVariables = {
       LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib:${pkgs.libGL.out}/lib/";
    };
  };
}
