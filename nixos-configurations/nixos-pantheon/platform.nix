{ezModules, ...}: {
  imports = [ezModules.pipewire] ++ [./services.nix];
}
