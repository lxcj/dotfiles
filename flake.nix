{
  description = "NixOS configuration of lx";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = { nixpkgs, nixos-wsl, home-manager, nixvim, ... }:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
      
        modules = [
          nixos-wsl.nixosModules.default

          ./configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.lx.imports = [
              nixvim.homeModules.nixvim

              ./home.nix
            ];
            home-manager.backupFileExtension = "backup";
          }
        ];
      };
    };
}
