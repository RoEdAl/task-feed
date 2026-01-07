# *OpenWRT* packages of projects using *Go* language template engine

> [!IMPORTANT]
> The only supported *OpenWRT* version is **25.12**.

> [!NOTE]
> If you looking for simple and light template engine
> try build-in [ucode](https://github.com/jow-/ucode) utility.

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
apk update
```

### Install required package(s)

```sh
apk add go-task
```
