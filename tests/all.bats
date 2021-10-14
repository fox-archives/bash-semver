#!/usr/bin/env bats

load './util/init.sh'

# Test cases from https://regex101.com/r/Ly7O1x/3/
@test "Parses semver string properly" {
	bash_semver.parse '0.0.4'
	test_util.check 0 0 4

	bash_semver.parse '1.2.3'
	test_util.check 1 2 3

	# bash_semver.parse '10.20.30'
	# test_util.check 10 20 30

	bash_semver.parse '1.1.2-prerelease+meta'
	test_util.check 1 1 2 prerelease meta

	bash_semver.parse '1.1.2+meta'
	test_util.check 1 1 2 '' meta

	bash_semver.parse '1.1.2+meta-valid'
	test_util.check 1 1 2 '' meta-valid

	bash_semver.parse '1.0.0-alpha'
	test_util.check 1 0 0 alpha

	bash_semver.parse '1.0.0-beta'
	test_util.check 1 0 0 beta

	bash_semver.parse '1.0.0-alpha.beta'
	test_util.check 1 0 0 alpha.beta

	bash_semver.parse '1.0.0-alpha.beta.1'
	test_util.check 1 0 0 alpha.beta.1

	bash_semver.parse '1.0.0-alpha.1'
	test_util.check 1 0 0 alpha.1

	bash_semver.parse '1.0.0-alpha0.valid'
	test_util.check 1 0 0 alpha0.valid

	# bash_semver.parse '1.0.0-alpha.0valid'
	# test_util.check 1 0 0 alpha.0valid

	bash_semver.parse '1.0.0-alpha-a.b-c-somethinglong+build.1-aef.1-its-okay'
	test_util.check 1 0 0 alpha-a.b-c-somethinglong build.1-aef.1-its-okay

	bash_semver.parse '1.0.0-rc.1+build.1'
	test_util.check 1 0 0 rc.1 build.1

	bash_semver.parse '2.0.0-rc.1+build.123'
	test_util.check 2 0 0 rc.1 build.123

	bash_semver.parse '1.2.3-beta'
	test_util.check 1 2 3 beta

	# bash_semver.parse '10.2.3-DEV-SNAPSHOT'
	# test_util.check 10 2 3 DEV-SNAPSHOT

	bash_semver.parse '1.2.3-SNAPSHOT-123'
	test_util.check 1 2 3 SNAPSHOT-123

	bash_semver.parse '1.0.0'
	test_util.check 1 0 0

	bash_semver.parse '2.0.0'
	test_util.check 2 0 0

	bash_semver.parse '1.1.7'
	test_util.check 1 1 7

	bash_semver.parse '2.0.0+build.1848'
	test_util.check 2 0 0 '' build.1848

	# bash_semver.parse '2.0.1-alpha.1227'
	# test_util.check 2 0 1 alpha.1227

	bash_semver.parse '1.0.0-alpha+beta'
	test_util.check 1 0 0 alpha beta

	# bash_semver.parse '1.2.3----RC-SNAPSHOT.12.9.1--.12+788'
	# test_util.check 1 2 3 ---RC-SNAPSHOT.12.9.1--.12 788

	# bash_semver.parse '1.2.3----R-S.12.9.1--.12+meta'
	# test_util.check 1 2 3 ---R-S.12.9.1--.12 meta

	# bash_semver.parse '1.2.3----RC-SNAPSHOT.12.9.1--.12'
	# test_util.check 1 2 3 ---RC-SNAPSHOT.12.9.1--.12

	bash_semver.parse '1.0.0+0.build.1-rc.10000aaa-kk-0.1'
	test_util.check 1 0 0 '' 0.build.1-rc.10000aaa-kk-0.1

	# bash_semver.parse '99999999999999999999999.999999999999999999.99999999999999999'
	# test_util.check 99999999999999999999999 999999999999999999 99999999999999999

	# bash_semver.parse '1.0.0-0A.is.legal'
	# test_util.check 1 0 0 0A.is.legal

}
