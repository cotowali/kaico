// Copyright (c) 2021-2023 The Kaico Authors.
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
module main

import os
import cli
import kaico // vfmt will breake this

fn main() {
	mut app := cli.Command{
		name: 'kaico'
		description: '' // TODO
		execute: fn (cmd cli.Command) ! {
			cmd.execute_help()
		}
		commands: [
			cli.Command{
				name: 'hello'
				execute: fn (cmd cli.Command) ! {
					kaico.hello()
				}
			},
		]
	}
	app.setup()
	app.parse(os.args)
}
