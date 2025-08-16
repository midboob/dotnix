{ config, pkgs, ... }: {

  # Boot settings
	boot = {
    loader = {
      grub = {
        extraEntries = ''
          menuentry "Arch Linux (manual)" {
            insmod part_gpt
            insmod fat
            search --no-floppy --fs-uuid --set=root 3A75-2890
            linux /vmlinuz-linux root=UUID=b9c9d8e4-b049-4ac5-a48a-c0f7a1e96603 rw quiet
            initrd /initramfs-linux.img
            }
        '';
      };
    };
  };
  boot.supportedFilesystems = [ "ntfs" ];

  # Mounting additional drives
  fileSystems = {
    "/mnt/Storage" = {
        device = "/dev/disk/by-uuid/9A62A5A562A5871B";
        fsType = "ntfs-3g";
        options = [ "rw" "uid=1000" "gid=100" "dmask=022" "fmask=133" ];
      };

    "/mnt/Windows" = {
        device = "/dev/disk/by-uuid/16E288D1E288B711";
        fsType = "ntfs-3g";
        options = [ "rw" "uid=1000" "gid=100" "dmask=022" "fmask=133" ];
      };
    };

  # Polkit rule to allow users in 'wheel' group to mount internal drives without password
  environment.etc."polkit-1/rules.d/90-local-mount.rules".text = ''
    polkit.addRule(function(action, subject) {
        if (action.id == "org.freedesktop.udisks2.filesystem-mount-system" &&
            subject.isInGroup("wheel")) {
            return polkit.Result.YES;
        }
    });
  '';

  # Graphic Settings
	hardware.nvidia = {
		modesetting.enable = true;
		nvidiaSettings = true;
		open = false;
		package = config.boot.kernelPackages.nvidiaPackages.stable;
	};
 
	services.xserver.videoDrivers = ["nvidia"];
  hardware = {
    graphics.enable = true;
    opengl = {
        enable = true;
      };
    };

	environment.sessionVariables = {
		LIBVA_DRIVER_NAME = "nvidia";
		GBM_BACKEND = "nvidia-drm";
		__GLX_VENDOR_LIBRARY_NAME = "nvidia";
		__GL_GSYNC_ALLOWED = "1";
		__GL_VRR_ALLOWED = "1";
		__VK_LAYER_NV_optimus = "NVIDIA_only";
		NVD_BACKEND = "direct";
	};

  # OpenRGB
  services.hardware.openrgb = {
    enable = true; 
    package = pkgs.openrgb; 
    motherboard = "amd"; 
  };

  systemd.user.services.openrgb-profile = {
    description = "Apply OpenRGB profile at boot";
    after = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];

    serviceConfig = {
      Type = "simple";
      ExecStartPre = "${pkgs.coreutils}/bin/sleep 2";
      ExecStart = "${pkgs.openrgb}/bin/openrgb --no-gui --profile %h/.config/OpenRGB/white.orp";
      Restart = "on-failure";
      RestartSec = 2;
      ConditionPathExists = "%h/.config/OpenRGB/white.orp";
    };
  };

  # # Optimizations
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.kernelModules = [ "ntsync" ];
  boot.kernelParams = [
    "mitigations=off"     # Security/performance trade-off (~5% gain)
    "amd_pstate=active"   # For Zen 2+ CPUs
  ];
  powerManagement.cpuFreqGovernor = "performance";
}
