#!/usr/bin/env bats

@test "new domain" {
	run site-setup-domin --domain example1.com
	[ $status -eq 0 ]
}

@test "existing domain" {
	run site-setup-domin --domain example1.com
	[ $status -eq 0 ]
}

@test "3rd level domain" {
	run site-setup-domin --domain test.example.com
	[ $status -eq 0 ]
}
