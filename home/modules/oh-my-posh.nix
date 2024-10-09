{ pkgs, ... }: {
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    package = pkgs.oh-my-posh;
    settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile "${pkgs.oh-my-posh}/share/oh-my-posh/themes/space.omp.json"));
  };
}
