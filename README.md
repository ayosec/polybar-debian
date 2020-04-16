**UPDATE** Since 2020-04-13, Polybar is [available in Debian Unstable](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=856179#106).

---

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
## New release

To publish a new release:

* Change the default value for `VERSION` in `build.sh` and `build-in-container.sh`.
* Add a new entry in `debian/changelog`.
* Create a new tag with the version for the Debian package.

When the tag is uploaded, the packages are built and uploaded to a new release in the GitHub repository.
