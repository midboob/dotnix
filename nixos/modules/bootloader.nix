{ config, ... }:

{
	boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = true;
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
}
