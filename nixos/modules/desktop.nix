{ config, ... }: {

  #Boot settings
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
        driSupport = true;
        driSupport32Bit = true;
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
}
