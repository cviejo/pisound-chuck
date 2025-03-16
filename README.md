# pisound-chuck

## Description

[Patchbox OS / Pisound](https://blokas.io/pisound/) module for [Chuck](https://chuck.cs.princeton.edu/).

## Installation

```sh
patchbox module install https://github.com/cviejo/pisound-chuck
```

By default, this will install Chuck using `apt-get`, which is the quickest and easiest method. The following environment variables can be used to customize the installation:

```sh
# Skip Chuck and chugin installation entirely
export CHUCK_SKIP_INSTALL=1

# Build Chuck from the latest sources instead of using apt-get install
export CHUCK_BUILD=1

# Build and install chugins
export CHUCK_CHUGINS=1

# Build and install chugable-instruments chugins (mutable instruments port)
export CHUCK_MI=1

# Specify a custom directory for chugin installation (default: /usr/local)
# The "/lib/chuck" suffix will be added automatically, in this example chugins
# will be installed to "$HOME/.local/lib/chuck":
export CHUGIN_DIR="$HOME/.local"

patchbox module install https://github.com/cviejo/pisound-chuck
```

After installation, activate the module:

```sh
patchbox module activate pisound-chuck
```
