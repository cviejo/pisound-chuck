# pisound-chuck

## Description

[Patchbox OS / Pisound](https://blokas.io/pisound/) module for [Chuck](https://chuck.cs.princeton.edu/).

## Installation

```sh
patchbox module install https://github.com/cviejo/pisound-chuck
```

By default, this will install Chuck using `apt-get`, which is the quickest and easiest method. If you prefer to build Chuck from the latest sources:

```sh
export CHUCK_BUILD=1
patchbox module install https://github.com/cviejo/pisound-chuck
```

If you want to build and install chugins as well, use:

```sh
export CHUCK_CHUGINS=1
patchbox module install https://github.com/cviejo/pisound-chuck
```

After installation, activate the module:

```sh
patchbox module activate pisound-chuck
```
