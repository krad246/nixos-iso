_: {
  # Filesystem configurations to overlay over top of whatever the hardware configuration is.
  # Designed around impermanence.

  fileSystems."/" = lib.mkDefault {
    device = "tmpfs";
    fsType = "tmpfs";
  };

  fileSystems."/boot" = lib.mkDefault {
    device = "/dev/disk/by-label/BOOT";
    fsType = "vfat";
  };

  boot.initrd.luks.devices."nix".device =
    lib.mkDefault "/dev/disk/by-label/cryptdata";

  fileSystems."/nix" = lib.mkForce {
    device = "/dev/mapper/nix";
    fsType = "btrfs";
    options = ["subvol=@"];
  };

  fileSystems."/nix/persist" = lib.mkForce {
    device = "/dev/mapper/nix";
    fsType = "btrfs";
    options = ["subvol=@persist"];
    neededForBoot = true;
  };

  fileSystems."/secrets" = lib.mkDefault {
    device = "/dev/mapper/nix";
    fsType = "btrfs";
    options = ["subvol=@secrets"];
    neededForBoot = true;
  };

  fileSystems."/etc/nixos" = lib.mkDefault {
    device = "/nix/persist/etc/nixos";
    fsType = "none";
    options = ["bind"];
  };
}
