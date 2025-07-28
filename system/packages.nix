{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
	home-manager
    bluez
	waybar
    swww
	rofi-wayland
  ];
}
