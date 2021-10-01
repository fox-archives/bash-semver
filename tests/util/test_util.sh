# shellcheck shell=bash

test_util.check() {
	assert [ "${REPLY[major]}" = "${1:-}" ]
	assert [ "${REPLY[minor]}" = "${2:-}" ]
	assert [ "${REPLY[patch]}" = "${3:-}" ]
	assert [ "${REPLY[prerelease]}" = "${4:-}" ]
	assert [ "${REPLY[buildmetadata]}" = "${5:-}" ]
}
