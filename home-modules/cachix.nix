{
  osConfig,
  lib,
  pkgs,
  ...
}: {
  imports = [../cachix.nix];
  home.packages = with pkgs; [cachix];
  nix.package = lib.mkDefault osConfig.nix.package;
}
