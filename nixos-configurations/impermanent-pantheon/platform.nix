{ezModules, ...}: {
  imports = [ezModules.pipewire] ++ [./hardware-configuration.nix ./filesystems.nix ./services.nix];
}
