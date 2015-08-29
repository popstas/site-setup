#!/usr/bin/env bats

@test "site-setup: default usage" {
	run site-setup --verbose --debug --rewrite --user example --domain example.com --db example --db_pass example_pass --engine drupal
	echo >&2 "$output"
	[ $status -eq 0 ]
	[ -d /home/example/www/example.com/profiles/minimal ]
}

@test "site-setup: empty engine" {
	run site-setup --verbose --debug --rewrite --user example --domain example.com
	echo >&2 "$output"
	[ $status -eq 0 ]
	[ -d /home/example/www/example.com ]
	[ $(find /home/example/www/example.com -mindepth 1 | wc -l) -eq 0 ]
}

@test "site-setup: install in test directory" {
	run site-setup --verbose --debug --rewrite --user test --domain example.com
	echo >&2 "$output"
	[ $status -eq 0 ]
	[ -f /home/test/www/example.com/.excluded ]
	[ $(grep -c "whitelist" /etc/nginx/sites-enabled/example.com) -eq 1 ]
}

