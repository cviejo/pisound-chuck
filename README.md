# pisound-chuck

## Description

[Patchbox OS / Pisound](https://blokas.io/pisound/) module for [Chuck](https://chuck.cs.princeton.edu/).

## Installation

```sh
patchbox module install https://github.com/cviejo/pisound-chuck
```

By default, this will install Chuck using `apt-get`, which is the quickest and easiest method. The following environment variables can be used to customize the installation:

### Installation Options

**CHUCK_SKIP_INSTALL**: Skip Chuck and chugin installation entirely

```sh
export CHUCK_SKIP_INSTALL=1
patchbox module install https://github.com/cviejo/pisound-chuck
```

**CHUCK_BUILD**: Build Chuck from the latest sources instead of using apt-get

```sh
export CHUCK_BUILD=1
patchbox module install https://github.com/cviejo/pisound-chuck
```

**CHUCK_CHUGINS**: Build and install chugins

```sh
export CHUCK_CHUGINS=1
patchbox module install https://github.com/cviejo/pisound-chuck
```

**CHUCK_MI**: Build and install chugable-instruments (mutable instruments port)

```sh
export CHUCK_MI=1
patchbox module install https://github.com/cviejo/pisound-chuck
```

**CHUGIN_DIR**: Specify a custom directory for chugin installation (default: /usr/local).
The "/lib/chuck" suffix will be added automatically for chugins.

```sh
export CHUGIN_DIR="$HOME/.local"
# Chugins will be installed to "$HOME/.local/lib/chuck"
patchbox module install https://github.com/cviejo/pisound-chuck
```

You can combine multiple options:

```sh
export CHUCK_BUILD=1
export CHUCK_CHUGINS=1
export CHUCK_MI=1
patchbox module install https://github.com/cviejo/pisound-chuck
```

After installation, activate the module:

```sh
patchbox module activate pisound-chuck
```
