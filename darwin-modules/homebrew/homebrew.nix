{config, ...}: {
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };

    taps = [
      "homebrew/core"
      "homebrew/cask"
      "homebrew/cask-fonts"
      "homebrew/cask-versions"
      "homebrew/services"
    ];

    global.brewfile = true;
  };

  environment.systemPath = ["${config.homebrew.brewPrefix}"];
}
