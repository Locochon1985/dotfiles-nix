{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
	home-manager
    bluez
	waybar
    swww
	rofi-wayland
    inputs.zen-browser.packages."x86_64-linux".generic
  ];
}
