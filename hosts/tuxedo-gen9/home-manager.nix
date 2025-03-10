{ inputs, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = false;
    backupFileExtension = "backup";
    users."kengo" = {
      imports = [
        ./../../home/nixos
      ];
    };
  };
}
