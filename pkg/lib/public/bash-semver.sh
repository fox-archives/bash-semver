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

	# local regex="^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)(-((0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(\.(0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(\+([0-9a-zA-Z-]+(\.[0-9a-zA-Z-]+)*))?"
	# if [[ "$version" =~ $regex ]]; then
	# 	REPLY[major]="${BASH_REMATCH[1]}"
	# 	REPLY[minor]="${BASH_REMATCH[2]}"
	# 	REPLY[patch]="${BASH_REMATCH[3]}"
	# 	REPLY[prerelease]="${BASH_REMATCH[5]}"
	# 	REPLY[buildmetadata]="${BASH_REMATCH[10]}"
	# fi

	local arr=()
	readarray -t arr <<< "$("$BASALT_PACKAGE_DIR/pkg/share/parse.pl" "$version")"
	REPLY[major]="${arr[0]}"
	REPLY[minor]="${arr[1]}"
	REPLY[patch]="${arr[2]}"
	REPLY[prerelease]="${arr[3]}"
	REPLY[buildmetadata]="${arr[4]}"
}
