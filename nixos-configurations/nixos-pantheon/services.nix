{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.networkmanager.enable = true;
  networking.wireless.enable = !config.networking.networkmanager.enable;

  services.system76-scheduler.enable = true;
  services.flatpak.enable = true;
  services.pipewire.enable = true;

  security.rtkit.enable = true;

  hardware.opengl.enable = true;
}
