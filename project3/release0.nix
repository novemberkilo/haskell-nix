let
  config = {
    packageOverrides = pkgs: rec {
      haskellPackages = pkgs.haskellPackages.override {
        overrides = haskellPackagesNew: haskellPackagesOld: rec {
          project3 =
            haskellPackagesNew.callPackage ./default.nix {
              tar = pkgs.libtar;
            };
        };
      };
    };
  };

  pkgs = import <nixpkgs> { inherit config; };

in
  { project3 = pkgs.haskellPackages.project3;
  }
