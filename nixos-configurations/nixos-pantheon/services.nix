{
  config,
  lib,
  ...
}: {
  imports = [];

  services.fstrim.enable = true;
  services.flatpak.enable = true;

  # xdg-desktop-portal works by exposing a series of D-Bus interfaces
  # known as portals under a well-known name
  # (org.freedesktop.portal.Desktop) and object path
  # (/org/freedesktop/portal/desktop).
  # The portal interfaces include APIs for file access, opening URIs,
  # printing and others.
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    # gtk portal needed to make gtk apps happy
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  # FIXME: for gsettings and the like (maybe?!)
  programs.dconf.enable = true;

  # Sound administered via Pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    alsa = {
      enable = true;
      support32Bit = true;
    };

    pulse.enable = true;
    jack.enable = true;
  };

  hardware = {
    opengl = {
      enable = true;
      driSupport32Bit = true;
    };
  };

  # Better UI scheduling
  services.system76-scheduler.enable = true;

  networking.wireless.enable = lib.mkDefault true;
  networking.networkmanager.enable = !config.networking.wireless.enable;
}
