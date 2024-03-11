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
    (with ezModules;
      [efiboot nixos flake-registry impermanence]
      ++ [gnome-desktop nerdfonts]
      ++ [pipewire pam-u2f])
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
    extraGroups = ["NetworkManager" "wheel"];
    packages = with pkgs; [
    ];
    initialHashedPassword = "$y$j9T$oZ2NvBDMhd93Rg4bK7eYf/$TwJuUcU8xdN4SzNfYaY5xA15B.tbHQkhdTmJyF80zzB";
  };

  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = lib.trivial.release;
}
