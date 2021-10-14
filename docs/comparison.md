# Comparison

There are other Bash scripts that attempt to provide support for semantic versioning. They aren't all directly comparable, but the advantage of this package is that it easily integrates with Basalt and uses the official parsing regex.

Note that this version has a major disadvantage in that it executes `perl` to parse the regex. This should be fixed in a later release

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
