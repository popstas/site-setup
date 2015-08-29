#!/usr/bin/env bats

@test "site-setup-domain: without domain" {
	run site-setup-domain
	echo >&2 "$output"
	[ $status -eq 1 ]
}

@test "site-setup-domain: new domain" {
	run site-setup-domain --domain example1.com
	echo >&2 "$output"
	[ $status -eq 0 ]
}

@test "site-setup-domain: existing domain" {
	run site-setup-domain --domain example1.com
	echo >&2 "$output"
	[ $status -eq 0 ]
	[ $(expr "${lines[0]}" : "zone example1.com exists") -ne 0 ]
}

@test "site-setup-domain: 3rd level domain" {
	run site-setup-domain --domain test.example.com
	echo >&2 "$output"
	[ $status -eq 0 ]
	[ $(expr "${lines[0]}" : "Only second-level domains are delegated") -ne 0 ]
}
