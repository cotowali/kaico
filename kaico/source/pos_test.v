// Copyright (c) 2021-2023 The Kaico Authors.
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
import kaico.source { Source }

fn test_op() {
	s := Source.from_text('')
	p1 := s.new_pos(offset: 1, line: 1, column: 2)
	p2 := s.new_pos(offset: 2, line: 1, column: 3)
	assert p1 < p2
	assert !(p2 < p2)

	assert p1 <= p1
	assert p1 <= p2
	assert !(p2 <= p1)

	assert p2 > p1
	assert !(p1 > p2)

	assert p2 >= p2
	assert p2 >= p1
	assert !(p1 >= p2)

	assert p1 == p1
	assert !(p1 == p2)
	assert p1 != p2
	assert !(p1 != p1)
}
