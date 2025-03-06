{ pkgs, inputs, ... }:
{
  imports = [ inputs.musnix.nixosModules.musnix ];

  musnix = {
    enable = true;
    soundcardPciId = "00:1f.3";
    # kernel = {
      # realtime = true;
      # packages = pkgs.linuxPackages_latest_rt;
    # };
    rtirq.enable = true;
  };
}
