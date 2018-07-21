{ pkgs ? import (builtins.fetchTarball {
    url = "https://github.com/Infinisil/nixpkgs/archive/cbee20ce0aa535da1605b32999cd83d6c898eff5.tar.gz";
    sha256 = "1cw9hbiq7nnmyzdk7f6b3cwlhwd4pg6pg6yfxb5k70mfypaxdj01";
  }) {}
}:

let

  futharkPackages = pkgs.callPackage (builtins.fetchTarball {
    url = "https://github.com/Infinisil/futharkPackages/archive/c587a7495f752f542d9cbd7946cd6d52aa161873.tar.gz";
    sha256 = "03k6s85fmxg0p7gpgymwnxa0a628yn06qf5l42icjaazd0g6d2bp";
  }) {};

in with futharkPackages;

buildFuthark {
  name = "heston64";
  src = fetchGit ./.;
  futharkDeps = [ heston ];
}
