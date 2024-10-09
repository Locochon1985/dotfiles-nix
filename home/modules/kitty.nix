{ pkgs, ... }: {
    programs.kitty = {
        enable = true;
        package = pkgs.kitty;
        shellIntegration = {
            enableZshIntegration = true;
        };
        extraConfig = "  font_family      JetBrainsMono Nerd Font Mono\n  font_size        12\n  cursor_blink_interval 0.5\n  include current-theme.conf\n  confirm_os_window_close 0";
    };
}
