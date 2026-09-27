# Omega Homebrew tap

Experimental, unsigned builds of the [Omega compiler](https://github.com/CathedralOS/Omega).
Currently: Apple Silicon macOS 14+ and Linux x64/ARM64. See each release's tested hosts;
older operating systems are not guaranteed compatible.

```sh
brew install cathedralos/omega/omega
omega --version
```

Upgrade the compiler:

```sh
brew update
brew upgrade cathedralos/omega/omega
```

`omega update` updates a project's dependencies, not the compiler installation.
This tap installs the complete prebuilt bundle and Git; it does not compile Rust.
See the [installation guide](https://github.com/CathedralOS/Omega/blob/main/wiki/installation.md)
for a first native program and dependency review.

Uninstall with `brew uninstall cathedralos/omega/omega`.

## Updating this tap

Generate the formula from verified release assets using Omega's
[`tools/release/channels.py`](https://github.com/CathedralOS/Omega/blob/main/tools/release/README.md#prepare-installation-channels).
Publish the matching GitHub prerelease before updating its URLs here. Never
replace an existing release's bytes or remove checksum verification.

The workflow installs from the public tap on fresh macOS/Linux hosts and builds
and runs a native program through the installed compiler. It does not establish
compiler completeness or code-signing authenticity.
