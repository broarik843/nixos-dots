# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ inputs, config, lib, pkgs, modulesPath, ... }:

{
  imports = with inputs;
  [ 
    (modulesPath + "/installer/scan/not-detected.nix") 
    "${nixos-hardware}/lenovo/thinkpad/t14/amd/gen1"
  ];
  
  #NetworkManager disable not needed service 
  systemd = {
    targets.network-online.wantedBy = pkgs.lib.mkForce [];
    services = {
      NetworkManager-wait-online.wantedBy = pkgs.lib.mkForce []; 
      NetworkManager-wait-online.enable = false;
      systemd-udev-settle.enable = false;

      "getty@tty1".enable = false;
      "autovt@tty1".enable = false;
    };
  };  
  
  #TLP
  services.power-profiles-daemon.enable = false;
  services = {
    thermald.enable = true;
    tlp = { 
      enable = true;
      settings = {
        USB_AUTOSUSPEND=1;
        AMDGPU_ABM_LEVEL_ON_BAT="1";
        AMDGPU_ABM_LEVEL_ON_AC="1";
        CPU_SCALING_GOVERNOR_ON_AC="shedutil";
        CPU_SCALING_GOVERNOR_ON_BAT="perfomance";
        RUNTIME_PM_ON_AC="auto";
        RUNTIME_PM_ON_BAT="auto";
        PLATFORM_PROFILE_ON_AC = "balanced";
        PLATFORM_PROFILE_ON_BAT = "perfomance";
        SCHED_POWERSAVE_ON_AC= 1;
        SCHED_POWERSAVE_ON_BAT= 0;
        CPU_ENERGY_PERF_POLICY_ON_AC = "balance_power";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "perfomance";
        DISK_DEVICES="nvme0n1";
        START_CHARGE_THRESH_BAT0 = 90;
        STOP_CHARGE_THRESH_BAT0 = 100;
      };
    };
  };

    
  
  # False hardware support Pulseaudio
  hardware.pulseaudio.enable = false;   
  
  hardware.graphics = {
    
      enable = true;
      enable32Bit = true;
          };
  hardware.graphics.extraPackages = with pkgs; [
    rocmPackages.clr.icd
  ];
  # Bootloader.
  boot = {
    kernelPackages = pkgs.linuxPackages_zen; 
  loader = {
  systemd-boot.enable = false;
    efi = {
       canTouchEfiVariables = true;
       efiSysMountPoint = "/boot";
     };
     grub = { 
       enable = true;
       device = "nodev";
       efiSupport = true;
       #splashImage = /e;
     };
     timeout = 5;
    };
  initrd.availableKernelModules = ["nvme" "ehci_pci" "xhci_pci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  initrd.kernelModules = [ ];
  kernelModules = [ "kvm-amd" "amdgpu" "v4l2loopback" ];
  extraModulePackages = [ pkgs.linuxPackages_zen.v4l2loopback ];
  extraModprobeConfig = ''
    options thinkpad_acpi fan_control=1
  ''; 
  }; 



  fileSystems."/" =
    { device = "/dev/disk/by-uuid/ee297ca4-cc3d-4050-a1fd-51c9ca3521fb";
      fsType = "btrfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/AB81-4E39";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };


  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 6096;
  } ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp1s0f0u4.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp6s0.useDHCP = lib.mkDefault true;

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
