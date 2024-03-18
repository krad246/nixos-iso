{
  inputs,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    "${modulesPath}/installer/cd-dvd/channel.nix"
  ];

  nix = {
    package = pkgs.nixFlakes;
    checkConfig = true;
    gc.automatic = true;
    settings = {
      auto-optimise-store = true;
      sandbox = true;
    };

    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    extraOptions = ''
      experimental-features = nix-command flakes
      eval-cache = false
    '';
  };
}
