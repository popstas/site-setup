#!/usr/bin/env bash

export BATS_TEST=1
export BATS_TEST_ROOT=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

command -v bats >/dev/null 2>&1 || {
	read -p "bats required but it's not installed, install bats? (y/n)? " -n 1 -r
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		git clone https://github.com/sstephenson/bats.git /usr/local/src/bats
		cd /usr/local/src/bats
		./install.sh /usr/local
	fi
}

command -v bats >/dev/null 2>&1 || {
	echo >&2 "bats required but it's not installed, aborting."
	echo >&2 "https://github.com/sstephenson/bats"
	exit 1
}

cd "$BATS_TEST_ROOT"

export PATH="$BATS_TEST_ROOT/bin:$PATH"

. lib/init

options=""
test_module="$1"
if [ "$test_module" = "--tap" ]; then
	test_module=""
	options="$options --tap"
fi
test_path="$BATS_TEST_ROOT/test/$test_module.bats"
if [ -n "$test_module" ]; then
	if [ -r "$test_path" ]; then
		bats $options "$test_path"
	else
		echo >&2 "test $test_module not exists, aborting."
		exit 1
	fi
else
	bats $options "$BATS_TEST_ROOT/test"
fi
