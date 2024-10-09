{ pkgs, ... }: {
  programs.zsh = {
  enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "eza --icons";
      la = "eza -a -G --icons";
      lt = "eza --tree --icons";
      home = "home-manager switch --flake ~/.dotfiles";
      system = "sudo nixos-rebuild switch --flake ~/.dotfiles";
      dev = "nix develop ~/.dotfiles";
    };
  };
  programs.eza = {
        enable = true;
        enableZshIntegration = true;
  };
  programs.bat = {
    enable = true;
    package = pkgs.bat;
    config = {
      theme = "gruvbox-dark";
    };
  };
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    package = pkgs.zoxide;
  };
}
