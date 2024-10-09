{pkgs, ...}: {
  home.packages = [
    pkgs.waypaper
    pkgs.fastfetch
    pkgs.ripgrep
    pkgs.eza
    (pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];
}
