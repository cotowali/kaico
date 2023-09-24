// Copyright (c) 2021-2023 The Kaico Authors.
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
import kaico.source { Pos, Range, Source }

const (
	s  = Source.from_text('')
	p0 = Pos{&s, 0, 1, 1}
	p1 = Pos{&s, 1, 1, 1}
	p2 = Pos{&s, 2, 1, 1}
	p3 = Pos{&s, 3, 1, 1}
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
	assert Range.new(p1, p2).source() == p1.source
}
