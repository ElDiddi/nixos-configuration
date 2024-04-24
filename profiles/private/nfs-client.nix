{ ... }:
{
    # NFS usage
    services.rpcbind.enable = true;
    fileSystems."/home/ld/Archive" = {
        device = "192.168.78.105:/volume2/private";
        fsType = "nfs";
        options = [ "x-systemd.automount" "noauto" ];
    };
  }