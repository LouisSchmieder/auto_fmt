module main

import os

fn main() {
	res := os.execute_or_panic('git diff --name-only')

	for line in res.output.split_into_lines() {
		if line.ends_with('.v') {
			r := os.execute_or_panic('v fmt -w $line')
			eprint(r.output)
		}
	}
}