{pkgs, ...}: {
  # Drop some of the more... annoying of elementary's programs
  environment.pantheon.excludePackages = with pkgs.pantheon; [
    elementary-music
    elementary-tasks
    elementary-feedback
    elementary-calculator
    elementary-code
  ];

  # Enable X11 windowing.
  # Select the Pantheon desktop environment (elementary OS)
  # Add extra indicators and panel plugins.
  # Enable high-resolution booting.
  # Enable wacom tablets.
  services = {
    pantheon = {
      apps.enable = true;
      contractor.enable = true;
    };

    xserver = {
      enable = true;
      enableCtrlAltBackspace = true;
      displayManager.lightdm.enable = true;

      layout = "us";
      xkbVariant = "";
      desktopManager.pantheon = {
        enable = true;
        extraWingpanelIndicators = with pkgs.pantheon; [
          wingpanel-indicator-network
          wingpanel-indicator-notifications
          wingpanel-indicator-bluetooth
          wingpanel-indicator-session
          wingpanel-indicator-nightlight
          wingpanel-indicator-keyboard
          wingpanel-indicator-a11y
          wingpanel-indicator-datetime
          wingpanel-indicator-power
        ];

        extraSwitchboardPlugs = with pkgs.pantheon; [
          switchboard-plug-keyboard
          switchboard-plug-network
          switchboard-plug-onlineaccounts
          switchboard-plug-mouse-touchpad
          switchboard-plug-datetime
          switchboard-plug-bluetooth
          switchboard-plug-sound
          switchboard-plug-applications
          switchboard-plug-power
          switchboard-plug-a11y
          switchboard-plug-pantheon-shell
          switchboard-plug-printers
          switchboard-plug-security-privacy
          switchboard-plug-notifications
          switchboard-plug-about
          switchboard-plug-display
          switchboard-plug-wacom
        ];
      };

      videoDrivers = ["modesetting"];
      wacom.enable = true;
    };
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  hardware.opengl.enable = true;
  services.system76-scheduler.enable = true;
}
