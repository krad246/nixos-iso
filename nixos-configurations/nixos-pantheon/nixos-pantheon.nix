{
  inputs,
  ezModules,
  pkgs,
  lib,
  ...
}: let
  inherit (inputs) nixos-hardware;
in {
  imports =
    (with ezModules; [efiboot nixos flake-registry] ++ [pantheon-desktop nerdfonts])
    ++ (with nixos-hardware.nixosModules; [
      common-cpu-amd
      common-gpu-amd
      common-pc
      common-pc-ssd
    ]);

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.krad246 = {
    isNormalUser = true;
    description = "Keerthi";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
    ];
    initialHashedPassword = "";
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "krad246";

  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = lib.trivial.release;
}
