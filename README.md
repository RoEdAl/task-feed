# *OpenWRT* packages of projects using *Go* language template engine

> [!IMPORTANT]
> The only supported *OpenWRT* version is **24.10**.

## Packages

* [go-task/task](https://github.com/go-task/task)

  A [task runner](https://taskfile.dev/).
  Simpler *Make* alternative written in *Go*. \
  You may also consider this tool as *Bash* on steroids.

* [hairyhenderson/gomplate](https://github.com/hairyhenderson/gomplate)

  A flexible [commandline tool](https://docs.gomplate.ca/) for template rendering. \
  Supports lots of local and remote datasources.

* [bluebrown/go-template-cli](https://github.com/bluebrown/go-template-cli)

  Render *json*, *yaml* & *toml* with *go* templates, from the command line.

## Installation

### Download and run [installation script](https://github.com/RoEdAl/task-feed/blob/main/openwrt/task-feed.sh)

```sh
wget -qO - https://roedal.github.io/task-feed/task-feed.sh | sh
```

### Update package list

```sh
$ opkg update
Downloading https://roedal.github.io/task-feed/aarch64_generic/gomplate/Packages.gz
Updated list of available packages in /var/opkg-lists/gomplate
Downloading https://roedal.github.io/task-feed/aarch64_generic/gomplate/Packages.sig
Signature check passed.
⋯
```

### Install required package(s)

```sh
opkg install go-task
```
