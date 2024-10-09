{
  home.username = "giuliano";
  home.homeDirectory = "/home/giuliano";
  home.stateVersion = "23.11"; # Please read the comment before changing.
  nixpkgs.config.allowUnfree = true;
  
  imports = [ 
  ./packages.nix
  ./zsh.nix
  ./modules/all.nix
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
