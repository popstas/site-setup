#!/usr/bin/env bats

@test "site-setup-engine: drupal project" {
	run site-setup-engine --verbose --debug --rewrite --user example --domain example.com --engine project:commerce_kickstart
	echo >&2 "$output"
	[ $status -eq 0 ]
	[ -d /home/example/www/example.com/profiles/commerce_kickstart ]
}

@test "site-setup-engine: local directory" {
	mkdir /usr/local/src/test && touch /usr/local/src/test/index.html
	run site-setup-engine --verbose --debug --rewrite --user example --domain example.com --engine /usr/local/src/test
	echo >&2 "$output"
	[ $status -eq 0 ]
	[ -f /home/example/www/example.com/index.html ]
}

@test "site-setup-engine: unknown" {
	run site-setup-engine --verbose --debug --rewrite --user example --domain example.com --engine foo
	echo >&2 "$output"
	[ $status -eq 1 ]
}

@test "site-setup-engine: makefile" {
echo "core: 7.x
api: '2'
projects:
  drupal:
    version: 7.39" > /tmp/make.yml

	run site-setup-engine --verbose --debug --rewrite --user example --domain example.com --engine /tmp/make.yml
	echo >&2 "$output"
	[ $status -eq 0 ]
	[ -d /home/example/www/example.com/profiles/minimal ]
}
