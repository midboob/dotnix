{ inputs, config, lib, ... }: {

  imports = [
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480s
  ];

  powerManagement.enable = true;
  services = {
    thermald.enable = true;
    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };
    power-profiles-daemon.enable = true;
    logind.lidSwitch = "suspend-then-hibernate";
    logind.powerKey = "hibernate";
    logind.powerKeyLongPress = "poweroff";
  };
  boot.kernelParams = ["mem_sleep_default=deep"];

  systemd.sleep.extraConfig = ''
    HibernateDelaySec=30m
    SuspendState=mem
  '';
}
