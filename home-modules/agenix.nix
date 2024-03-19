{
  inputs,
  config,
  pkgs,
  ...
}: let
  inherit (inputs) agenix;
in {
  imports = [agenix.homeManagerModules.age];
  age = {
    secrets.gh.file = ../secrets/gh.age;
  };

  home.packages = [agenix.packages.${pkgs.stdenv.system}.default];

  systemd.user.services."agenix-gh-autologin" = {
    Unit = {
      Description = "GitHub CLI autolog after secrets mounting";
      Requires = ["agenix.service"];
    };
    Install = {
      WantedBy = ["default.target"];
    };
    Service = {
      ExecStart = "${pkgs.bash}/bin/bash -c \\
        '${pkgs.gh}/bin/gh auth login -p ssh \\
          --with-token < ${config.age.secrets.gh.path}'";
      Environment = ["XDG_RUNTIME_DIR=%t"];
    };
  };
}
