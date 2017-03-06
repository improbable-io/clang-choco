# LLVM package

This packages up LLVM for Windows, making it possible to install via [`choco install clang`](https://chocolatey.org/packages/clang).

## Contributing

### Packaging a new version of LLVM

0. Make a new branch - `git checkout -b <your new branch>`
0. Change the URLs and checksums in `tools\chocolateyinstall.ps1` to point at the version that you want to package (see [LLVM releases](http://releases.llvm.org/download.html)).
0. Run `build.ps1 -version <new version>`
0. Run `test.ps1`

Submit a PR with your changes with our thanks!

### Making a new package for an already-released version of clang

(To fix a package)

As above, but the package version should follow [chocolatey package fix  notation](https://github.com/chocolatey/choco/wiki/CreatePackages#package-fix-version-notation) instead of being the same version as the software contained.

This means - run `build.ps1`, then edit the `nuspec` and set the value of `<version>` element to your package-fix version.
