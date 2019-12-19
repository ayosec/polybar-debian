# Debian Package for Polybar

This repository contains the source to build a Debian package for [Polybar](https://polybar.github.io/).

## Usage

If you have Docker, the easiest way to build the package is using the `build-in-container.sh` script:

```bash
$ ./build-in-container.sh
```

By default, it builds a package for Polybar 3.4.1 in Debian Buster.

You can change the Docker image with `-i`, and the version with `-v`. For example, to build the current `master` in Ubuntu 19.04, use the following command:

```bash
$ ./build-in-container.sh -i ubuntu:19.04 -v master
```

If you change the version, you should update the `debian/changelog` file, so the package is generated with the correct version.

After some minutes, the directory `target` contains the `.deb` files that you can install:

```bash
$ sudo dpkg -i target/polybar_3.4.1-1_amd64.deb

$ sudo apt-get -f install   # Only is any package is missing
```

## Patches

The repository contains a patch to change the warning message printed when a character can't be printed. With this patch, the full text is printed in the message (instead of just the character). I needed this to debug some issues with my configuration. If you don't want the patch, just remove the `debian/patches/` directory.

```bash
$ rm -fr debian/patches
$ ./build-in-container.sh
```
