{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
    excludePackages = [ pkgs.xterm ];
    displayManager.lightdm.enable = true;
  };
}
