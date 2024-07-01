{
  ezModules,
  lib,
  pkgs,
  osConfig,
  ...
}: let
  homeModules = ezModules;
in {
  imports = with homeModules; [nerdfonts shellenv vscode];
  home = {
    username = osConfig.users.users.nixos.name or "nixos";
    stateVersion = lib.trivial.release;
    homeDirectory =
      osConfig.users.users.nixos.home
      or "/home/nixos";

    packages = with pkgs; [];
  };
}
