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

## Scripts

On start `launch.sh` searches recursively the `/home/patch/chuck` directory for any files ending with `main.ck`. This includes both files named exactly `main.ck` and files with prefixes like `midi.main.ck`.

- If no main.ck files are found, it starts ChucK in server mode (`chuck -l`)

- If main.ck files are found, it launches each main.ck file in a separate ChucK process and flashes LEDs on the Pisound hardware to indicate each launch
