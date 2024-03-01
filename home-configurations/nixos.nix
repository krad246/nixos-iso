{
  lib,
  osConfig,
  ezModules,
  pkgs,
  ...
}: {
  imports = with ezModules; [shellenv kitty starship];
  home = {
    username = osConfig.users.users.nixos.name or "nixos";
    stateVersion = lib.trivial.release;
    homeDirectory =
      osConfig.users.users.nixos.home
      or "/home/nixos";

    packages = with pkgs; [direnv nix-direnv git gh];
  };
}
