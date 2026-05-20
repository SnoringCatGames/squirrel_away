# Squirrel Away

_This is still under development and not ready for use._

This project is an example game using the
[Surfacer](https://github.com/SnoringCatGames/surfacer),
[Scaffolder](https://github.com/SnoringCatGames/scaffolder), and
[SnoreCore](https://github.com/SnoringCatGames/snore_core) frameworks.

## Building

This repo expects a **workspace-sibling layout** — see [bootstrapper](https://github.com/SnoringCatGames/bootstrapper) for the umbrella project and `scripts/bootstrap-workspace.ps1`, which clones all required sibling repos (snore_core, scaffolder, surfacer, surf_scaf, godot-cpp, googletest, godot) into the workspace root in one go. Once siblings are in place, build with `scons sc_dev=yes sc_tests=yes` from this directory.
