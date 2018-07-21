{ pkgs ? import (builtins.fetchTarball {
    url = "https://github.com/Infinisil/nixpkgs/archive/cbee20ce0aa535da1605b32999cd83d6c898eff5.tar.gz";
    sha256 = "1cw9hbiq7nnmyzdk7f6b3cwlhwd4pg6pg6yfxb5k70mfypaxdj01";
  }) {}
}:

let

  futharkPackages = pkgs.callPackage (builtins.fetchTarball {
    url = "https://github.com/Infinisil/futharkPackages/archive/88d41439a8d47dc1d33801882e09dbc46850117d.tar.gz";
    sha256 = "18zwkiiamg5wzql6w2n1gxd9fj3dmvyxxw8jasdhycc419kg9ilk";
  }) {};

in with futharkPackages;

buildFuthark {
  name = "heston64";
  src = fetchGit ./.;
  futharkDeps = [ heston ];
}
