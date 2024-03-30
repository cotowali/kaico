// Copyright (c) 2021-2023 The Kaico Authors.
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
import kaico.token as _ { Token }
import kaico.source as _ { Range, Source }

fn test_text() {
	s := Source.from_text('01234')
	r := Range.new(s.new_pos(offset: 2, line: 1, column: 3), s.new_pos(offset: 4, line: 1, column: 5))
	t := Token{
		kind: .int_literal
		pos: r
	}
	assert t.text() == '23'
}
