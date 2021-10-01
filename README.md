# bash-semver

Semantic version library for Bash

STATUS: IN DEVELOPMENT

Prior art

| Software | No eval | General purpose
| - | - | -
| bash-semver | Yes | Yes
| [semver-tool] | No | Yes
| [semver_bash] | No | Yes
| [shell-semver] | Yes | No
| [semver.sh] | No | No
| [semtag] | No | Yes

[semver-tool]: https://github.com/fsaintjacques/semver-tool
[semver_bash]: https://github.com/cloudflare/semver_bash
[shell-semver]: https://github.com/fmahnke/shell-semver
[semver.sh]: https://github.com/qzb/sh-semver
[semtag]: https://github.com/nico2sh/semtag/blob/master/semtag

An extra bonus with this project is that you can use it as an actual dependency with Basalt

## Installation

Use [Basalt](https://github.com/hyperupcall/basalt), a Bash package manager, to add this project as a dependency

```sh
basalt add 'hyperupcall/bash-semver'
```

## Roadmap

- Tests
- Ensure Regex works on MacOS
