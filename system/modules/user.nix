{ pkgs, ... }: {
  programs.zsh.enable = true;
  users = {
    defaultUserShell = pkgs.zsh;
    users.giuliano = {
    isNormalUser = true;
    useDefaultShell = true;
    description = "Giuliano";
    extraGroups = [ "networkmanager" "wheel" "audio" "sound" ];
    packages = with pkgs; [];
    };
  };
}
