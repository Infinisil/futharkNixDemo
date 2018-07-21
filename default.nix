{ pkgs ? import (builtins.fetchTarball {
    url = "https://github.com/Infinisil/nixpkgs/archive/cbee20ce0aa535da1605b32999cd83d6c898eff5.tar.gz";
    sha256 = "1cw9hbiq7nnmyzdk7f6b3cwlhwd4pg6pg6yfxb5k70mfypaxdj01";
  }) {}
}:

let

  futharkPackages = pkgs.callPackage ../futharkPackages {};

  heston64 = with futharkPackages;
    buildFuthark {
      name = "heston";
      src = fetchGit ./.;
      futharkDeps = [
        heston
      ];
    };

in heston64

