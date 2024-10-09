{ inputs,... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./packages.nix
      ./modules/all.nix
    ];
  nix.settings.experimental-features = ["nix-command" "flakes"];

  nixpkgs.config.allowUnfree = true;
   
  system.stateVersion = "24.05"; # Did you read the comment?
}
