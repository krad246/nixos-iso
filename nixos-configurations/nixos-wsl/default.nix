{ezModules, ...}: {
  imports = [ezModules.nixos ezModules.wsl] ++ [./platform.nix];

  nixpkgs.hostPlatform = "x86_64-linux";
}
