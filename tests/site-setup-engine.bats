#!/usr/bin/env bats

@test "engine drupal project" {
	run site-setup-engine --verbose --debug --rewrite --user example --domain example.com --engine project:commerce_kickstart
	[ $status -eq 0 ]
	[ -d /home/example/www/example.com/profiles/commerce_kickstart ]
}

@test "engine local directory" {
	mkdir /usr/local/src/test && touch /usr/local/src/test/index.html
	run site-setup-engine --verbose --debug --rewrite --user example --domain example.com --engine /usr/local/src/test
	[ $status -eq 0 ]
	[ -f /home/example/www/example.com/index.html ]
}

@test "engine unknown" {
	run site-setup-engine --verbose --debug --rewrite --user example --domain example.com --engine foo
	[ $status -eq 1 ]
}

@test "engine empty" {
	run site-setup --verbose --debug --rewrite --user example --domain example.com
	[ $status -eq 0 ]
	[ -d /home/example/www/example.com ]
	[ $(find /home/example/www/example.com | wc -l) -eq 0 ]
}
