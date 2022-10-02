# React Devel 

The react-devel is my development environment for React.js on Docker with Emacs.

The settings about React.js are written according to <https://patrickskiba.com/emacs/2019/09/07/emacs-for-react-dev.html>.

## Usage

The running depends on [direnv](https://github.com/direnv/direnv)

```sh
$ https://github.com/eshamster/react-devel.git
$ cd react-devel
$ --- # Copy your SSH key file for GitHub to the current directory.
$ cp .envrc.local.sample .envrc.local
$ vim setenv # properly edit parameters
$ make dev/build
$ make dev/run
```

## Package

Docker image built from the "common/" directory is pushed to ghcr.io

https://github.com/eshamster/react-devel/pkgs/container/react-devel

There are the following tags.

- `latest`: built from `master` branch
- `develop`: built from other branches
- others: built from a tag
