{
  age = {
    secrets.gh.file = ../secrets/gh.age;
  };

  systemd.user.startServices = "sd-switch";
}
