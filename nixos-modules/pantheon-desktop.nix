{pkgs, ...}: {
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

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
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

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
}
