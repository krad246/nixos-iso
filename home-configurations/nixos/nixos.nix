{
  inputs,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  inherit (inputs) agenix;
in {
  imports = [agenix.homeManagerModules.default] ++ [../../home-modules/agenix.nix ../../home-modules/shellenv ../../home-modules/kitty.nix];
  home = {
    username = osConfig.users.users.nixos.name or "nixos";
    stateVersion = lib.trivial.release;
    homeDirectory =
      osConfig.users.users.nixos.home
      or "/home/nixos";

    packages = with pkgs; [direnv nix-direnv git gh];
  };
}
