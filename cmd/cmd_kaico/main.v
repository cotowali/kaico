// SPDX-License-Identifier: MPL-2.0
//
// Copyright 2021-2024 zakuro <z@kuro.red> (https://x.com/zakuro9715)
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.
module main

import os
import cli
import kaico.builder as _ { Builder }
import kaico.source as _ { Source }

fn main() {
	mut app := cli.Command{
		name: 'kaico'
		description: '' // TODO
		execute: fn (cmd cli.Command) ! {
			s := match cmd.args.len {
				0 { Source.from_text(os.get_raw_lines_joined()) }
				1 { Source.read_file(cmd.args[0])! }
				else { return error('too many files specified') }
			}

			b := Builder.new(s)
			if out := b.build() {
				println(out)
			} else {
				eprintln(err)
				exit(1)
			}
		}
	}
	app.setup()
	app.parse(os.args)
}
