{
  osConfig,
  lib,
  pkgs,
  ...
}: let
  mkScript = arch:
    pkgs.writeShellScript "colima-${arch}-start" ''
      ${lib.getExe pkgs.colima} start -p ${arch} --arch ${arch} --disk 16 --cpu 2 --memory 2 --foreground --very-verbose
    '';

  mkSystemdService = script: arch:
    lib.mkIf pkgs.stdenv.isLinux {
      systemd.user.services."colima-${arch}-autostart" = {
        Unit = {
          Description = "Start Colima ${arch} VM.";
        };
        Install = {
          WantedBy = ["default.target"];
        };
        Service = {
          ExecStart = "${script}";
        };
      };
    };

  mkLaunchUnit = script: arch:
    lib.mkIf pkgs.stdenv.isDarwin {
      launchd.agents."colima-${arch}-autostart" = {
        enable = true;
        config = {
          EnvironmentVariables = {
            PATH = "${
              osConfig.environment.systemPath
            }";
          };
          Program = "${script}";
          ProgramArguments = ["${script}"];
          RunAtLoad = true;
          KeepAlive = true;
          StandardOutPath = "/tmp/test.stdout";
          StandardErrorPath = "/tmp/test.stderr";
        };
      };
    };

  mkUnits = arch: let script = mkScript arch; in lib.mkMerge [(mkSystemdService script arch) (mkLaunchUnit script arch)];
in {
  home.packages = with pkgs; [colima docker];
  imports = [
    ({
      lib,
      pkgs,
      ...
    }:
      mkUnits "x86_64")
  ];
}
