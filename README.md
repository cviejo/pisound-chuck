# pisound-chuck

## Description

[Patchbox OS / Pisound](https://blokas.io/pisound/) module for [Chuck](https://chuck.cs.princeton.edu/).

## Installation

```sh
patchbox module install https://github.com/cviejo/pisound-chuck
patchbox module activate pisound-chuck
```

Or if you prefer to build Chuck from the latest sources:

```sh
export CHUCK_BUILD=1
patchbox module install https://github.com/cviejo/pisound-chuck
```

This will clone the Chuck repository, install necessary dependencies, and build Chuck with JACK support.

If you want to build and install chugins as well, use:

```sh
export CHUCK_CHUGINS=1
patchbox module install https://github.com/cviejo/pisound-chuck
```
