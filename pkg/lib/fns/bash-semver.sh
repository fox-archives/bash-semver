# shellcheck shell=bash

# Original regex (extended) from semver.org
# ^
# (?P<major>0|[1-9]\d*)
# \.(?P<minor>0|[1-9]\d*)
# \.(?P<patch>0|[1-9]\d*)
# (?:-(?P<prerelease>(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?
# (?:\+(?P<buildmetadata>[0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?
# $

# @description Parse semver version string into its components
bash_semver.parse() {
	unset REPLY; declare -gA REPLY=()
	local version="$1"

	local regex="^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)(-((0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(\.(0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(\+([0-9a-zA-Z-]+(\.[0-9a-zA-Z-]+)*))?"
	if [[ "$version" =~ $regex ]]; then
		printf '%s: %s\n' r1 "${BASH_REMATCH[1]}" # 1
		printf '%s: %s\n' r2 "${BASH_REMATCH[2]}" # 2
		printf '%s: %s\n' r3 "${BASH_REMATCH[3]}" # 3
		printf '%s: %s\n' r4 "${BASH_REMATCH[5]}" # 4
		printf '%s: %s\n' r5 "${BASH_REMATCH[10]}" # 5

		REPLY[major]="${BASH_REMATCH[1]}"
		REPLY[minor]="${BASH_REMATCH[2]}"
		REPLY[patch]="${BASH_REMATCH[3]}"
		REPLY[prerelease]="${BASH_REMATCH[5]}"
		REPLY[buildmetadata]="${BASH_REMATCH[10]}"
	fi
}
