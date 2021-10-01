#!/usr/bin/env bats

load './util/init.sh'

@test "Parses semver string properly" {
	bash_semver.parse '0.0.4'
	test_util.check 0 0 4

	bash_semver.parse '1.2.3'
	test_util.check 1 2 3

	bash_semver.parse '10.20.30'
	test_util.check 10 20 30

	bash_semver.parse '1.1.2-prerelease+meta'
	test_util.check 1 1 2 prerelease meta

}
