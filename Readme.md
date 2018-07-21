# Futhark Nix Demo

This a quick and dirty demo of how [Futhark](https://futhark-lang.org/) could potentially use Nix as its future package manager. Due to time constraints, I cannot implement any better demo than this right now.

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
