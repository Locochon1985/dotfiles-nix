{ pkgs, ... }: {
  gtk = {
    enable = true;
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      name = "TokyoNight-Dark";
      package = pkgs.tokyonight-gtk-theme;
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "Adwaita-dark";
    style.package = pkgs.adwaita-qt;
  };
}
