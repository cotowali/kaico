// Copyright (c) 2021-2023 The Kaico Authors.
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
import kaico.token { Token }
import kaico.source { Pos, Range, Source }

fn test_text() {
	s := Source.from_text('01234')
	r := Range.new(Pos{&s, 2, 1, 3}, Pos{&s, 4, 1, 5})
	t := Token{
		kind: .int_literal
		pos: r
	}
	assert t.text() == '23'
}
