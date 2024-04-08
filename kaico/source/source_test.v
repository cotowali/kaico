// SPDX-License-Identifier: MPL-2.0
//
// Copyright 2021-2024 zakuro <z@kuro.red> (https://x.com/zakuro9715)
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.
import os
import kaico.source { Source }

fn test_from_text() {
	assert Source.from_text('text') == Source{
		kind: .text
		path: ''
		code: 'text'
	}
}

fn test_read_file() ! {
	assert Source.read_file(@FILE)! == Source{
		kind: .local_file
		path: @FILE
		code: os.read_file(@FILE)!
	}

	if _ := Source.read_file('__notfound__') {
		assert false
	} else {
		assert err.msg().contains('__notfound__')
	}
}
