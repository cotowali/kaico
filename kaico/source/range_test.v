// Copyright (c) 2021-2023 The Kaico Authors.
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
import kaico.source { Pos, Range, Source }

const (
	p0 = Pos{none, 0, 1, 1}
	p1 = Pos{none, 1, 1, 1}
	p2 = Pos{none, 2, 1, 1}
	p3 = Pos{none, 3, 1, 1}
)

fn test_new() {
	assert Range.new(p1, p2) == Range{p1, p2}
	assert Range.new(p2, p1) == Range{p1, p2}
}

fn test_extend() {
	assert Range.new(p1, p2).extend(p3) == Range{p1, p3}
	assert Range.new(p1, p2).extend(p0) == Range{p0, p2}

	assert Range.new(p1, p2).extend(p1) == Range{p1, p2}
	assert Range.new(p1, p2).extend(p2) == Range{p1, p2}
}

fn test_len() {
	assert Range.new(p1, p3).len() == p3.offset - p1.offset
}

fn test_source() {
	s := Source.from_text('')
	sp1 := Pos{
		...p1
		source: s
	}
	sp2 := Pos{
		...p2
		source: s
	}
	s1 := Range.new(p1, p2).source()
	assert s1 == none
	s2 := Range.new(p1, sp2).source()
	assert s2 == none
	s3 := Range.new(sp1, sp2).source() or { panic('') }
	assert s3 == sp1.source or { panic('') }
	s4 := Range.new(sp1, p2).source() or { panic('') }
	assert s4 == sp1.source or { panic('') }
}
