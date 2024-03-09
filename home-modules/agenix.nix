{
  pkgs,
  lib,
  config,
  ...
}: {
  # In home-manager.users.your-name-here
  age = {
    secrets.gh.file = ../secrets/gh.age;
  };

  home.activation.ghAuth =
    lib.mkForce (lib.hm.dag.entryAfter ["writeBoundary"] ''
      '');

  systemd.user.services.foobar = {
    Unit = {
      Description = "my service";
      Requires = "agenix.service";
    };
    Service = {
      Type = "exec";
      ExecStart = ''
        ${lib.getExe pkgs.gh} auth login --with-token < ${config.age.secrets.gh.path} || true;
        ssh -T git@github.com
      '';
      Restart = "on-failure";
    };
    Install = {WantedBy = ["default.target"];};
  };

  systemd.user.startServices = "sd-switch";
}
