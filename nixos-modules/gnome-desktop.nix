{
  services = {
    xserver = {
      enable = true;
      enableCtrlAltBackspace = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      displayManager.startx.enable = true;
      videoDrivers = ["modesetting"];
    };
  };

  hardware.opengl.enable = true;
  services.system76-scheduler.enable = true;
}
