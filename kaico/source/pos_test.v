// Copyright (c) 2021-2023 The Kaico Authors.
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
import kaico.source as _ { Range, Source }

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

fn test_in_range() {
	s := Source.from_text('abcdefg')
	p1 := s.new_pos(offset: 1, line: 1, column: 2)
	p2 := s.new_pos(offset: 2, line: 1, column: 3)
	p3 := s.new_pos(offset: 3, line: 1, column: 4)
	p4 := s.new_pos(offset: 4, line: 1, column: 5)
	p5 := s.new_pos(offset: 5, line: 1, column: 6)
	r24 := Range.new(p2, p4)
	assert !p1.in_range(r24)
	assert p2.in_range(r24)
	assert p3.in_range(r24)
	assert !p4.in_range(r24)
	assert !p5.in_range(r24)
}
