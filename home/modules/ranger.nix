{ pkgs, ... }: {
  programs.ranger = {
    enable = true;
    package = pkgs.ranger;
    settings = {
        preview_images = true;
        preview_images_method = "kitty";
        show_hidden = true;
    };
  };
}
