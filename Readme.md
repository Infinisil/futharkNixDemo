# Futhark Nix Demo

This a quick and dirty demo of how [Futhark](https://futhark-lang.org/) could potentially use Nix as its future package manager. Due to time constraints, I cannot implement any better demo than this right now.

Movitaion for it was [this recent Futhark blog entry](https://futhark-lang.org/blog/2018-07-20-the-future-futhark-package-manager.html) on creating a package manager ([Reddit discussion](https://www.reddit.com/r/ProgrammingLanguages/comments/90fnop/the_future_futhark_package_manager/)). This is an artificion packagification of https://github.com/diku-dk/futhark-benchmarks/tree/master/misc/heston.

Note that I had to package Futhark for Nix first. The pull request to add it to Nixpkgs is https://github.com/NixOS/nixpkgs/pull/43865

Also see the comments in the filse

## Packages
See the package repository at https://github.com/Infinisil/futharkPackages

## Build

```bash
$ nix-build
```

## Develop

```bash
$ nix-shell
[nix-shell:~]$ installpath
[nix-shell:~]$ futhark-c heston64.fut
[nix-shell:~]$ uninstallpath
```

This is needed because Futhark can't include other paths, so we need to set up some symlinks to have access to the dependencies in the current directory.

## Todo/Ideas

- [hard] Use propagatedBuildInputs to decrease the number of derivations
- [easy] Support docs, tests, etc.
- [hard] Better filtering (fetchGit/filterSource/custom derivation?)
