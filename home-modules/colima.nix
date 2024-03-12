{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [colima docker];
  systemd.user.services.colima-intel-autostart = {
    Unit = {
      Description = "Push nix store changes to attic binary cache.";
    };
    Install = {
      WantedBy = ["default.target"];
    };
    Service = {
      ExecStart = "${pkgs.writeShellScript "colima-intel-start" ''
        #!/run/current-system/sw/bin/bash
        ${lib.getExe pkgs.colima} start -p intel --disk
      ''}";
    };
  };
}
