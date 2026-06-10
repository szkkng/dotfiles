{ inputs, ... }:
{
  imports = [
    inputs.catppuccin.nixosModules.catppuccin
  ];

  catppuccin.enable = true;
  catppuccin.autoEnable = true;
}
