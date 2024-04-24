{ userSettings, ... }:

{
  imports = [ ./base.nix
              ( import ../../system/security/sshd.nix {
                authorizedKeys = [ "ssh-rsa AAAAB3N"];
                inherit userSettings; })
            ];
}
