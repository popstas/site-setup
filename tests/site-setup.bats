#!/usr/bin/env bats

@test "default usage" {
	run site-setup --verbose --debug --domain example.com --user example --db example --db_pass example_pass --engine drupal --rewrite
	[ $status -eq 0 ]
	[ -d /home/example/www/example.com/profiles/minimal ]
}
