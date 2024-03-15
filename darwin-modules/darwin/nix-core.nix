{pkgs, ...}: {
  nix = {
    package = pkgs.nixFlakes;
    checkConfig = true;
    gc.automatic = true;
    settings = {
      auto-optimise-store = true;
      sandbox = false;
    };

    extraOptions = ''
      experimental-features = nix-command flakes
      eval-cache = false
    '';

    nixPath = [
      "nixpkgs=${pkgs.path}"
    ];

    useDaemon = true;
  };

  nixpkgs.config.allowUnfree = true;
  services.nix-daemon.enable = true;
  system.stateVersion = 4;
}
